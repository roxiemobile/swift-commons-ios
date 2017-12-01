// ----------------------------------------------------------------------------
//
//  Serializable.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

/// The `Serializable` protocol declares the methods that a class must implement
/// so that instances of that class can be encoded and decoded.
public protocol Serializable: AnyObject
{
    /// Returns an object initialized from data in a given unarchiver.
    ///
    /// - Parameters:
    ///   - decoder: An unarchiver object.
    ///
    init?(coder decoder: NSCoder)

    /// Encodes the receiver using a given archiver.
    ///
    /// - Parameters:
    ///   - encoder: An archiver object.
    ///
    /// - Returns:
    ///   `true` if encoding succeeded; otherwise, `false`.
    ///
    func encodeObject(with encoder: NSCoder) -> Bool

    /// Decodes the receiver using a given unarchiver.
    ///
    /// - Parameters:
    ///   - decoder: An unarchiver object.
    ///
    /// - Returns:
    ///   `true` if decoding succeeded; otherwise, `false`.
    ///
    func decodeObject(with decoder: NSCoder) -> Bool
}

// ----------------------------------------------------------------------------

