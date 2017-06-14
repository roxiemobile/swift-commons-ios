//
//  Hash.swift
//  CryptoSwift
//
//  Created by Marcin Krzyzanowski on 07/08/14.
//  Copyright (c) 2014 Marcin Krzyzanowski. All rights reserved.
//

@available(*, deprecated: 0.6.0, renamed: "Digest")
public typealias Hash = Digest

/// Hash functions to calculate Digest.
public struct Digest {

    /// Calculate MD5 Digest
    /// - parameter bytes: input message
    /// - returns: Digest bytes
    public static func md5(_ bytes: [UInt8]) -> [UInt8] {
        return MD5().calculate(for: bytes)
    }

    /// Calculate SHA1 Digest
    /// - parameter bytes: input message
    /// - returns: Digest bytes
    public static func sha1(_ bytes: [UInt8]) -> [UInt8] {
        return SHA1().calculate(for: bytes)
    }
}
