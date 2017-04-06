// ----------------------------------------------------------------------------
//
//  FileManager.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension FileManager
{
// MARK: - Properties

    /// Returns documents directory.
    public class var documentsDirectory: URL?
    {
        struct Singleton {
            static let directory: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        }
        return Singleton.directory
    }

    /// Returns caches directory.
    public class var cachesDirectory: URL?
    {
        struct Singleton {
            static let directory: URL? = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        }
        return Singleton.directory
    }

    /// Returns temporary directory.
    public class var temporaryDirectory: URL?
    {
        struct Singleton {
            static let directory: URL? = URL.init(fileURLWithPath: NSTemporaryDirectory())
        }
        return Singleton.directory
    }

    /// Returns databases directory.
    public class var databasesDirectory: URL?
    {
        struct Singleton {
            static let directory: URL? = {

                var directory: URL? = FileManager.documentsDirectory?.appendingPathComponent(Inner.DatabasesDirectory)
                let fm = FileManager.default

                // Create directory if not exists
                if let path = directory?.path, !fm.fileExists(atPath: path)
                {
                    do {
                        try fm.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                    } catch _ {
                    }
                    FileManager.excludedPathFromBackup(url: directory)
                }

                // Done
                return directory
            }()
        }
        return Singleton.directory
    }

// MARK: - Methods

    /// Excludes files and directories from iCloud backups.
    public static func excludedPathFromBackup(url: URL?) -> Bool
    {
        guard let path = url?.path, FileManager.default.fileExists(atPath: path) else {
            return false
        }

        // How do I prevent files from being backed up to iCloud and iTunes?
        // @link https://developer.apple.com/library/ios/qa/qa1719/_index.html

        // NSURLIsExcludedFromBackupKey can not be set correctly
        // @link http://stackoverflow.com/a/11012288

        // Prevent app from backing up documents folder?
        // @link http://stackoverflow.com/a/24778883

        let expandedPath = (path as NSString).expandingTildeInPath
        var url = URL.init(fileURLWithPath: expandedPath)

        var resourceValues = URLResourceValues()
        resourceValues.isExcludedFromBackup = true

        return (try? url.setResourceValues(resourceValues)) == nil ? false : true
    }

// MARK: - Constants

    private struct Inner {
        static let DatabasesDirectory = "Databases"
    }

}

// ----------------------------------------------------------------------------
// MARK: - Global Functions
// ----------------------------------------------------------------------------

public func rxm_removeItemAtURL(url: URL?)
{
    guard let url = url else {
        return
    }

    let fileManager = FileManager.default

    let path = url.path
    if fileManager.fileExists(atPath: path) {
        do {
            try fileManager.removeItem(at: url)
        }
        catch {
            Logger.e(#function, "Can't remove item with URL \(url)", error)
        }
    }
}

public func rxm_copyItemAtURL(srcURL: URL?, toURL dstURL: URL?) -> Bool
{
    guard let srcURL = srcURL, let dstURL = dstURL else {
        return false
    }

    let fileManager = FileManager.default

    let srcPath = srcURL.path
    guard fileManager.fileExists(atPath: srcPath) else {
        Logger.e(#function, "Can't copy item from non-existing URL \(srcURL)")
        return false
    }

    do {
        try fileManager.copyItem(at: srcURL, to: dstURL)
        return true
    }
    catch {
        Logger.e(#function, "Can't copy item from URL \(srcURL) to URL \(dstURL)", error)
        return false
    }
}

// ----------------------------------------------------------------------------
