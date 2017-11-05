// ----------------------------------------------------------------------------
//
//  Data.Empty.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension Data
{
// MARK: - Properties

    /// Checks if a `Data` is not empty.
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }
}

// ----------------------------------------------------------------------------

public extension Optional where Wrapped == Data
{
// MARK: - Properties

    /// Checks if a `Data` is empty or `nil`.
    public var isEmpty: Bool {
        return (self == nil) || self!.isEmpty
    }

    /// Checks if a `Data` is not empty and not `nil`.
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }
}

// ----------------------------------------------------------------------------
