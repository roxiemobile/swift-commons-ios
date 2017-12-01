// ----------------------------------------------------------------------------
//
//  Swift.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

/// A type with a customized textual representation.
@objc
public protocol CustomStringConvertibleObjC
{
    /// A textual representation of this instance.
    var description: String { get }
}

// ----------------------------------------------------------------------------

/// A type with a customized textual representation suitable for debugging purposes.
@objc
public protocol CustomDebugStringConvertibleObjC
{
    /// A textual representation of this instance, suitable for debugging.
    var debugDescription: String { get }
}

// ----------------------------------------------------------------------------
// MARK: - Operators
// ----------------------------------------------------------------------------

infix operator &&=

/// Stores the result of performing a logical AND operation on two given Boolean values
/// in the left-hand-side variable.
public func &&=(_ lhs: inout Bool, rhs: Bool) {
    lhs = lhs && rhs
}

/// Stores the result of performing a logical AND operation on two given Boolean values
/// in the left-hand-side variable.
public func &&=(_ lhs: inout Bool, rhs: Bool?) {
    lhs = lhs && (rhs ?? false)
}

// ----------------------------------------------------------------------------
