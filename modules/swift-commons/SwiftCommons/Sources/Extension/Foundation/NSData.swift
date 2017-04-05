// ----------------------------------------------------------------------------
//
//  Data.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension Data
{
// MARK: - Properties

    /// Checks if a NSData is empty.
    var isEmpty: Bool { return (self.count < 1) }

// MARK: - Methods

    static func isEmpty(_ object: Data?) -> Bool {
        return (object == nil) || object!.isEmpty
    }

    static func isNotEmpty(_ object: Data?) -> Bool {
        return !isEmpty(object)
    }
}

// ----------------------------------------------------------------------------
