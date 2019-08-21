// ----------------------------------------------------------------------------
//
//  Bundle.ShortVersion.swift
//
//  @author     Denis Kolyasev <KolyasevDA@ekassir.com>
//  @copyright  Copyright (c) 2015, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension Bundle
{
// MARK: - Properties

    /// Returns the release version number of the bundle, which identifies a released iteration of the app.
    public var shortVersion: String? {
        return self.infoDictionary?[Inner.ShortVersionKey] as? String
    }

// MARK: - Constants

    private struct Inner {
        static let ShortVersionKey = "CFBundleShortVersionString"
    }
}

// ----------------------------------------------------------------------------
