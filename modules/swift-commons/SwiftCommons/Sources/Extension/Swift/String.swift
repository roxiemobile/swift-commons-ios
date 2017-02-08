// ----------------------------------------------------------------------------
//
//  String.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension String
{
// MARK: - Properties

    /**
     * String length.
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    var length: Int { return self.characters.count }

// MARK: - Methods

    static func isNilOrEmpty(str: String?) -> Bool {
        return (str == nil) || str!.isEmpty
    }

    static func isNotEmpty(str: String?) -> Bool {
        return !isNilOrEmpty(str)
    }

    static func isNilOrWhiteSpace(str: String?) -> Bool {
        return (str == nil) || str!.trimmed().isEmpty
    }

    static func isNotBlank(str: String?) -> Bool {
        return isNilOrWhiteSpace(str)
    }

// --

    func escapeString(encoding: UInt = NSUTF8StringEncoding) -> String {
        return CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, self, CharacterSet.ToLeaveUnescaped, CharacterSet.ToBeEscaped, CFStringConvertNSStringEncodingToEncoding(encoding)) as String
    }

    func substringFromIndex(index: Int) -> String {
        return self.substringFromIndex(self.startIndex.advancedBy(index))
    }

    func substringToIndex(index: Int) -> String {
        return self.substringToIndex(self.startIndex.advancedBy(index))
    }

    func substringWithRange(range: Range<Int>) -> String
    {
        let from = self.startIndex.advancedBy(range.startIndex)
        let upto = self.startIndex.advancedBy(range.endIndex)

        return self.substringWithRange(from ..< upto)
    }

    /**
     * Strips whitespaces from the beginning of self.
     *
     * - returns: Stripped string
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    func ltrimmed() -> String {
        return ltrimmed(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }

    /**
     * Strips the specified characters from the beginning of self.
     *
     * - returns: Stripped string
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    func ltrimmed(set: NSCharacterSet) -> String
    {
        if let range = rangeOfCharacterFromSet(set.invertedSet) {
            return self[range.startIndex ..< endIndex]
        }

        return ""
    }

    /**
     * Strips whitespaces from the end of self.
     *
     * - returns: Stripped string
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    func rtrimmed() -> String {
        return rtrimmed(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    /**
     * Strips the specified characters from the end of self.
     *
     * - returns: Stripped string
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    func rtrimmed(set: NSCharacterSet) -> String
    {
        if let range = rangeOfCharacterFromSet(set.invertedSet, options: NSStringCompareOptions.BackwardsSearch) {
            return self[startIndex ..< range.endIndex]
        }

        return ""
    }

    /**
     * Strips whitespaces from both the beginning and the end of self.
     *
     * - returns: Stripped string
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    func trimmed() -> String {
        return ltrimmed().rtrimmed()
    }

// MARK: - Constants

    private struct CharacterSet
    {
        private static let ToBeEscaped = ":/?&=;+!@#$()',*"
        private static let ToLeaveUnescaped = "[]."
    }

}

// ----------------------------------------------------------------------------
