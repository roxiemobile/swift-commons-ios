// ----------------------------------------------------------------------------
//
//  String.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

// A set of Swift extensions for standard types and classes.
// @link https://github.com/pNre/ExSwift

// What's NSLocalizedString equivalent in Swift?
// @link http://stackoverflow.com/a/29384360

// ----------------------------------------------------------------------------

public extension String
{
// MARK: - Properties

    /// Returns a localized string, using the main bundle.
    @available(*, deprecated)
    var localized: String { return self.localized() }

    /// String length.
    @available(*, deprecated)
    var length: Int { return self.characters.count }

// MARK: - Methods

    /// Returns a localized string.
    @available(*, deprecated)
    func localized(tableName tn: String? = nil, bundle bn: Bundle? = nil, value vl: String? = nil, comment cm: String? = nil) -> String {
        return NSLocalizedString(self, tableName: tn, bundle: bn ?? Bundle.main, value: vl ?? "", comment: cm ?? "")
    }

// MARK: -

    @available(*, deprecated)
    func escapeString(encoding: UInt = String.Encoding.utf8.rawValue) -> String
    {
        return CFURLCreateStringByAddingPercentEscapes(
                kCFAllocatorDefault,
                self as CFString!,
                CharacterSet.ToLeaveUnescaped,
                CharacterSet.ToBeEscaped,
                CFStringConvertNSStringEncodingToEncoding(encoding)
        ) as String
    }

// MARK: - Constants

    @available(*, deprecated)
    private struct CharacterSet
    {
        fileprivate static let ToBeEscaped: NSString = ":/?&=;+!@#$()',*"
        fileprivate static let ToLeaveUnescaped: NSString = "[]."
    }
}

// ----------------------------------------------------------------------------
