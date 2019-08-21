// ----------------------------------------------------------------------------
//
//  String.Localized.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension String
{
// MARK: - Properties

    /// Returns a localized string, using the main bundle.
    public var localized: String {
        return localized()
    }

// MARK: - Methods

    /// Returns a localized string, using the main bundle if one is not specified.
    public func localized(tableName: String? = nil, bundle: Bundle? = nil, value: String? = nil, comment: String? = nil) -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle ?? Bundle.main, value: value ?? "", comment: comment ?? "")
    }
}

// ----------------------------------------------------------------------------
