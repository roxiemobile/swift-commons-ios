// ----------------------------------------------------------------------------
//
//  Data.Empty.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension Data {

// MARK: - Properties

    /// Checks if a `Data` is not empty.
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}

// ----------------------------------------------------------------------------

public extension Optional where Wrapped == Data {

// MARK: - Properties

    /// Checks if a `Data` is empty or `nil`.
    var isEmpty: Bool {
        return (self == nil) || self!.isEmpty
    }

    /// Checks if a `Data` is not empty and not `nil`.
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
