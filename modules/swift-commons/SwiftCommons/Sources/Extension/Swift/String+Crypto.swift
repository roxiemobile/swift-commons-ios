// ----------------------------------------------------------------------------
//
//  String+Crypto.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension String
{
// MARK: - Properties

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
        return dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!.rxm_md5Digest
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
        return dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!.rxm_sha1Digest
    }

}

// ----------------------------------------------------------------------------
