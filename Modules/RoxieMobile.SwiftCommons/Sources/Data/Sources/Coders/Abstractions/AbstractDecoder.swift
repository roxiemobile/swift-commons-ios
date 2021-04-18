// ----------------------------------------------------------------------------
//
//  AbstractDecoder.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------
// swiftlint:disable file_length
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommonsLang

// ----------------------------------------------------------------------------

open class AbstractDecoder: AbstractCoder {

// MARK: - Construction

    /// TODO
    public init(
        forReadingFrom data: Data,
        failurePolicy: CodingFailurePolicy = .setErrorAndReturn
    ) {
        // Init instance
        self.buffer = data

        // Parent processing
        super.init(failurePolicy: failurePolicy)
    }

// MARK: - Properties

    // Archive-index -> Object
    internal var collectedObjects = [UInt: AnyObject]()

    // Archive-index -> Class
    internal var collectedClasses = [UInt: AnyClass]()

    // Class name -> Class version
    internal var collectedVersionsOfClasses = [String: Int]()

// MARK: - Variables

    private let buffer: Data

    private var cursor: Int = 0

    private var pendingBuffers = [NSMutableData]()
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension AbstractDecoder {

// MARK: - Protected Methods

    internal func _decodeData() -> Data? {
        // swiftlint:disable:previous identifier_name

        var data: Data?
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
        // swiftlint:disable:previous identifier_name

        let itemType = ObjCType(typep.pointee)

        guard (itemType == .Char) || (itemType == .UChar) else {
            UnsupportedTypeException.raise(withType: itemType)
        }

        // Read a bytes
        _readBytes(array, length: count)
    }

    internal func _decodeBytes(withReturnedLength lengthp: UnsafeMutablePointer<Int>) -> UnsafeMutableRawPointer? {
        // swiftlint:disable:previous identifier_name

        var datap: UnsafeMutableRawPointer?
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
        // swiftlint:disable:previous identifier_name

        return self.collectedVersionsOfClasses[className] ?? NSNotFound
    }
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension AbstractDecoder {

// MARK: - Protected Methods

    internal func _checkType(type: ObjCType, reqType: ObjCType) {
        // swiftlint:disable:previous identifier_name

        if (type != reqType) {
            InconsistentArchiveException.raise(reason: "Expected different typecode.")
        }
    }

    internal func _checkTypePair(type: ObjCType, reqType1: ObjCType, reqType2: ObjCType) {
        // swiftlint:disable:previous identifier_name

        if (type != reqType1) && (type != reqType2) {
            InconsistentArchiveException.raise(reason: "Expected different typecode.")
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------

extension AbstractDecoder {

// MARK: - Protected Methods

    internal func _readBytes(_ addr: UnsafeMutableRawPointer, length: Int) {
        // swiftlint:disable:previous identifier_name

        if (length > 0) {
            let bytes = addr.bindMemory(to: UInt8.self, capacity: length)

            self.buffer.copyBytes(to: bytes, from: self.cursor ..< (self.cursor + length))
            self.cursor += length
        }
    }

    internal func _readType(isReference: inout Bool) -> ObjCType {
        // swiftlint:disable:previous identifier_name

        let itemType = ObjCType(_readChar())

        guard itemType.isValidType else {
            let typeHex = String(format: "0x%02X", itemType.rawValue)
            InconsistentArchiveException.raise(reason: "Found invalid type tag ‘\(typeHex)’.")
        }

        isReference = itemType.isReference
        return itemType.asValue
    }

    internal func _readType() -> ObjCType {
        // swiftlint:disable:previous identifier_name

        var flag = false
        return _readType(isReference: &flag)
    }

    internal func _readArrayType(withReturnedLength length: inout Int) -> CChar {
        // swiftlint:disable:previous identifier_name

        var itemType: CChar = 0
        _checkType(type: _readType(), reqType: .ArrayBegin)

        length = 0
        (self.buffer as Data).withUnsafeBytes { (buff: UnsafeRawBufferPointer) -> Void in
            repeat {

                let byte = buff[self.cursor]
                self.cursor += 1

                if (byte >= 0x30) && (byte <= 0x39) {
                    length = (length * 10) + Int(byte - 0x30)
                }
                else {
                    itemType = CChar(byte)
                    break
                }
            }
            while (self.cursor < self.buffer.count)
        }

        _checkType(type: _readType(), reqType: .ArrayEnd)

        // Done
        return itemType
    }

    internal func _readString(withType: Bool = false) -> String {
        // swiftlint:disable:previous identifier_name

        if (withType) {
            _checkTypePair(type: _readType(), reqType1: .Atom, reqType2: .CharPtr)
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
        // swiftlint:disable:previous identifier_name

        if (withType) {
            _checkType(type: _readType(), reqType: .LongLong)
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
        // swiftlint:disable:previous identifier_name

        if (withType) {
            _checkType(type: _readType(), reqType: .ULongLong)
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
        // swiftlint:disable:previous identifier_name

        if (withType) {
            _checkType(type: _readType(), reqType: .Long)
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
        // swiftlint:disable:previous identifier_name

        if (withType) {
            _checkType(type: _readType(), reqType: .ULong)
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
        // swiftlint:disable:previous identifier_name

        if (withType) {
            _checkType(type: _readType(), reqType: .Int)
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
        // swiftlint:disable:previous identifier_name

        if (withType) {
            _checkType(type: _readType(), reqType: .UInt)
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
        // swiftlint:disable:previous identifier_name

        if (withType) {
            _checkType(type: _readType(), reqType: .Short)
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
        // swiftlint:disable:previous identifier_name

        if (withType) {
            _checkType(type: _readType(), reqType: .UShort)
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
        // swiftlint:disable:previous identifier_name

        if (withType) {
            _checkType(type: _readType(), reqType: .Char)
        }

        var value: CChar = 0
        withUnsafeMutablePointer(to: &value) { ptr in
            _readBytes(UnsafeMutableRawPointer(ptr), length: MemoryLayout<CChar>.size)
        }

        // Done
        return value
    }

    internal func _readUnsignedChar(withType: Bool = false) -> CUnsignedChar {
        // swiftlint:disable:previous identifier_name

        if (withType) {
            _checkType(type: _readType(), reqType: .UChar)
        }

        var value: CUnsignedChar = 0
        withUnsafeMutablePointer(to: &value) { ptr in
            _readBytes(UnsafeMutableRawPointer(ptr), length: MemoryLayout<CUnsignedChar>.size)
        }

        // Done
        return value
    }

    internal func _readInteger() -> CLong {
        // swiftlint:disable:previous identifier_name

        var value: CLong = 0

        // Read signed int
        let decodedType = _readType()
        switch (decodedType) {

            case .Char:
                value = CLong(_readChar())

            case .Short:
                value = CLong(_readShort())

            case .Int:
                value = CLong(_readInt())

            case .Long:
                value = _readLong()

            case .LongLong:
                value = CLong(_readLongLong())

            default:
                UnsupportedTypeException.raise(withType: decodedType)
        }

        // Done
        return value
    }

    internal func _readUnsignedInteger() -> CUnsignedLong {
        // swiftlint:disable:previous identifier_name

        var value: CUnsignedLong = 0

        // Read unsigned int
        let decodedType = _readType()
        switch (decodedType) {

            case .UChar:
                value = CUnsignedLong(_readUnsignedChar())

            case .UShort:
                value = CUnsignedLong(_readUnsignedShort())

            case .UInt:
                value = CUnsignedLong(_readUnsignedInt())

            case .ULong:
                value = _readUnsignedLong()

            case .ULongLong:
                value = CUnsignedLong(_readUnsignedLongLong())

            default:
                UnsupportedTypeException.raise(withType: decodedType)
        }

        // Done
        return value
    }

    internal func _readFloat(withType: Bool = false) -> CFloat {
        // swiftlint:disable:previous identifier_name

        if (withType) {
            _checkType(type: _readType(), reqType: .Float)
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
        // swiftlint:disable:previous identifier_name

        if (withType) {
            _checkType(type: _readType(), reqType: .Double)
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
        // swiftlint:disable:previous identifier_name

        if (withType) {
            _checkType(type: _readType(), reqType: .Bool)
        }

        var value: CUnsignedChar = 0
        withUnsafeMutablePointer(to: &value) { ptr in
            _readBytes(UnsafeMutableRawPointer(ptr), length: MemoryLayout<CUnsignedChar>.size)
        }

        // Done
        return (value != 0)
    }
}
