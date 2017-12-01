// ----------------------------------------------------------------------------
//
//  FileManager.ExcludeFromBackup.swift
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
// MARK: - Methods

    /// Excludes files and directories from iCloud backups.
    ///
    /// - Parameters:
    ///   - URL: A file URL specifying the file or directory to exclude from iCloud backups.
    ///
    /// - Returns:
    ///   `true` if resource successfully excluded from backups, `false` otherwise.
    ///
    @discardableResult
    public static func roxie_excludeFromBackup(at URL: URL?) -> Bool {
        let fm = FileManager.default

        guard let path = URL?.path, fm.fileExists(atPath: path) else {
            return false
        }

        // How do I prevent files from being backed up to iCloud and iTunes?
        // @link https://developer.apple.com/library/ios/qa/qa1719/_index.html

        // NSURLIsExcludedFromBackupKey can not be set correctly
        // @link http://stackoverflow.com/a/11012288

        // Prevent app from backing up documents folder?
        // @link http://stackoverflow.com/a/24778883

        let expandedPath = (path as NSString).expandingTildeInPath
        var fileURL = Foundation.URL(fileURLWithPath: expandedPath)

        var resourceValues = URLResourceValues()
        resourceValues.isExcludedFromBackup = true

        // Done
        return (try? fileURL.setResourceValues(resourceValues)) != nil
    }
}

// ----------------------------------------------------------------------------
