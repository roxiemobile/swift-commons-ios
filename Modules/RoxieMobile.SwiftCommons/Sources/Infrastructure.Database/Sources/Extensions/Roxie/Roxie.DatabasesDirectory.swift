// ----------------------------------------------------------------------------
//
//  Roxie.DatabasesDirectory.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommonsCoreLang
import SwiftCommonsCoreLogging

// ----------------------------------------------------------------------------

public extension Roxie
{
// MARK: - Properties

    /// Returns the databases directory for the current user.
    public static var databasesDirectory: URL? {
        return Directories.Databases
    }

// MARK: - Private Methods

    private static func findOrCreateDirectory(_ pathComponent: String) -> URL?
    {
        let dstURL: URL? = Roxie.documentsDirectory?.appendingPathComponent(pathComponent)
        let fm = FileManager.default

        // Create directory if not exists
        if let dstPath = dstURL?.path, let dstURL = dstURL {

            if !fm.fileExists(atPath: dstPath) {
                do {
                    try fm.createDirectory(atPath: dstPath, withIntermediateDirectories: true, attributes: nil)
                }
                catch {
                    Logger.e(Roxie.self, "Can't create directory at URL ‘\(dstURL)’.", error)
                }
            }
            FileManager.roxie_excludeFromBackup(at: dstURL)
        }

        // Done
        return dstURL
    }

// MARK: - Constants

    private struct Directories
    {
        /// The databases directory for the current user.
        static let Databases: URL? = Roxie.findOrCreateDirectory("Databases")
    }
}

// ----------------------------------------------------------------------------
