// ----------------------------------------------------------------------------
//
//  OptionalWrapper.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
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

    public var wrappedType: Any.Type {
        return Wrapped.self
    }
}

// ----------------------------------------------------------------------------
