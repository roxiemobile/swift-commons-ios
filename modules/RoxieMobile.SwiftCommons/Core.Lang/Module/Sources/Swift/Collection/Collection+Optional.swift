// ----------------------------------------------------------------------------
//
//  Collection+Optional.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public extension Optional where Wrapped: Collection
{
// MARK: - Properties

    /// Checks if collection has no elements or nil.
    public var isEmpty: Bool { return (self == nil) || self!.isEmpty }

    /// Checks if collection has elements and not nil.
    public var isNotEmpty: Bool { return !isEmpty }
}

// ----------------------------------------------------------------------------
