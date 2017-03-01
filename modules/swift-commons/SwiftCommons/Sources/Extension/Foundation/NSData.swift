// ----------------------------------------------------------------------------
//
//  NSData.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension NSData
{
// MARK: - Properties

    /// Checks if a NSData is empty.
    var isEmpty: Bool { return (self.length < 1) }

// MARK: - Methods

    static func isEmpty(object: NSData?) -> Bool {
        return (object == nil) || object!.isEmpty
    }

    static func isNotEmpty(object: NSData?) -> Bool {
        return !isEmpty(object)
    }
}

// ----------------------------------------------------------------------------
