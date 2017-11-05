// ----------------------------------------------------------------------------
//
//  FileManager.CopyItem.swift
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

    /// Copies the file at the specified URL to a new location synchronously.
    ///
    /// - Parameters:
    ///   - srcURL: The file URL that identifies the file you want to copy. The URL in this parameter must not be a file reference URL.
    ///   - dstURL: The URL at which to place the copy of `srcURL`. The URL in this parameter must not be a file reference URL and must include the name of the file in its new location.
    ///
    /// - Returns:
    ///   `true` if the item was copied successfully. Returns `false` if an error occurred.
    ///
    @discardableResult
    public static func roxie_copyItem(at srcURL: URL?, to dstURL: URL?) -> Bool {
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

// MARK: - Constants

    private struct Inner {
        static let TAG = FileManager.self
    }
}

// ----------------------------------------------------------------------------
