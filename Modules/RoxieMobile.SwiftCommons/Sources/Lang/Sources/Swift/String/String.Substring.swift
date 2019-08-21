// ----------------------------------------------------------------------------
//
//  String.Substring.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public extension String
{
// MARK: - Methods

    /// Returns an index that is the specified distance from the start
    /// index of the `String`.
    public func index(offsetBy n: Int) -> Index {
        return self.index(self.startIndex, offsetBy: n)
    }

    /// Returns a slice of a string containing the characters of the `String`
    /// from the one at a given index to the end.
    public func substring(from: Int) -> String {
        return String(self[index(offsetBy: from)...])
    }

    /// Returns a slice of a string containing the characters of the `String`
    /// up to, but not including, the one at a given index.
    public func substring(upto: Int) -> String {
        return String(self[..<index(offsetBy: upto)])
    }

    /// Returns a slice of a string containing the characters of the `String`
    /// that lie within a given range.
    public func substring(with range: Range<Int>) -> String {
        return String(self[index(offsetBy: range.lowerBound)..<index(offsetBy: range.upperBound)])
    }
}

// ----------------------------------------------------------------------------
