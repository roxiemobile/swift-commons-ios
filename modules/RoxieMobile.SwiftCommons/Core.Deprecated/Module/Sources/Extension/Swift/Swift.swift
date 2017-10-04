// ----------------------------------------------------------------------------
//
//  Swift.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

/// The MDCoding protocol declares the two methods that a class must implement
/// so that instances of that class can be encoded and decoded.
@available(*, deprecated)
public protocol MDCoding: AnyObject
{
    /// Decodes an object initialized from data in a given unarchiver.
    @available(*, deprecated)
    init?(coder decoder: NSCoder)

    /// Encodes the receiver using a given archiver.
    @available(*, deprecated)
    func encode(coder encoder: NSCoder) -> Bool

    /// Decodes the receiver using a given unarchiver.
    @available(*, deprecated)
    func decode(coder decoder: NSCoder) -> Bool
}

// ----------------------------------------------------------------------------

/// The MDCopying protocol declares a method for providing functional copies
/// of an object.
@available(*, deprecated)
public protocol MDCopying: NSCopying
{
    /// Returns a new instance that’s a copy of the receiver.
    @available(*, deprecated)
    func copy() -> Self
}

// ----------------------------------------------------------------------------

/// A type with a customized textual representation.
@available(*, deprecated)
@objc public protocol RXMCustomStringConvertible
{
    /// A textual representation of `self`.
    @available(*, deprecated)
    var description: String { get }
}

// ----------------------------------------------------------------------------

/// A type with a customized textual representation suitable for debugging purposes.
@available(*, deprecated)
@objc public protocol RXMCustomDebugStringConvertible
{
    /// A textual representation of `self`, suitable for debugging.
    @available(*, deprecated)
    var debugDescription: String { get }
}

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

/// Creates a custom tag for any class.
@available(*, deprecated)
public func roxie_customTag(clazz: AnyClass) -> String
{
    let nameTag = NSStringFromClass(clazz).rxm_md5String.substring(upto: 8)
    let timeTag = mach_absolute_time().rxm_hexString.substring(from: 8)

    // Done
    return "urn:tag:\(nameTag):\(timeTag)"
}

// ----------------------------------------------------------------------------
// MARK: - Operators
// ----------------------------------------------------------------------------

infix operator &&=


@available(*, deprecated)
public func &&= (_ lhs: inout Bool, rhs: Bool ) {
    lhs = lhs && rhs
}

@available(*, deprecated)
public func &&= (_ lhs: inout Bool, rhs: Bool?) {
    lhs = lhs && (rhs ?? false)
}

// ----------------------------------------------------------------------------
