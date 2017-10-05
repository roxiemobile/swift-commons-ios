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
     * Calculates MD5 digest.
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    @available(*, deprecated)
    var rxm_md5Digest: Data {
        return data(using: String.Encoding.utf8, allowLossyConversion: true)!.rxm_md5Digest
    }

    /**
     * Calculates SHA1 digest.
     *
     * @note Copy from CryptoSwift
     * @link https://github.com/krzyzanowskim/CryptoSwift
     */
    @available(*, deprecated)
    var rxm_sha1Digest: Data {
        return data(using: String.Encoding.utf8, allowLossyConversion: true)!.rxm_sha1Digest
    }
}

// ----------------------------------------------------------------------------
