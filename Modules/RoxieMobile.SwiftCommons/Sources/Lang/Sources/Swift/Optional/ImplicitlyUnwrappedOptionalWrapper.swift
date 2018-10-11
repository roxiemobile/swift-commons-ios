// ----------------------------------------------------------------------------
//
//  ImplicitlyUnwrappedOptionalWrapper.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

// Check if variable is an Optional, and what type it wraps
// @link https://stackoverflow.com/a/32781143

// ----------------------------------------------------------------------------

// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
public protocol ImplicitlyUnwrappedOptionalWrapper
{
// MARK: - Properties

    var wrappedType: Any.Type { get }
}
#endif

// ----------------------------------------------------------------------------

// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
extension ImplicitlyUnwrappedOptional: ImplicitlyUnwrappedOptionalWrapper
{
// MARK: - Properties

    /// Checks if an object is `nil`.
    public var isNone: Bool {
        return self == nil
    }

    /// Returns type wrapped by an `ImplicitlyUnwrappedOptional`.
    public var wrappedType: Any.Type {
        return Wrapped.self
    }
}
#endif

// ----------------------------------------------------------------------------
