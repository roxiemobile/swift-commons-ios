// ----------------------------------------------------------------------------
//
//  FileManager.Directories.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension FileManager
{
// MARK: - Properties

    /// Returns the documents directory for the current user.
    public static var roxie_documentsDirectory: URL? {
        return Directories.Documents
    }

    /// Returns the caches directory for the current user.
    public static var roxie_cachesDirectory: URL? {
        return Directories.Caches
    }

    /// Returns the temporary directory for the current user.
    public static var roxie_temporaryDirectory: URL? {
        return Directories.Temporary
    }

// MARK: - Constants

    private struct Directories
    {
        /// The documents directory for the current user.
        static let Documents: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

        /// The caches directory for the current user.
        static let Caches: URL? = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first

        /// The temporary directory for the current user.
        static let Temporary: URL? = URL.init(fileURLWithPath: NSTemporaryDirectory())
    }
}

// ----------------------------------------------------------------------------
