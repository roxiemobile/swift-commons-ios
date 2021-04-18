// ----------------------------------------------------------------------------
//
//  String.Empty.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public extension String {

// MARK: - Properties

    /// Checks if a String is not empty ("").
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}

// ----------------------------------------------------------------------------

public extension Optional where Wrapped == String {

// MARK: - Properties

    /// Checks if a String is empty ("") or nil.
    var isEmpty: Bool {
        return (self == nil) || self!.isEmpty
    }

    /// Checks if a String is not empty ("") and not nil.
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
