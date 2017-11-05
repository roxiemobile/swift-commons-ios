// ----------------------------------------------------------------------------
//
//  FileManager.RemoveItem.swift
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
// MARK: - Methods

    /// Removes the file or directory at the specified URL.
    ///
    /// - Parameters:
    ///   - URL: A file URL specifying the file or directory to remove. If the URL specifies a directory, the contents of that directory are recursively removed.
    ///
    /// - Returns:
    ///   `true` if the item was removed successfully. Returns `false` if an error occurred.
    ///
    @discardableResult
    public static func roxie_removeItem(at URL: URL?) -> Bool {
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

// MARK: - Constants

    private struct Inner {
        static let TAG = FileManager.self
    }
}

// ----------------------------------------------------------------------------
