// ----------------------------------------------------------------------------
//
//  FileManager.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommons

// ----------------------------------------------------------------------------

extension FileManager
{
// MARK: - Properties

    /// Returns the databases directory for the current user.
    internal static var roxie_databasesDirectory: URL?
    {
        struct Singleton {
            static let directory: URL? = {

                var dstURL: URL? = FileManager.roxie_documentsDirectory?.appendingPathComponent(Inner.DatabasesDirectory)
                let fm = FileManager.default

                // Create directory if not exists
                if let dstPath = dstURL?.path {

                    if !fm.fileExists(atPath: dstPath) {
                        do {
                            try fm.createDirectory(atPath: dstPath, withIntermediateDirectories: true, attributes: nil)
                        }
                        catch {
                            Logger.e(Inner.TAG, "Can't create directory at URL ‘\(dstURL)’.", error)
                        }
                    }
                    FileManager.roxie_excludedFromBackup(at: dstURL)
                }

                // Done
                return dstURL
            }()
        }
        return Singleton.directory
    }

// MARK: - Constants

    private struct Inner {
        static let TAG = FileManager.self
        static let DatabasesDirectory = "Databases"
    }
}

// ----------------------------------------------------------------------------
