// ----------------------------------------------------------------------------
//
//  String.Strip.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension String
{
// MARK: - Methods

    /// Strips any of a set of characters from the start of a String.
    ///
    /// If the stripChars String is {@code nil}, whitespace is stripped.
    ///
    /// @param stripChars The characters to remove, {@code nil} treated as whitespace
    /// @return the stripped String
    ///
    public func stripStart(stripChars: CharacterSet? = nil) -> String {
        let set = stripChars ?? CharacterSet.whitespacesAndNewlines
        var result = ""

        if let range = rangeOfCharacter(from: set.inverted) {
            result = String(self[range.lowerBound...])
        }
        return result
    }

    /// Strips any of a set of characters from the end of a String.
    ///
    /// If the stripChars String is {@code nil}, whitespace is stripped.
    ///
    /// @param stripChars The set of characters to remove, {@code nil} treated as whitespace
    /// @return the stripped String
    ///
    public func stripEnd(stripChars: CharacterSet? = nil) -> String {
        let set = stripChars ?? CharacterSet.whitespacesAndNewlines
        var result = ""

        if let range = rangeOfCharacter(from: set.inverted, options: NSString.CompareOptions.backwards) {
            result = String(self[..<range.upperBound])
        }
        return result
    }

    /// Strips any of a set of characters from the start and end of a String.
    /// This is similar to {@link String#trim()} but allows the characters
    /// to be stripped to be controlled.
    ///
    /// If the stripChars String is {@code nil}, whitespace is stripped.
    ///
    /// @param stripChars The characters to remove, {@code nil} treated as whitespace
    /// @return the stripped String
    ///
    public func strip(stripChars set: CharacterSet? = nil) -> String {
        return stripStart(stripChars: set).stripEnd(stripChars: set)
    }
}

// ----------------------------------------------------------------------------
