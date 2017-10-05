// ----------------------------------------------------------------------------
//
//  String+Optional.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public extension Optional where Wrapped == String
{
// MARK: - Properties

    /// Checks if a String is empty ("") or nil.
    public var isEmpty: Bool { return (self == nil) || self!.isEmpty }

    /// Checks if a String is not empty ("") and not nil.
    public var isNotEmpty: Bool { return !self.isEmpty }

    /// Checks if a String is empty (""), nil or whitespace only.
    public var isBlank: Bool { return (self == nil) || self!.trim().isEmpty }

    /// Checks if a String is not empty (""), not nil and not whitespace only.
    public var isNotBlank: Bool { return !self.isBlank }
}

// ----------------------------------------------------------------------------
