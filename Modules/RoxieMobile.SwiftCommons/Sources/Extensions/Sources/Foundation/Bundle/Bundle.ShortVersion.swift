// ----------------------------------------------------------------------------
//
//  Bundle.ShortVersion.swift
//
//  @author     Denis Kolyasev <KolyasevDA@ekassir.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension Bundle {

// MARK: - Properties

    /// Returns the release version number of the bundle, which identifies a released iteration of the app.
    var shortVersion: String? {
        return self.infoDictionary?[Inner.ShortVersionKey] as? String
    }

// MARK: - Constants

    private struct Inner {
        static let ShortVersionKey = "CFBundleShortVersionString"
    }
}
