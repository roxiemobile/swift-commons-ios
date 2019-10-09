// ----------------------------------------------------------------------------
//
//  AbstractDecoder.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsLang

// ----------------------------------------------------------------------------

open class AbstractDecoder: AbstractCoder
{
// MARK: - Construction

    /// TODO
    public init(
            forReadingFrom data: NSData,
            failurePolicy: CodingFailurePolicy = .setErrorAndReturn
    ) {
        // Init instance
        self.buffer = data

        // Parent processing
        super.init(failurePolicy: failurePolicy)
    }

// MARK: - Properties

    // Archive-index -> Object
    internal var collectedObjects = Dictionary<UInt, AnyObject>()

    // Archive-index -> Class
    internal var collectedClasses = Dictionary<UInt, AnyClass>()

    // Class name -> Class version
    internal var collectedVersionsOfClasses = Dictionary<String, Int>()

// MARK: - Variables

    private let buffer: NSData

    private var cursor: Int = 0

    private var pendingBuffers = Array<NSMutableData>()
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension AbstractDecoder
{
// MARK: - Protected Methods

    internal func _decodeData() -> Data? {
        var data: Data? = nil
        var count = 0

        // Read an array type, eg '[15c]…' -> count = 15
        var itemType = _readArrayType(withReturnedLength: &count)

        // Read a bytes
        if (count > 0), let mutableData = NSMutableData(length: count) {
            _decodeArray(ofObjCType: &itemType, count: count, at: mutableData.mutableBytes)

            data = mutableData as Data
        }

        // Done
        return data
    }

    internal func _decodeArray(ofObjCType typep: UnsafePointer<CChar>, count: Int, at array: UnsafeMutableRawPointer) {
        let itemType = typep.pointee

        guard (itemType == Types.C_CHR) || (itemType == Types.C_UCHR) else {
            UnsupportedTypeException.raise(withType: itemType)
            return
        }

        // Read a bytes
        _readBytes(array, length: count)
    }

    internal func _decodeBytes(withReturnedLength lengthp: UnsafeMutablePointer<Int>) -> UnsafeMutableRawPointer? {
        var datap: UnsafeMutableRawPointer? = nil
        lengthp.pointee = 0

        // Read a bytes
        let count = _readInteger()
        if (count > 0), let mutableData = NSMutableData(length: count) {

            // NOTE: from NSCoder.swift
            // We cannot autorelease here so instead the pending buffers will manage the lifespan
            // of the returned data. This is wasteful but good enough.

            self.pendingBuffers.append(mutableData)
            _readBytes(mutableData.mutableBytes, length: count)

            datap = mutableData.mutableBytes
            lengthp.pointee = count
        }

        // Done
        return datap
    }

    internal func _version(forClassName className: String) -> Int {
        return self.collectedVersionsOfClasses[className] ?? NSNotFound
    }
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension AbstractDecoder
{
// MARK: - Protected Methods

    internal func _checkType(type: Int8, reqType: Int8) {
        if (type != reqType) {
            InconsistentArchiveException.raise(reason: "Expected different typecode.")
        }
    }

    internal func _checkTypePair(type: Int8, reqType1: Int8, reqType2: Int8) {
        if (type != reqType1) && (type != reqType2) {
            InconsistentArchiveException.raise(reason: "Expected different typecode.")
        }
    }

    internal func _isReference(_ itemType: Int8) -> Bool {
        return (UInt8(bitPattern: itemType) & Flags.Reference) != 0
    }

    internal func _valueOfType(_ itemType: Int8) -> Int8 {
        return Int8(bitPattern: UInt8(bitPattern: itemType) & Flags.Value)
    }
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension AbstractDecoder
{
// MARK: - Protected Methods

    internal func _readBytes(_ bytes: UnsafeMutableRawPointer, length: Int) {

        if (length > 0) {
            self.buffer.getBytes(bytes, range: NSMakeRange(self.cursor, length))
            self.cursor += length
        }
    }

    internal func _readType() -> CChar {

        let value = _readChar(withType: false)
        if (value == 0) {
            InconsistentArchiveException.raise(reason: "Found invalid type tag ‘0’.")
        }

        // Done
        return value
    }

    internal func _readArrayType(withReturnedLength lengthp: UnsafeMutablePointer<Int>) -> CChar {

        var itemType: CChar = 0
        _checkType(type: _readType(), reqType: Types.C_ARY_B)

        lengthp.pointee = 0
        (self.buffer as Data).withUnsafeBytes { (buff: UnsafePointer<Int8>) -> Void in
            repeat {

                let byte = buff[self.cursor]
                self.cursor += 1

                if (byte >= 0x30) && (byte <= 0x39) {
                    lengthp.pointee = (lengthp.pointee * 10) + Int(byte - 0x30)
                }
                else {
                    itemType = byte
                    break
                }
            }
            while (self.cursor < self.buffer.length)
        }

        _checkType(type: _readType(), reqType: Types.C_ARY_E)

        // Done
        return itemType
    }

    internal func _readString(withType: Bool = false) -> String {

        if (withType) {
            _checkTypePair(type: _readType(), reqType1: Types.C_ATOM, reqType2: Types.C_CHARPTR)
        }

        var value = String()

        // Decode string's data
        var length: Int = 0
        let bytes = _decodeBytes(withReturnedLength: &length)

        // Build string from raw data
        if let bytes = bytes, (length > 0) {

            let data = Data(bytesNoCopy: bytes, count: length, deallocator: .none)
            if let string = String(data: data, encoding: .utf8) {
                value = string
            }
        }

        // Done
        return value
    }

    internal func _readLongLong(withType: Bool = false) -> CLongLong {

        if (withType) {
            _checkType(type: _readType(), reqType: Types.C_LNG_LNG)
        }

        var value: CLongLong = 0
        withUnsafeMutablePointer(to: &value) { ptr in
            _readBytes(UnsafeMutableRawPointer(ptr), length: MemoryLayout<CLongLong>.size)
            ptr.pointee = Roxie.ntohll(ptr.pointee)
        }

        // Done
        return value
    }

    internal func _readUnsignedLongLong(withType: Bool = false) -> CUnsignedLongLong {

        if (withType) {
            _checkType(type: _readType(), reqType: Types.C_ULNG_LNG)
        }

        var value: CUnsignedLongLong = 0
        withUnsafeMutablePointer(to: &value) { ptr in
            _readBytes(UnsafeMutableRawPointer(ptr), length: MemoryLayout<CUnsignedLongLong>.size)
            ptr.pointee = Roxie.ntohll(ptr.pointee)
        }

        // Done
        return value
    }

    internal func _readLong(withType: Bool = false) -> CLong {

        if (withType) {
            _checkType(type: _readType(), reqType: Types.C_LNG)
        }

        // On 64-bit platforms, `CLong` is the same size as `CLongLong`
        // On 32-bit platforms, `CLong` is the same size as `CInt`

        var value: CLong = 0
        if (MemoryLayout<CLong>.size == MemoryLayout<CLongLong>.size) {
            value = CLong(_readLongLong(withType: false))
        }
        else {
            value = CLong(_readInt(withType: false))
        }

        // Done
        return value
    }

    internal func _readUnsignedLong(withType: Bool = false) -> CUnsignedLong {

        if (withType) {
            _checkType(type: _readType(), reqType: Types.C_ULNG)
        }

        // On 64-bit platforms, `CUnsignedLong` is the same size as `CUnsignedLongLong`
        // On 32-bit platforms, `CUnsignedLong` is the same size as `CUnsignedInt`

        var value: CUnsignedLong = 0
        if (MemoryLayout<CUnsignedLong>.size == MemoryLayout<CUnsignedLongLong>.size) {
            value = CUnsignedLong(_readUnsignedLongLong(withType: false))
        }
        else {
            value = CUnsignedLong(_readUnsignedInt(withType: false))
        }

        // Done
        return value
    }

    internal func _readInt(withType: Bool = false) -> CInt {

        if (withType) {
            _checkType(type: _readType(), reqType: Types.C_INT)
        }

        var value: CInt = 0
        withUnsafeMutablePointer(to: &value) { ptr in
            _readBytes(UnsafeMutableRawPointer(ptr), length: MemoryLayout<CInt>.size)
            ptr.pointee = Roxie.ntohl(ptr.pointee)
        }

        // Done
        return value
    }

    internal func _readUnsignedInt(withType: Bool = false) -> CUnsignedInt {

        if (withType) {
            _checkType(type: _readType(), reqType: Types.C_UINT)
        }

        var value: CUnsignedInt = 0
        withUnsafeMutablePointer(to: &value) { ptr in
            _readBytes(UnsafeMutableRawPointer(ptr), length: MemoryLayout<CUnsignedInt>.size)
            ptr.pointee = Roxie.ntohl(ptr.pointee)
        }

        // Done
        return value
    }

    internal func _readShort(withType: Bool = false) -> CShort {

        if (withType) {
            _checkType(type: _readType(), reqType: Types.C_SHT)
        }

        var value: CShort = 0
        withUnsafeMutablePointer(to: &value) { ptr in
            _readBytes(UnsafeMutableRawPointer(ptr), length: MemoryLayout<CShort>.size)
            ptr.pointee = Roxie.ntohs(ptr.pointee)
        }

        // Done
        return value
    }

    internal func _readUnsignedShort(withType: Bool = false) -> CUnsignedShort {

        if (withType) {
            _checkType(type: _readType(), reqType: Types.C_USHT)
        }

        var value: CUnsignedShort = 0
        withUnsafeMutablePointer(to: &value) { ptr in
            _readBytes(UnsafeMutableRawPointer(ptr), length: MemoryLayout<CUnsignedShort>.size)
            ptr.pointee = Roxie.ntohs(ptr.pointee)
        }

        // Done
        return value
    }

    internal func _readChar(withType: Bool = false) -> CChar {

        if (withType) {
            _checkType(type: _readType(), reqType: Types.C_CHR)
        }

        var value: CChar = 0
        withUnsafeMutablePointer(to: &value) { ptr in
            _readBytes(UnsafeMutableRawPointer(ptr), length: MemoryLayout<CChar>.size)
        }

        // Done
        return value
    }

    internal func _readUnsignedChar(withType: Bool = false) -> CUnsignedChar {

        if (withType) {
            _checkType(type: _readType(), reqType: Types.C_UCHR)
        }

        var value: CUnsignedChar = 0
        withUnsafeMutablePointer(to: &value) { ptr in
            _readBytes(UnsafeMutableRawPointer(ptr), length: MemoryLayout<CUnsignedChar>.size)
        }

        // Done
        return value
    }

    internal func _readInteger() -> CLong {
        var value: CLong = 0

        // Read signed int
        let itemType = _readType()
        switch (itemType) {

            case Types.C_CHR:
                value = CLong(_readChar())

            case Types.C_SHT:
                value = CLong(_readShort())

            case Types.C_INT:
                value = CLong(_readInt())

            case Types.C_LNG:
                value = _readLong()

            case Types.C_LNG_LNG:
                value = CLong(_readLongLong())

            default:
                UnsupportedTypeException.raise(withType: itemType)
        }

        // Done
        return value
    }

    internal func _readUnsignedInteger() -> CUnsignedLong {
        var value: CUnsignedLong = 0

        // Read unsigned int
        let itemType = _readType()
        switch (itemType) {

            case Types.C_UCHR:
                value = CUnsignedLong(_readUnsignedChar())

            case Types.C_USHT:
                value = CUnsignedLong(_readUnsignedShort())

            case Types.C_UINT:
                value = CUnsignedLong(_readUnsignedInt())

            case Types.C_ULNG:
                value = _readUnsignedLong()

            case Types.C_ULNG_LNG:
                value = CUnsignedLong(_readUnsignedLongLong())

            default:
                UnsupportedTypeException.raise(withType: itemType)
        }

        // Done
        return value
    }

    internal func _readFloat(withType: Bool = false) -> CFloat {

        if (withType) {
            _checkType(type: _readType(), reqType: Types.C_FLT)
        }

        var buffer: CFSwappedFloat32 = CFSwappedFloat32(v: 0)
        let value = withUnsafeMutablePointer(to: &buffer) { (ptr: UnsafeMutablePointer<CFSwappedFloat32>) -> CFloat in
            _readBytes(UnsafeMutableRawPointer(ptr), length: MemoryLayout<CFSwappedFloat32>.size)
            return Roxie.ntohf(ptr.pointee)
        }

        // Done
        return value
    }

    internal func _readDouble(withType: Bool = false) -> CDouble {

        if (withType) {
            _checkType(type: _readType(), reqType: Types.C_DBL)
        }

        var buffer: CFSwappedFloat64 = CFSwappedFloat64(v: 0)
        let value = withUnsafeMutablePointer(to: &buffer) { (ptr: UnsafeMutablePointer<CFSwappedFloat64>) -> CDouble in
            _readBytes(UnsafeMutableRawPointer(ptr), length: MemoryLayout<CFSwappedFloat64>.size)
            return Roxie.ntohd(ptr.pointee)
        }

        // Done
        return value
    }

    internal func _readBool(withType: Bool = false) -> CBool {

        if (withType) {
            _checkType(type: _readType(), reqType: Types.C_BOOL)
        }

        var value: CUnsignedChar = 0
        withUnsafeMutablePointer(to: &value) { ptr in
            _readBytes(UnsafeMutableRawPointer(ptr), length: MemoryLayout<CUnsignedChar>.size)
        }

        // Done
        return (value != 0)
    }
}

// ----------------------------------------------------------------------------
