// ----------------------------------------------------------------------------
//
//  Roxie.NewTag.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommons

// ----------------------------------------------------------------------------

public extension Roxie
{
// MARK: - Methods

    /// Creates a new URN tag for any object.
    public static func newTag(for subject: Any) -> String
    {
        let nameTag = String(format:"%08lx", UInt32(truncatingIfNeeded: Roxie.typeName(of: subject).hashValue))
        let timeTag = String(format:"%08lx", UInt32(truncatingIfNeeded: mach_absolute_time()))

        // Done
        return "urn:tag:\(nameTag):\(timeTag)"
    }
}

// ----------------------------------------------------------------------------
