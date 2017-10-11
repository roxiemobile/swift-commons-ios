// ----------------------------------------------------------------------------
//
//  Roxie.CustomTag.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

public extension Roxie
{
// MARK: - Methods

    /// Creates a custom tag for any class.
    public func customTag(clazz: AnyClass) -> String
    {
        let nameTag = String(format:"%08lx", Roxie.typeName(of: clazz).hashValue)
        let timeTag = String(format:"%08lx", mach_absolute_time())

        // Done
        return "urn:tag:\(nameTag):\(timeTag)"
    }
}

// ----------------------------------------------------------------------------

