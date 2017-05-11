// ----------------------------------------------------------------------------
//
//  Data+Crypto.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension Data
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
    var rxm_md5Digest: Data {
        return Data(bytes: Digest.md5(self.arrayOfBytes()))
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
    var rxm_sha1Digest: Data {
        return Data(bytes: Digest.sha1(self.arrayOfBytes()))
    }


// MARK: - Methods

    func arrayOfBytes() -> [UInt8] {
        return Array(self)
    }

}

// ----------------------------------------------------------------------------

public extension Collection where Iterator.Element == UInt8 {

    public func toHexString() -> String {
        return self.lazy.reduce("") {
            var s = String($1, radix: 16)
            if s.characters.count == 1 {
                s = "0" + s
            }
            return $0 + s
        }
    }
}

// ----------------------------------------------------------------------------
