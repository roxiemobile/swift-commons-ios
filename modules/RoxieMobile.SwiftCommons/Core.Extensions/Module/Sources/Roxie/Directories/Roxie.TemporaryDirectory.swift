// ----------------------------------------------------------------------------
//
//  Roxie.TemporaryDirectory.swift
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
// MARK: - Properties

    /// Returns the temporary directory for the current user.
    public static var temporaryDirectory: URL? {
        return Directories.Temporary
    }

// MARK: - Constants

    private struct Directories
    {
        /// The temporary directory for the current user.
        static let Temporary: URL? = URL.init(fileURLWithPath: NSTemporaryDirectory())
    }
}

// ----------------------------------------------------------------------------
