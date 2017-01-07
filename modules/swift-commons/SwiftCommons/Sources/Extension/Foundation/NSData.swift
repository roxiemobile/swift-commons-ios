// ----------------------------------------------------------------------------
//
//  NSData.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension NSData
{
// MARK: - Properties

    var isEmpty: Bool {
        return (self.length < 1)
    }

// MARK: - Methods

    static func isNilOrEmpty(obj: NSData?) -> Bool {
        return (obj == nil) || obj!.isEmpty
    }

}

// ----------------------------------------------------------------------------
