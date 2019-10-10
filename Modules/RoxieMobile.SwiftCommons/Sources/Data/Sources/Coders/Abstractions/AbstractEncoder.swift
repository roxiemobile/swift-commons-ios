// ----------------------------------------------------------------------------
//
//  AbstractEncoder.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsLang

// ----------------------------------------------------------------------------

open class AbstractEncoder: AbstractCoder
{
// MARK: - Construction

    /// TODO
    public init(
            forWritingInto mdata: NSMutableData? = nil,
            failurePolicy: CodingFailurePolicy = .setErrorAndReturn
    ) {
        // Init instance
        self.buffer = mdata ?? NSMutableData()

        // Parent processing
        super.init(failurePolicy: failurePolicy)
    }

// MARK: - Properties

    /// Returns the encoded data of the encoder.
    public var encodedData: Data {
        return self.buffer as Data
    }

    // Object -> Archive-index
    internal var collectedObjects = Dictionary<AnyHashable, UInt>()

    // Class name -> Archive-index
    internal var collectedClasses = Dictionary<String, UInt>()

// MARK: - Variables

    private let buffer: NSMutableData
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension AbstractEncoder
{
// MARK: - Protected Methods

    internal func _encode(_ data: Data) {
        let arrayType: ObjCType = .Char

        // Write an array type, eg '[15c]…'
        _writeArrayType(ofObjCType: arrayType, count: data.count)

        // Write a bytes
        if (data.count > 0) {
            withUnsafePointer(to: arrayType.rawValue) { (typep: UnsafePointer<CChar>) -> Void in
                _encodeArray(ofObjCType: typep, count: data.count, at: data.bytes)
            }
        }
    }

    internal func _encodeArray(ofObjCType typep: UnsafePointer<CChar>, count: Int, at array: UnsafeRawPointer) {
        let itemType = ObjCType(typep.pointee)

        guard (itemType == .Char) || (itemType == .UChar) else {
            UnsupportedTypeException.raise(withType: itemType)
        }

        // Write a bytes
        _writeBytes(array, length: count)
    }

    internal func _encodeBytes(_ byteaddr: UnsafeRawPointer?, length: Int) {

        // Write a bytes
        _writeInteger(length)
        _writeBytes(byteaddr, length: length)
    }
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension AbstractEncoder
{
// MARK: - Protected Methods

    internal func _writeBytes(_ bytes: UnsafeRawPointer?, length: Int) {

        if let bytes = bytes, (length > 0) {
            self.buffer.append(bytes, length: length)
        }
    }

    internal func _writeType(_ itemType: ObjCType, asReference: Bool = false) {

        let type = asReference
                ? itemType.asReference.rawValue
                : itemType.asValue.rawValue

        withUnsafePointer(to: type) { bytes in
            _writeBytes(bytes, length: MemoryLayout.size(ofValue: type))
        }
    }

    internal func _writeArrayType(ofObjCType itemType: ObjCType, count: Int) {

        // Write an array type, eg '[15c]'
        _writeType(.ArrayBegin)

        String(count).withCString {
            _writeBytes($0, length: strlen($0))
        }

        _writeType(itemType)
        _writeType(.ArrayEnd)
    }

    internal func _writeString(_ value: String, withType: Bool = false) {

        let data = value.data(using: .utf8, allowLossyConversion: false)
        let size = data?.count ?? 0

        if (withType) {
            _writeType(size >= CUnsignedShort.max ? .CharPtr : .Atom)
        }

        _encodeBytes(data?.bytes, length: size)
    }

    internal func _writeLongLong(_ value: CLongLong, withType: Bool = false) {
        let value = Roxie.htonll(CUnsignedLongLong(bitPattern: value))

        if (withType) {
            _writeType(.LongLong)
        }

        withUnsafePointer(to: value) { bytes in
            _writeBytes(bytes, length: MemoryLayout.size(ofValue: value))
        }
    }

    internal func _writeUnsignedLongLong(_ value: CUnsignedLongLong, withType: Bool = false) {
        let value = Roxie.htonll(value)

        if (withType) {
            _writeType(.ULongLong)
        }

        withUnsafePointer(to: value) { bytes in
            _writeBytes(bytes, length: MemoryLayout.size(ofValue: value))
        }
    }

    internal func _writeLong(_ value: CLong, withType: Bool = false) {

        if (withType) {
            _writeType(.Long)
        }

        // On 64-bit platforms, `CLong` is the same size as `CLongLong`
        // On 32-bit platforms, `CLong` is the same size as `CInt`

        if (MemoryLayout<CLong>.size == MemoryLayout<CLongLong>.size) {
            _writeLongLong(CLongLong(value), withType: false)
        }
        else {
            _writeInt(CInt(value), withType: false)
        }
    }

    internal func _writeUnsignedLong(_ value: CUnsignedLong, withType: Bool = false) {

        if (withType) {
            _writeType(.ULong)
        }

        // On 64-bit platforms, `CUnsignedLong` is the same size as `CUnsignedLongLong`
        // On 32-bit platforms, `CUnsignedLong` is the same size as `CUnsignedInt`

        if (MemoryLayout<CUnsignedLong>.size == MemoryLayout<CUnsignedLongLong>.size) {
            _writeUnsignedLongLong(CUnsignedLongLong(value), withType: false)
        }
        else {
            _writeUnsignedInt(CUnsignedInt(value), withType: false)
        }
    }

    internal func _writeInt(_ value: CInt, withType: Bool = false) {
        let value = Roxie.htonl(CUnsignedInt(bitPattern: value))

        if (withType) {
            _writeType(.Int)
        }

        withUnsafePointer(to: value) { bytes in
            _writeBytes(bytes, length: MemoryLayout.size(ofValue: value))
        }
    }

    internal func _writeUnsignedInt(_ value: CUnsignedInt, withType: Bool = false) {
        let value = Roxie.htonl(value)

        if (withType) {
            _writeType(.UInt)
        }

        withUnsafePointer(to: value) { bytes in
            _writeBytes(bytes, length: MemoryLayout.size(ofValue: value))
        }
    }

    internal func _writeShort(_ value: CShort, withType: Bool = false) {
        let value = Roxie.htons(CUnsignedShort(bitPattern: value))

        if (withType) {
            _writeType(.Short)
        }

        withUnsafePointer(to: value) { bytes in
            _writeBytes(bytes, length: MemoryLayout.size(ofValue: value))
        }
    }

    internal func _writeUnsignedShort(_ value: CUnsignedShort, withType: Bool = false) {
        let value = Roxie.htons(value)

        if (withType) {
            _writeType(.UShort)
        }

        withUnsafePointer(to: value) { bytes in
            _writeBytes(bytes, length: MemoryLayout.size(ofValue: value))
        }
    }

    internal func _writeChar(_ value: CChar, withType: Bool = false) {

        if (withType) {
            _writeType(.Char)
        }

        withUnsafePointer(to: value) { bytes in
            _writeBytes(bytes, length: MemoryLayout.size(ofValue: value))
        }
    }

    internal func _writeUnsignedChar(_ value: CUnsignedChar, withType: Bool = false) {

        if (withType) {
            _writeType(.UChar)
        }

        withUnsafePointer(to: value) { bytes in
            _writeBytes(bytes, length: MemoryLayout.size(ofValue: value))
        }
    }

    internal func _writeInteger(_ value: CLong) {

        // On 64-bit platforms, `CLong` is the same size as `CLongLong`
        // On 32-bit platforms, `CLong` is the same size as `CInt`

        if (value < CInt.min || value > CInt.max) {
            _writeLongLong(CLongLong(value), withType: true)
        }
        else if (value < CShort.min || value > CShort.max) {
            _writeInt(CInt(value), withType: true)
        }
        else if (value < CChar.min || value > CChar.max) {
            _writeShort(CShort(value), withType: true)
        }
        else {
            _writeChar(CChar(value), withType: true)
        }
    }

    internal func _writeUnsignedInteger(_ value: CUnsignedLong) {

        // On 64-bit platforms, `CUnsignedLong` is the same size as `CUnsignedLongLong`
        // On 32-bit platforms, `CUnsignedLong` is the same size as `CUnsignedInt`

        if (value > CUnsignedInt.max) {
            _writeUnsignedLongLong(CUnsignedLongLong(value), withType: true)
        }
        else if (value > CUnsignedShort.max) {
            _writeUnsignedInt(CUnsignedInt(value), withType: true)
        }
        else if (value > CUnsignedChar.max) {
            _writeUnsignedShort(CUnsignedShort(value), withType: true)
        }
        else {
            _writeUnsignedChar(CUnsignedChar(value), withType: true)
        }
    }

    internal func _writeFloat(_ value: CFloat, withType: Bool = false) {
        let value = Roxie.htonf(value)

        if (withType) {
            _writeType(.Float)
        }

        withUnsafePointer(to: value) { bytes in
            _writeBytes(bytes, length: MemoryLayout.size(ofValue: value))
        }
    }

    internal func _writeDouble(_ value: CDouble, withType: Bool = false) {
        let value = Roxie.htond(value)

        if (withType) {
            _writeType(.Double)
        }

        withUnsafePointer(to: value) { bytes in
            _writeBytes(bytes, length: MemoryLayout.size(ofValue: value))
        }
    }

    internal func _writeBool(_ value: CBool, withType: Bool = false) {
        let value = CUnsignedChar(value ? 1 : 0)

        if (withType) {
            _writeType(.Bool)
        }

        withUnsafePointer(to: value) { bytes in
            _writeBytes(bytes, length: MemoryLayout.size(ofValue: value))
        }
    }
}

// ----------------------------------------------------------------------------
