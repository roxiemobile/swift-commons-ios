// ----------------------------------------------------------------------------
//
//  NSData+Crypto.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension NSData
{
// MARK: - Properties

    /**
     * Converts data to hex string.
     *
     * Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    var rxm_hexString: String {
        return self.arrayOfBytes().toHexString()
    }

    /**
     * Calculates MD5 hash string.
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    var rxm_md5String: String {
        return self.rxm_md5Digest.rxm_hexString
    }

    /**
     * Calculates MD5 digest.
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    var rxm_md5Digest: NSData {
        let bytes = Digest.md5(self.arrayOfBytes())
        return NSData(bytes: bytes, length: bytes.count)
    }

    /**
     * Calculates SHA1 hash string.
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    var rxm_sha1String: String {
        return self.rxm_sha1Digest.rxm_hexString
    }

    /**
     * Calculates SHA1 digest.
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    var rxm_sha1Digest: NSData {
        let bytes = Digest.sha1(self.arrayOfBytes())
        return NSData(bytes: bytes, length: bytes.count)
    }


// MARK: - Methods

    func arrayOfBytes() -> [UInt8] {
        let count = self.length / MemoryLayout<UInt8>.size
        var bytesArray = [UInt8](repeating: 0, count: count)
        self.getBytes(&bytesArray, length: count * MemoryLayout<UInt8>.size)
        return bytesArray
    }

}

// ----------------------------------------------------------------------------
