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

    /// Checks if a String is not empty ("").
    @available(*, deprecated)
    var isNotEmpty: Bool { return !self.isEmpty }

    /// Checks if a String is empty ("") or whitespace only.
    @available(*, deprecated)
    var isBlank: Bool { return StringUtils.isBlank(self) }

    /// Checks if a String is not empty ("") and not whitespace only.
    @available(*, deprecated)
    var isNotBlank: Bool { return !self.isBlank }

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

    @available(*, deprecated)
    func substringFrom(index idx: Int) -> String
    {
        let from = self.index(self.startIndex, offsetBy: idx)
        return String(self[from...])
    }

    @available(*, deprecated)
    func substringUpto(index idx: Int) -> String
    {
        let upto = self.index(self.startIndex, offsetBy: idx)
        return String(self[self.startIndex..<upto])
    }

    @available(*, deprecated)
    func substring(range rng: Range<Int>) -> String
    {
        let from = self.index(self.startIndex, offsetBy: rng.lowerBound)
        let upto = self.index(self.startIndex, offsetBy: rng.upperBound)
        return String(self[from..<upto])
    }

// MARK: -

    /// Trims whitespaces from the beginning of self.
    @available(*, deprecated)
    func trimStart() -> String {
        return StringUtils.stripStart(self)
    }

    /// Trims whitespaces from the end of self.
    @available(*, deprecated)
    func trimEnd() -> String {
        return StringUtils.stripEnd(self)
    }

    /// Trims whitespaces from both the beginning and the end of self.
    @available(*, deprecated)
    func trim() -> String {
        return StringUtils.strip(self)
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
