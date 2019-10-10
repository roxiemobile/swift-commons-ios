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
            forReadingFrom data: Data,
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

        var isReference = false
        let decodedType = _readType(isReference: &isReference)

        let type = ObjCType(typep.pointee)
        switch (type) {

            case .ID:
                _checkType(type: decodedType, reqType: .ID)
                let ptr = addr.initializeMemory(as: AnyObject?.self, repeating: nil, count: 1)

                if let object = _decodeObject(isReference) as AnyObject? {
                    ptr.pointee = object
                }

            case .Class:
                _checkType(type: decodedType, reqType: .Class)
                let ptr = addr.initializeMemory(as: AnyClass?.self, repeating: nil, count: 1)

                if let clazz = _decodeClass(isReference) {
                    ptr.pointee = clazz
                }

            case .Atom, .CharPtr:
                _checkTypePair(type: decodedType, reqType1: .Atom, reqType2: .CharPtr)
                let ptr = addr.initializeMemory(as: UnsafePointer<CChar>?.self, repeating: nil, count: 1)

                let length = _readInteger()
                if (length > 0) {

                    if let addr = calloc(length + 1, MemoryLayout<CChar>.size) {
                        _readBytes(addr, length: length)
                        ptr.pointee = UnsafeRawPointer(addr).assumingMemoryBound(to: CChar.self)
                    }
                }

            case .Char:
                _checkType(type: decodedType, reqType: .Char)
                addr.assumingMemoryBound(to: CChar.self).pointee = _readChar()

            case .UChar:
                _checkType(type: decodedType, reqType: .UChar)
                addr.assumingMemoryBound(to: CUnsignedChar.self).pointee = _readUnsignedChar()

            case .Short:
                _checkType(type: decodedType, reqType: .Short)
                addr.assumingMemoryBound(to: CShort.self).pointee = _readShort()

            case .UShort:
                _checkType(type: decodedType, reqType: .UShort)
                addr.assumingMemoryBound(to: CUnsignedShort.self).pointee = _readUnsignedShort()

            case .Int:
                _checkType(type: decodedType, reqType: .Int)
                addr.assumingMemoryBound(to: CInt.self).pointee = _readInt()

            case .UInt:
                _checkType(type: decodedType, reqType: .UInt)
                addr.assumingMemoryBound(to: CUnsignedInt.self).pointee = _readUnsignedInt()

            case .Long:
                _checkType(type: decodedType, reqType: .Long)
                addr.assumingMemoryBound(to: CLong.self).pointee = _readLong()

            case .ULong:
                _checkType(type: decodedType, reqType: .ULong)
                addr.assumingMemoryBound(to: CUnsignedLong.self).pointee = _readUnsignedLong()

            case .LongLong:
                _checkType(type: decodedType, reqType: .LongLong)
                addr.assumingMemoryBound(to: CLongLong.self).pointee = _readLongLong()

            case .ULongLong:
                _checkType(type: decodedType, reqType: .ULongLong)
                addr.assumingMemoryBound(to: CUnsignedLongLong.self).pointee = _readUnsignedLongLong()

            case .Float:
                _checkType(type: decodedType, reqType: .Float)
                addr.assumingMemoryBound(to: CFloat.self).pointee = _readFloat()

            case .Double:
                _checkType(type: decodedType, reqType: .Double)
                addr.assumingMemoryBound(to: CDouble.self).pointee = _readDouble()

            case .Bool:
                _checkType(type: decodedType, reqType: .Bool)
                addr.assumingMemoryBound(to: CBool.self).pointee = _readBool()

            default:
                UnsupportedTypeException.raise(withType: type)
        }
    }

    private func _decodeObject() -> Any? {
        var object: AnyObject? = nil

        withUnsafeMutablePointer(to: &object) { (ptr: UnsafeMutablePointer<AnyObject?>) -> Void in
            var type = ObjCType.ID.rawValue
            _decodeValue(ofObjCType: &type, at: UnsafeMutableRawPointer(ptr))
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

            // Decode class info
            var type = ObjCType.Class.rawValue
            _decodeValue(ofObjCType: &type, at: &clazz)

            guard let decodedClass = (clazz as? NSCoding.Type) else {
                InconsistentArchiveException.raise(reason: "Could not decode class for object.")
            }

            // Decode an object
            guard let decodedObject = decodedClass.init(coder: self) else {
                InconsistentArchiveException.raise(reason: "Could not decode object of class ‘\(NSStringFromClass(decodedClass))’.")
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
