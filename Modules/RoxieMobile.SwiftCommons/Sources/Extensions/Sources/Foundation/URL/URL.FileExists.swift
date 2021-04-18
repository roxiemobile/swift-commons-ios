// ----------------------------------------------------------------------------
//
//  URL.FileExists.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension URL {

// MARK: - Properties

    /// Returns a Boolean value that indicates whether a file or directory exists at a specified path.
    var roxie_fileExists: Bool {
        return self.isFileURL && ((try? checkResourceIsReachable()) == true)
    }
}
