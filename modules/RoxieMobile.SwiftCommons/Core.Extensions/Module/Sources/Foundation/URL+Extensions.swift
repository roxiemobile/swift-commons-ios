// ----------------------------------------------------------------------------
//
//  URL+Extensions.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension URL
{
// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    public var roxie_fileExists: Bool {
        return self.isFileURL && ((try? checkResourceIsReachable()) ?? false)
    }
}

// ----------------------------------------------------------------------------
