// ----------------------------------------------------------------------------
//
//  TypedStreamEncoder.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommonsLang
import SwiftCommonsLogging

// ----------------------------------------------------------------------------

public final class TypedStreamEncoder: AbstractEncoder, TypedStreamCoder {

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

extension TypedStreamEncoder {

// MARK: - Private Methods

    private func _encodeValue(ofObjCType typep: UnsafePointer<Int8>, at addr: UnsafeRawPointer) {
        // swiftlint:disable:previous cyclomatic_complexity function_body_length

        let type = ObjCType(typep.pointee)
        switch (type) {

            case .ID:
                let ptr = addr.assumingMemoryBound(to: Any.self)
                _encodeObject(ptr.pointee as AnyObject?)

            case .Class:
                let ptr = addr.assumingMemoryBound(to: Any.self)
                _encodeClass(ptr.pointee as? AnyClass)

            case .Atom, .CharPtr:
                let ptr = addr.assumingMemoryBound(to: UnsafePointer<CChar>.self)
                let length = strlen(ptr.pointee)

                _writeType(type)
                _encodeBytes(ptr.pointee, length: length)

            case .Char:
                let ptr = addr.assumingMemoryBound(to: CChar.self)
                _writeChar(ptr.pointee, withType: true)

            case .UChar:
                let ptr = addr.assumingMemoryBound(to: CUnsignedChar.self)
                _writeUnsignedChar(ptr.pointee, withType: true)

            case .Short:
                let ptr = addr.assumingMemoryBound(to: CShort.self)
                _writeShort(ptr.pointee, withType: true)

            case .UShort:
                let ptr = addr.assumingMemoryBound(to: CUnsignedShort.self)
                _writeUnsignedShort(ptr.pointee, withType: true)

            case .Int:
                let ptr = addr.assumingMemoryBound(to: CInt.self)
                _writeInt(ptr.pointee, withType: true)

            case .UInt:
                let ptr = addr.assumingMemoryBound(to: CUnsignedInt.self)
                _writeUnsignedInt(ptr.pointee, withType: true)

            case .Long:
                let ptr = addr.assumingMemoryBound(to: CLong.self)
                _writeLong(ptr.pointee, withType: true)

            case .ULong:
                let ptr = addr.assumingMemoryBound(to: CUnsignedLong.self)
                _writeUnsignedLong(ptr.pointee, withType: true)

            case .LongLong:
                let ptr = addr.assumingMemoryBound(to: CLongLong.self)
                _writeLongLong(ptr.pointee, withType: true)

            case .ULongLong:
                let ptr = addr.assumingMemoryBound(to: CUnsignedLongLong.self)
                _writeUnsignedLongLong(ptr.pointee, withType: true)

            case .Float:
                let ptr = addr.assumingMemoryBound(to: CFloat.self)
                _writeFloat(ptr.pointee, withType: true)

            case .Double:
                let ptr = addr.assumingMemoryBound(to: CDouble.self)
                _writeDouble(ptr.pointee, withType: true)

            case .Bool:
                let ptr = addr.assumingMemoryBound(to: Bool.self)
                _writeBool(ptr.pointee, withType: true)

            default:
                UnsupportedTypeException.raise(withType: type)
        }
    }

    private func _encode(_ object: Any?) {
        let itemType: ObjCType = _isInstance(object) ? .ID : .Class

        withUnsafePointer(to: object) { (ptr: UnsafePointer<Any?>) -> Void in
            var type = itemType.rawValue
            _encodeValue(ofObjCType: &type, at: UnsafeRawPointer(ptr))
        }
    }

    private func _encodeObject(_ object: AnyObject?) {
        let itemType: ObjCType = .ID

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
                let message = "Passed object can not be encoded, because it did not adopts `NSCoding` protocol."
                InvalidArgumentException.raise(reason: message)
            }
        }
    }

    private func _encodeClass(_ clazz: AnyClass?) {
        let itemType: ObjCType = .Class

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

extension TypedStreamEncoder {

// MARK: - Private Methods

    private func _encodeWithErrorHandling(action: @escaping () -> Void) throws {
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
        switch (object) {

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
