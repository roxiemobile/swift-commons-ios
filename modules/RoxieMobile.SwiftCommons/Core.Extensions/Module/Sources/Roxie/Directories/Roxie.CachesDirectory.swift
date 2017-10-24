// ----------------------------------------------------------------------------
//
//  Roxie.CachesDirectory.swift
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

    /// Returns the caches directory for the current user.
    public static var cachesDirectory: URL? {
        return Directories.Caches
    }

// MARK: - Constants

    private struct Directories
    {
        /// The caches directory for the current user.
        static let Caches: URL? = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
    }
}

// ----------------------------------------------------------------------------
