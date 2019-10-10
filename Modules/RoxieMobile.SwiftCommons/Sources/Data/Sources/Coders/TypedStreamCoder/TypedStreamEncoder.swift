// ----------------------------------------------------------------------------
//
//  TypedStreamEncoder.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsLang
import SwiftCommonsLogging

// ----------------------------------------------------------------------------

public final class TypedStreamEncoder: AbstractEncoder, TypedStreamCoder
{
// MARK: - Construction

    /// TODO
    public override init(
            forWritingInto data: NSMutableData? = nil,
            failurePolicy policy: CodingFailurePolicy = .setErrorAndReturn
    ) {
        // Parent processing
        super.init(forWritingInto: data, failurePolicy: policy)
    }

// MARK: - Properties

    /// The system version in effect for the archive.
    public override var systemVersion: UInt32 {
        return UInt32(_coderVersion())
    }

// MARK: - Methods

    /// Encodes a value of the given type at the given address.
    ///
    /// - Parameters:
    ///   - type: A type code.
    ///   - addr: The address of the object to encode.
    ///
    public override func encodeValue(ofObjCType type: UnsafePointer<Int8>, at addr: UnsafeRawPointer) {
        try? _encodeWithErrorHandling { [weak self] in
            self?._encodeValue(ofObjCType: type, at: addr)
        }
    }

    /// Encodes `object`.
    ///
    /// - Parameters:
    ///   - object: The object to encode.
    ///
    public override func encode(_ object: Any?) {
        try? _encodeWithErrorHandling { [weak self] in
            self?._encode(object)
        }
    }

    /// Encodes a given `Data` object.
    ///
    /// - Parameters:
    ///   - data: The data to encode.
    ///
    public override func encode(_ data: Data) {
        try? _encodeWithErrorHandling { [weak self] in
            self?._encode(data)
        }
    }

    /// Encodes a buffer of data of an unspecified type.
    ///
    /// - Parameters:
    ///   - byteaddr: The address of the buffer to encode.
    ///   - length:   The length of the buffer.
    ///
    public override func encodeBytes(_ byteaddr: UnsafeRawPointer?, length: Int) {
        try? _encodeWithErrorHandling { [weak self] in
            self?._encodeBytes(byteaddr, length: length)
        }
    }

// MARK: - Variables

    private var didWriteHeader = false

    private var archiveIndex: UInt = 0
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension TypedStreamEncoder
{
// MARK: - Private Methods

    private func _encodeValue(ofObjCType typep: UnsafePointer<Int8>, at addr: UnsafeRawPointer) {

        let type = typep.pointee
        switch (type) {

            case Types.C_ID:
                let ptr = addr.assumingMemoryBound(to: Any.self)
                _encodeObject(ptr.pointee as AnyObject?)

            case Types.C_CLASS:
                let ptr = addr.assumingMemoryBound(to: Any.self)
                _encodeClass(ptr.pointee as? AnyClass)

            case Types.C_ATOM, Types.C_CHARPTR:
                let ptr = addr.assumingMemoryBound(to: UnsafePointer<CChar>.self)
                let length = strlen(ptr.pointee)

                _writeType(type)
                _encodeBytes(ptr.pointee, length: length)

            case Types.C_CHR:
                let ptr = addr.assumingMemoryBound(to: CChar.self)
                _writeChar(ptr.pointee, withType: true)

            case Types.C_UCHR:
                let ptr = addr.assumingMemoryBound(to: CUnsignedChar.self)
                _writeUnsignedChar(ptr.pointee, withType: true)

            case Types.C_SHT:
                let ptr = addr.assumingMemoryBound(to: CShort.self)
                _writeShort(ptr.pointee, withType: true)

            case Types.C_USHT:
                let ptr = addr.assumingMemoryBound(to: CUnsignedShort.self)
                _writeUnsignedShort(ptr.pointee, withType: true)

            case Types.C_INT:
                let ptr = addr.assumingMemoryBound(to: CInt.self)
                _writeInt(ptr.pointee, withType: true)

            case Types.C_UINT:
                let ptr = addr.assumingMemoryBound(to: CUnsignedInt.self)
                _writeUnsignedInt(ptr.pointee, withType: true)

            case Types.C_LNG:
                let ptr = addr.assumingMemoryBound(to: CLong.self)
                _writeLong(ptr.pointee, withType: true)

            case Types.C_ULNG:
                let ptr = addr.assumingMemoryBound(to: CUnsignedLong.self)
                _writeUnsignedLong(ptr.pointee, withType: true)

            case Types.C_LNG_LNG:
                let ptr = addr.assumingMemoryBound(to: CLongLong.self)
                _writeLongLong(ptr.pointee, withType: true)

            case Types.C_ULNG_LNG:
                let ptr = addr.assumingMemoryBound(to: CUnsignedLongLong.self)
                _writeUnsignedLongLong(ptr.pointee, withType: true)

            case Types.C_FLT:
                let ptr = addr.assumingMemoryBound(to: CFloat.self)
                _writeFloat(ptr.pointee, withType: true)

            case Types.C_DBL:
                let ptr = addr.assumingMemoryBound(to: CDouble.self)
                _writeDouble(ptr.pointee, withType: true)

            case Types.C_BOOL:
                let ptr = addr.assumingMemoryBound(to: Bool.self)
                _writeBool(ptr.pointee, withType: true)

            default:
                UnsupportedTypeException.raise(withType: type)
        }
    }

    private func _encode(_ object: Any?) {
        var itemType = _isInstance(object) ? Types.C_ID : Types.C_CLASS

        withUnsafePointer(to: object) { (ptr: UnsafePointer<Any?>) -> Void in
            _encodeValue(ofObjCType: &itemType, at: UnsafeRawPointer(ptr))
        }
    }

    private func _encodeObject(_ object: AnyObject?) {
        let itemType = Types.C_ID

        let replacement = object?.replacementObject(for: self) as AnyObject?
        guard let object = (replacement ?? object) else {

            // Write a nil object
            _writeType(itemType, asReference: true)
            _writeUnsignedChar(0)

            return
        }

        let isCollectable = _isCollectable(object)

        // Check if object was already written
        if isCollectable, let key = (object as? AnyHashable), let archiveId = self.collectedObjects[key] {

            // Write a reference to collected object
            _writeType(itemType, asReference: true)
            _writeUnsignedInteger(archiveId)
        }
        else {

            // Increment archive index
            self.archiveIndex += 1

            // Store object index
            if isCollectable, let key = object as? AnyHashable {
                self.collectedObjects[key] = self.archiveIndex
            }

            // Write an object
            _writeType(itemType)
            _writeUnsignedInteger(self.archiveIndex)

            let clazz: AnyClass = (object as? NSObject)?.classForCoder ?? Swift.type(of: object)
            _encodeClass(clazz)

            if let codableObject = (object as? NSCoding) {
                codableObject.encode(with: self)
            }
            else {
                InvalidArgumentException.raise(
                        reason: "Passed object can not be encoded, because it did not adopts ‘NSCoding’ protocol.")
            }
        }
    }

    private func _encodeClass(_ clazz: AnyClass?) {
        let itemType = Types.C_CLASS

        guard let clazz = clazz else {

            // Write a nil object
            _writeType(itemType, asReference: true)
            _writeUnsignedChar(0)

            return
        }

        let className = NSStringFromClass(clazz)

        // Check if class was already written
        if let archiveId = self.collectedClasses[className] {

            // Write a reference to collected class
            _writeType(itemType, asReference: true)
            _writeUnsignedInteger(archiveId)
        }
        else {

            // Increment archive index
            self.archiveIndex += 1

            // Store class index
            self.collectedClasses[className] = self.archiveIndex

            // Write a class object
            _writeType(itemType)
            _writeUnsignedInteger(self.archiveIndex)

            _writeString(className)
            _writeInteger(clazz.version())
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension TypedStreamEncoder
{
// MARK: - Private Methods

    private func _encodeWithErrorHandling(action: @escaping () -> Void) throws -> Void {
        try _executeWithErrorHandling {
            self._writeArchiveHeader()
            action()
        }
    }

    private func _writeArchiveHeader() {

        if !self.didWriteHeader {
            self.didWriteHeader = true

            // Write archive header
            _writeString(_coderSignature(), withType: true)
            _writeUnsignedShort(_coderVersion())
        }
    }

    private func _isCollectable(_ object: AnyObject) -> Bool {
        switch object {

            case is NSString, is NSNumber, is NSNull, is NSValue, is NSData:
                return true

            case is NSDictionary, is NSArray, is ValidatableModel:
                return false

            default:
                let className = Reflection(of: self).type.fullName
                Logger.v(TypedStreamEncoder.self, "Is object of class ‘\(className)’ is collectable?")
                return false
        }
    }
}

// ----------------------------------------------------------------------------
