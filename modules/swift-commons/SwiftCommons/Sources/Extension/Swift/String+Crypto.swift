// ----------------------------------------------------------------------------
//
//  String+Crypto.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
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
    var mdc_md5String: String {
        return self.mdc_md5Digest.mdc_hexString
    }

    /**
     * Calculates MD5 digest.
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    var mdc_md5Digest: NSData {
        return dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!.mdc_md5Digest
    }

    /**
     * Calculates SHA1 hash string.
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    var mdc_sha1String: String {
        return self.mdc_sha1Digect.mdc_hexString
    }

    /**
     * Calculates SHA1 digest.
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    var mdc_sha1Digect: NSData {
        return dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!.mdc_sha1Digest
    }

}

// ----------------------------------------------------------------------------
