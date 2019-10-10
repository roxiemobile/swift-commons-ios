// ----------------------------------------------------------------------------
//
//  TypedStreamDecoder.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsConcurrent
import SwiftCommonsLang

// ----------------------------------------------------------------------------

public final class TypedStreamDecoder: AbstractDecoder, TypedStreamCoder
{
// MARK: - Construction

    /// TODO
    public override init(
            forReadingFrom data: NSData,
            failurePolicy policy: CodingFailurePolicy = .setErrorAndReturn
    ) {
        // Parent processing
        super.init(forReadingFrom: data, failurePolicy: policy)
    }

// MARK: - Properties

    /// Returns the system version number in effect when the archive was created
    /// or `0` if version was not read.
    public override var systemVersion: UInt32 {

        var version = self.encoderVersion
        if (version == Inner.UnknownEncoderVersion) {

            try? _decodeWithErrorHandling { [weak self] in
                version = self?.encoderVersion ?? Inner.UnknownEncoderVersion
            }
        }
        return version
    }

// MARK: - Methods

    /// Decodes a single value of a known type from the specified data buffer.
    ///
    /// - Parameters:
    ///   - type: A type code.
    ///   - addr: The address of the object to encode.
    ///
    public override func decodeValue(ofObjCType type: UnsafePointer<Int8>, at addr: UnsafeMutableRawPointer) {
        try? _decodeWithErrorHandling { [weak self] in
            self?._decodeValue(ofObjCType: type, at: addr)
        }
    }

    /// Decodes an object that was previously encoded.
    ///
    /// - Returns:
    ///   The decoded object.
    ///
    public override func decodeObject() -> Any? {
        var object: Any? = nil

        try? _decodeWithErrorHandling { [weak self] in
            object = self?._decodeObject()
        }
        return object
    }

    /// Decodes an `Data` object that was previously encoded.
    ///
    /// - Returns:
    ///   The decoded data.
    ///
    public override func decodeData() -> Data? {
        var data: Data? = nil

        try? _decodeWithErrorHandling { [weak self] in
            data = self?._decodeData()
        }
        return data
    }

    /// Decodes a buffer of data whose types are unspecified.
    ///
    /// - Parameters:
    ///   - lengthp: Upon return, contains the number of bytes returned.
    ///
    /// - Returns:
    ///   The reference to a buffer of decoded bytes.
    ///
    public override func decodeBytes(withReturnedLength lengthp: UnsafeMutablePointer<Int>) -> UnsafeMutableRawPointer? {
        var bytes: UnsafeMutableRawPointer? = nil

        try? _decodeWithErrorHandling { [weak self] in
            bytes = self?._decodeBytes(withReturnedLength: lengthp)
        }
        return bytes
    }

    /// Returns version in effect for the class named `className` or `NSNotFound`
    /// if no class named `className` exists.
    ///
    /// - Parameter:
    ///   - className: The class name.
    ///
    /// - Returns:
    ///   The version number of the class being decoded.
    ///
    public override func version(forClassName className: String) -> Int {
        var version: Int? = nil

        try? _decodeWithErrorHandling { [weak self] in
            version = self?._version(forClassName: className)
        }
        return version ?? NSNotFound
    }

// MARK: - Constants

    private struct Inner
    {
        static let UnknownEncoderVersion: UInt32 = 0
    }

// MARK: - Variables

    private var didReadHeader = false

    private var encoderVersion = Inner.UnknownEncoderVersion
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension TypedStreamDecoder
{
// MARK: - Private Methods

    private func _decodeValue(ofObjCType typep: UnsafePointer<Int8>, at addr: UnsafeMutableRawPointer) {

        let value = _readType()
        let isReference = _isReference(value)
        let itemType = _valueOfType(value)

        let type = typep.pointee
        switch (type) {

            case Types.C_ID:
                _checkType(type: itemType, reqType: Types.C_ID)
                let ptr = addr.initializeMemory(as: AnyObject?.self, repeating: nil, count: 1)

                if let object = _decodeObject(isReference) as AnyObject? {
                    ptr.pointee = object
                }

            case Types.C_CLASS:
                _checkType(type: itemType, reqType: Types.C_CLASS)
                let ptr = addr.initializeMemory(as: AnyClass?.self, repeating: nil, count: 1)

                if let clazz = _decodeClass(isReference) {
                    ptr.pointee = clazz
                }

            case Types.C_ATOM, Types.C_CHARPTR:
                _checkTypePair(type: itemType, reqType1: Types.C_ATOM, reqType2: Types.C_CHARPTR)
                let ptr = addr.initializeMemory(as: UnsafePointer<CChar>?.self, repeating: nil, count: 1)

                let length = _readInteger()
                if (length > 0) {

                    if let addr = calloc(length + 1, MemoryLayout<CChar>.size) {
                        _readBytes(addr, length: length)
                        ptr.pointee = UnsafeRawPointer(addr).assumingMemoryBound(to: CChar.self)
                    }
                }

            case Types.C_CHR:
                _checkType(type: itemType, reqType: Types.C_CHR)
                addr.assumingMemoryBound(to: CChar.self).pointee = _readChar()

            case Types.C_UCHR:
                _checkType(type: itemType, reqType: Types.C_UCHR)
                addr.assumingMemoryBound(to: CUnsignedChar.self).pointee = _readUnsignedChar()

            case Types.C_SHT:
                _checkType(type: itemType, reqType: Types.C_SHT)
                addr.assumingMemoryBound(to: CShort.self).pointee = _readShort()

            case Types.C_USHT:
                _checkType(type: itemType, reqType: Types.C_USHT)
                addr.assumingMemoryBound(to: CUnsignedShort.self).pointee = _readUnsignedShort()

            case Types.C_INT:
                _checkType(type: itemType, reqType: Types.C_INT)
                addr.assumingMemoryBound(to: CInt.self).pointee = _readInt()

            case Types.C_UINT:
                _checkType(type: itemType, reqType: Types.C_UINT)
                addr.assumingMemoryBound(to: CUnsignedInt.self).pointee = _readUnsignedInt()

            case Types.C_LNG:
                _checkType(type: itemType, reqType: Types.C_LNG)
                addr.assumingMemoryBound(to: CLong.self).pointee = _readLong()

            case Types.C_ULNG:
                _checkType(type: itemType, reqType: Types.C_ULNG)
                addr.assumingMemoryBound(to: CUnsignedLong.self).pointee = _readUnsignedLong()

            case Types.C_LNG_LNG:
                _checkType(type: itemType, reqType: Types.C_LNG_LNG)
                addr.assumingMemoryBound(to: CLongLong.self).pointee = _readLongLong()

            case Types.C_ULNG_LNG:
                _checkType(type: itemType, reqType: Types.C_ULNG_LNG)
                addr.assumingMemoryBound(to: CUnsignedLongLong.self).pointee = _readUnsignedLongLong()

            case Types.C_FLT:
                _checkType(type: itemType, reqType: Types.C_FLT)
                addr.assumingMemoryBound(to: CFloat.self).pointee = _readFloat()

            case Types.C_DBL:
                _checkType(type: itemType, reqType: Types.C_DBL)
                addr.assumingMemoryBound(to: CDouble.self).pointee = _readDouble()

            case Types.C_BOOL:
                _checkType(type: itemType, reqType: Types.C_BOOL)
                addr.assumingMemoryBound(to: CBool.self).pointee = _readBool()

            default:
                UnsupportedTypeException.raise(withType: itemType)
        }
    }

    private func _decodeObject() -> Any? {
        var object: AnyObject? = nil

        withUnsafeMutablePointer(to: &object) { (ptr: UnsafeMutablePointer<AnyObject?>) -> Void in
            var itemType = Types.C_ID
            _decodeValue(ofObjCType: &itemType, at: UnsafeMutableRawPointer(ptr))
        }
        return object
    }

    private func _decodeObject(_ isReference: Bool) -> Any? {

        let archiveIndex = _readUnsignedInteger()
        var object: AnyObject? = nil

        // Nil object or unused conditional object
        guard (archiveIndex > 0) else {
            return nil
        }

        if (isReference) {
            object = self.collectedObjects[archiveIndex]
            if (object == nil) {
                InconsistentArchiveException.raise(reason: "Did not find referenced object ‘\(archiveIndex)’.")
            }
        }
        else {

            var clazz: AnyClass? = nil
            var itemType = Types.C_CLASS

            // Decode class info
            _decodeValue(ofObjCType: &itemType, at: &clazz)

            guard let decodedClass = (clazz as? NSCoding.Type) else {
                InconsistentArchiveException.raise(reason: "Could not decode class for object.")
                return nil
            }

            // Decode an object
            guard let decodedObject = decodedClass.init(coder: self) else {
                InconsistentArchiveException.raise(reason: "Could not decode object of class ‘\(NSStringFromClass(decodedClass))’.")
                return nil
            }

            // Store a decoded object
            object = ((decodedObject as? NSObject)?.awakeAfter(using: self) as AnyObject?) ?? decodedObject
            self.collectedObjects[archiveIndex] = object!
        }

        // Done
        return object
    }

    private func _decodeClass(_ isReference: Bool) -> AnyClass? {

        let archiveIndex = _readUnsignedInteger()
        var clazz: AnyClass? = nil

        // Nil object or unused conditional object
        guard (archiveIndex > 0) else {
            return nil
        }

        if (isReference) {
            clazz = self.collectedClasses[archiveIndex]
            if (clazz == nil) {
                InconsistentArchiveException.raise(reason: "Did not find referenced class ‘\(archiveIndex)’.")
            }
        }
        else {

            // Decode class info
            let className = _readString()
            let classVersion = _readInteger()

            // Decode a class
            guard let decodedClass = NSClassFromString(className) else {
                InconsistentArchiveException.raise(reason: "Class ‘\(className)’ doesn't exist in this runtime.")
                return nil
            }

            let runtimeClassVersion = decodedClass.version()
            if (classVersion != runtimeClassVersion) {
                InconsistentArchiveException.raise(reason: "Versions of class ‘\(className)’ do not match (encoded ‘\(classVersion)’, runtime ‘\(runtimeClassVersion)’).")
            }

            // Store a decoded class
            clazz = decodedClass
            self.collectedClasses[archiveIndex] = clazz!
            self.collectedVersionsOfClasses[className] = classVersion
        }

        // Done
        return clazz
    }
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension TypedStreamDecoder
{
// MARK: - Private Methods

    private func _decodeWithErrorHandling(action: @escaping () -> Void) throws -> Void {
        try _executeWithErrorHandling {
            self._readArchiveHeader()
            action()
        }
    }

    private func _readArchiveHeader() {

        if !self.didReadHeader {
            self.didReadHeader = true

            // Read archive header
            let signature = _readString(withType: true)
            let version = _readUnsignedShort()

            // Validate values, which was read
            if (signature != _coderSignature()) {
                InconsistentArchiveException.raise(
                        reason: "Used a different coder (signature ‘\(signature)’, version ‘\(version)’).")
            }
            else if (version != _coderVersion()) {
                InconsistentArchiveException.raise(
                        reason: "Used a different coder version (encoder ‘\(version)’, decoder ‘\(_coderVersion())’).")
            }

            // Store version of encoder
            self.encoderVersion = UInt32(version)
        }
    }
}

// ----------------------------------------------------------------------------
