// ----------------------------------------------------------------------------
//
//  String.Empty.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public extension String
{
// MARK: - Properties

    /// Checks if a String is not empty ("").
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }
}

// ----------------------------------------------------------------------------

public extension Optional where Wrapped == String
{
// MARK: - Properties

    /// Checks if a String is empty ("") or nil.
    public var isEmpty: Bool {
        return (self == nil) || self!.isEmpty
    }

    /// Checks if a String is not empty ("") and not nil.
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }
}

// ----------------------------------------------------------------------------
