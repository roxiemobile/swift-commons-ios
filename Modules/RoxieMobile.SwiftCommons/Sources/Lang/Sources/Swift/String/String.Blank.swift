// ----------------------------------------------------------------------------
//
//  String.Blank.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public extension String
{
// MARK: - Properties

    /// Checks if a String is empty ("") or whitespace only.
    public var isBlank: Bool {
        return trim().isEmpty
    }

    /// Checks if a String is not empty ("") and not whitespace only.
    public var isNotBlank: Bool {
        return !self.isBlank
    }
}

// ----------------------------------------------------------------------------

public extension Optional where Wrapped == String
{
// MARK: - Properties

    /// Checks if a String is empty (""), nil or whitespace only.
    public var isBlank: Bool {
        return (self == nil) || self!.trim().isEmpty
    }

    /// Checks if a String is not empty (""), not nil and not whitespace only.
    public var isNotBlank: Bool {
        return !self.isBlank
    }
}

// ----------------------------------------------------------------------------
