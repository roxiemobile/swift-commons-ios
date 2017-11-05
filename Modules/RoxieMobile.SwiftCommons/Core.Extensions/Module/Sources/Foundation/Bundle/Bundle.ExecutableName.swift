// ----------------------------------------------------------------------------
//
//  Bundle.ExecutableName.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension Bundle
{
// MARK: - Properties

    /// Returns the name of the bundle’s main executable file. For an app, this is the app executable.
    public var executableName: String? {
        return self.infoDictionary?[Inner.ExecutableNameKey] as? String
    }

// MARK: - Constants

    private struct Inner {
        static let ExecutableNameKey = kCFBundleExecutableKey as String
    }
}

// ----------------------------------------------------------------------------
