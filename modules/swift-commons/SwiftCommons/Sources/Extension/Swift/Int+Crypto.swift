// ----------------------------------------------------------------------------
//
//  Int+Crypto.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension Int
{
// MARK: - Properties

    /**
     * Converts value to hex string.
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    var rxm_hexString: String {
        return String(format:"%02x", self)
    }

// MARK: - Methods

    /**
     * Array of bytes with optional padding (little-endian).
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    func bytes(_ totalBytes: Int = MemoryLayout<Int>.size) -> [UInt8] {
        return arrayOfBytes(self, length: totalBytes)
    }

    static func withBytes(_ bytes: ArraySlice<UInt8>) -> Int {
        return Int.withBytes(Array(bytes))
    }

    /**
     * Int with array bytes (little-endian).
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    static func withBytes(_ bytes: [UInt8]) -> Int {
        return integerWithBytes(bytes)
    }

}

// ----------------------------------------------------------------------------

public extension Int8
{
// MARK: - Properties

    var rxm_hexString: String {
        return hexString(self as Int8)
    }

}

public extension UInt8
{
// MARK: - Properties

    var rxm_hexString: String {
        return hexString(self as UInt8)
    }

}

// ----------------------------------------------------------------------------

public extension Int16
{
// MARK: - Properties

    var rxm_hexString: String {
        return hexString(self as Int16)
    }

}

public extension UInt16
{
// MARK: - Properties

    var rxm_hexString: String {
        return hexString(self as UInt16)
    }

}

// ----------------------------------------------------------------------------

public extension Int32
{
// MARK: - Properties

    var rxm_hexString: String {
        return hexString(self as Int32)
    }

}

public extension UInt32
{
// MARK: - Properties

    var rxm_hexString: String {
        return hexString(self as UInt32)
    }

}

// ----------------------------------------------------------------------------

public extension Int64
{
// MARK: - Properties

    var rxm_hexString: String {
        return hexString(self as Int64)
    }

}

public extension UInt64
{
// MARK: - Properties

    var rxm_hexString: String {
        return hexString(self as UInt64)
    }

}

// ----------------------------------------------------------------------------

/**
 * Initialize integer from array of bytes. I found this method slow
 *
 * @note Copy from CryptoSwift
 * @link https://github.com/krzyzanowskim/CryptoSwift
 */
func integerWithBytes<T: Integer>(_ bytes: [UInt8]) -> T
{
    let totalBytes = Swift.min(bytes.count, MemoryLayout<T>.size)

    // Get slice of Int
    let start = Swift.max(bytes.count - MemoryLayout<T>.size,0)
    var intarr = [UInt8](bytes[start..<(start + totalBytes)])
    
    // Pad size if necessary
    while (intarr.count < MemoryLayout<T>.size) {
        intarr.insert(0 as UInt8, at: 0)
    }
    intarr = Array(intarr.reversed())
    
    var i:T = 0
    let data = NSData(bytes: intarr, length: intarr.count)
    data.getBytes(&i, length: MemoryLayout.size(ofValue: i));
    return i
}

/**
 * Array of bytes, little-endian representation. Don't use if not necessary. I found this method slow.
 *
 * @note Copy from CryptoSwift
 * @link https://github.com/krzyzanowskim/CryptoSwift
 */
func arrayOfBytes<T>(_ value:T, length totalBytes:Int = MemoryLayout<T>.size) -> [UInt8]
{
    let valuePointer = UnsafeMutablePointer<T>.allocate(capacity: 1)
    valuePointer.pointee = value

    let bytesPointer = UnsafeMutablePointer<UInt8>(OpaquePointer(valuePointer))
    var bytes = Array<UInt8>(repeating: 0, count: totalBytes)
    for j in 0 ..< min(MemoryLayout<T>.size, totalBytes) {
        bytes[totalBytes - 1 - j] = (bytesPointer + j).pointee
    }

    valuePointer.deinitialize()
    valuePointer.deallocate(capacity: 1)

    return bytes
}

// ----------------------------------------------------------------------------

// How to create a generic integer-to-hex function for all Integer types?
// @link http://stackoverflow.com/a/27646748

private func hexString<T: SignedInteger>(_ v: T) -> String
{
    var s = ""
    var i = v.toIntMax()

    for _ in 0 ..< (MemoryLayout<T>.size * 2) {
        s = String(format: "%x", i & 0xF) + s
        i = i >> 4
    }

    return s
}

private func hexString<T: UnsignedInteger>(_ v: T) -> String
{
    var s = ""
    var i = v.toUIntMax()

    for _ in 0 ..< (MemoryLayout<T>.size * 2) {
        s = String(format: "%x", i & 0xF) + s
        i = i >> 4
    }

    return s
}

// ----------------------------------------------------------------------------
