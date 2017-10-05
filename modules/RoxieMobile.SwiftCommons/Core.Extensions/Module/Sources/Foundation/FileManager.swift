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

public extension FileManager
{
// MARK: - Properties

    /// Returns the documents directory for the current user.
    public static var roxie_documentsDirectory: URL?
    {
        struct Singleton {
            static let directory: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        }
        return Singleton.directory
    }

    /// Returns the caches directory for the current user.
    public static var roxie_cachesDirectory: URL?
    {
        struct Singleton {
            static let directory: URL? = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        }
        return Singleton.directory
    }

    /// Returns the temporary directory for the current user.
    public static var roxie_temporaryDirectory: URL?
    {
        struct Singleton {
            static let directory: URL? = URL.init(fileURLWithPath: NSTemporaryDirectory())
        }
        return Singleton.directory
    }

// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    @discardableResult
    public static func roxie_removeItem(at URL: URL?) -> Bool
    {
        let fm = FileManager.default
        var result = false

        if let srcURL = URL {
            if fm.fileExists(atPath: srcURL.path) {
                do {
                    try fm.removeItem(at: srcURL)
                    result = true
                }
                catch {
                    Logger.e(Inner.TAG, "Can't remove item at URL ‘\(srcURL)’.", error)
                }
            }
            else {
                Logger.w(Inner.TAG, "Item at URL ‘\(srcURL)’ doesn't exists.")
            }
        }
        return result
    }

    @available(*, deprecated, message: "\n• Write a description.")
    @discardableResult
    public static func roxie_copyItem(at srcURL: URL?, to dstURL: URL?) -> Bool
    {
        let fm = FileManager.default
        var result = false

        if let srcURL = srcURL, let dstURL = dstURL {
            if fm.fileExists(atPath: srcURL.path) {
                do {
                    try fm.copyItem(at: srcURL, to: dstURL)
                    result = true
                }
                catch {
                    Logger.e(Inner.TAG, "Can't copy item from URL ‘\(srcURL)’ to URL ‘\(dstURL)’.", error)
                }
            }
            else {
                Logger.w(Inner.TAG, "Item at URL ‘\(srcURL)’ doesn't exists.")
            }
        }
        return result
    }

    /// Excludes files and directories from iCloud backups.
    @discardableResult
    public static func roxie_excludedFromBackup(at srcURL: URL?) -> Bool
    {
        guard let srcPath = srcURL?.path, FileManager.default.fileExists(atPath: srcPath) else {
            return false
        }

        // How do I prevent files from being backed up to iCloud and iTunes?
        // @link https://developer.apple.com/library/ios/qa/qa1719/_index.html

        // NSURLIsExcludedFromBackupKey can not be set correctly
        // @link http://stackoverflow.com/a/11012288

        // Prevent app from backing up documents folder?
        // @link http://stackoverflow.com/a/24778883

        let expandedPath = (srcPath as NSString).expandingTildeInPath
        var fileURL = URL.init(fileURLWithPath: expandedPath)

        var resourceValues = URLResourceValues()
        resourceValues.isExcludedFromBackup = true

        // Done
        return (try? fileURL.setResourceValues(resourceValues)) != nil
    }

// MARK: - Constants

    fileprivate struct Inner {
        static let TAG = FileManager.self
    }
}

// ----------------------------------------------------------------------------
