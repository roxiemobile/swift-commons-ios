// ----------------------------------------------------------------------------
//
//  OptionalWrapper.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

// Check if variable is an Optional, and what type it wraps
// @link https://stackoverflow.com/a/32781143

// ----------------------------------------------------------------------------

public protocol OptionalWrapper
{
// MARK: - Properties

    var wrappedType: Any.Type { get }
}

// ----------------------------------------------------------------------------

extension Optional: OptionalWrapper
{
// MARK: - Properties

    /// Checks if an object is `nil`.
    public var isNone: Bool {
        return self == nil
    }

    /// Returns type wrapped by an `Optional`.
    public var wrappedType: Any.Type {
        return Wrapped.self
    }
}

// ----------------------------------------------------------------------------
