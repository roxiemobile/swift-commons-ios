// ----------------------------------------------------------------------------
//
//  NSFileManager.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension NSFileManager
{
// MARK: - Properties

    /// Rerurns documents directory.
    public class var documentsDirectory: NSURL?
    {
        struct Singleton {
            static let directory: NSURL? = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first
        }
        return Singleton.directory
    }

    /// Rerurns caches directory.
    public class var cachesDirectory: NSURL?
    {
        struct Singleton {
            static let directory: NSURL? = NSFileManager.defaultManager().URLsForDirectory(.CachesDirectory, inDomains: .UserDomainMask).first
        }
        return Singleton.directory
    }

    /// Rerurns temporary directory.
    public class var temporaryDirectory: NSURL?
    {
        struct Singleton {
            static let directory: NSURL? = NSURL.fileURLWithPath(NSTemporaryDirectory())
        }
        return Singleton.directory
    }

    /// Rerurns databases directory.
    public class var databasesDirectory: NSURL?
    {
        struct Singleton {
            static let directory: NSURL? = {

                var directory: NSURL? = NSFileManager.documentsDirectory?.URLByAppendingPathComponent(Inner.DatabasesDirectory)
                let fm = NSFileManager.defaultManager()

                // Create directory if not exists
                if let path = directory?.path where !fm.fileExistsAtPath(path)
                {
                    do {
                        try fm.createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil)
                    } catch _ {
                    }
                    NSFileManager.excludedPathFromBackup(directory)
                }

                // Done
                return directory
            }()
        }
        return Singleton.directory
    }

// MARK: - Functions

    /// Excludes files and directories from iCloud backups.
    public static func excludedPathFromBackup(url: NSURL?) -> Bool
    {
        guard let path = url?.path where NSFileManager.defaultManager().fileExistsAtPath(path) else {
            return false
        }

        // How do I prevent files from being backed up to iCloud and iTunes?
        // @link https://developer.apple.com/library/ios/qa/qa1719/_index.html

        // NSURLIsExcludedFromBackupKey can not be set correctly
        // @link http://stackoverflow.com/a/11012288

        // Prevent app from backing up documents folder?
        // @link http://stackoverflow.com/a/24778883

        let expandedPath = (path as NSString).stringByExpandingTildeInPath
        let url = NSURL.fileURLWithPath(expandedPath)
        return (try? url.setResourceValue(NSNumber(bool: true), forKey: NSURLIsExcludedFromBackupKey)) == nil
              ? false : true
    }

// MARK: - Constants

    private struct Inner {
        static let DatabasesDirectory = "Databases"
    }

}

// MARK: - Global Functions

public func mdc_removeItemAtURL(url: NSURL?)
{
    guard let url = url else {
        return
    }
    
    let fileManager = NSFileManager.defaultManager()
    if let path = url.path where fileManager.fileExistsAtPath(path) {
        do {
            try fileManager.removeItemAtURL(url)
        } catch {
            MDLog.e("Can't remove item with URL \(url), error: \(error)")
        }
    }
}

public func mdc_copyItemAtURL(srcURL: NSURL?, toURL dstURL: NSURL?) -> Bool
{
    guard let srcURL = srcURL,
          let dstURL = dstURL else {
        return false
    }
    
    let fileManager = NSFileManager.defaultManager()
    
    guard let srcPath = srcURL.path where fileManager.fileExistsAtPath(srcPath) else {
        MDLog.e("Can't copy item from non-existing URL \(srcURL)")
        return false
    }
    
    do {
        try fileManager.copyItemAtURL(srcURL, toURL: dstURL)
        return true
    } catch {
        MDLog.e("Can't copy item from URL \(srcURL) to URL \(dstURL), error: \(error)")
        return false
    }
}

// ----------------------------------------------------------------------------
