// ----------------------------------------------------------------------------
//
//  Roxie.DocumentsDirectory.swift
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

    /// Returns the documents directory for the current user.
    public static var documentsDirectory: URL? {
        return Directories.Documents
    }

// MARK: - Constants

    private struct Directories
    {
        /// The documents directory for the current user.
        static let Documents: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
}

// ----------------------------------------------------------------------------
