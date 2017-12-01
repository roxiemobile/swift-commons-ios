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

    @available(*, deprecated, message: "\n• Write a description.")
    public func index(from: Int) -> Index {
        return self.index(self.startIndex, offsetBy: from)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func substring(from: Int) -> String {
        return substring(from: index(from: from))
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func substring(upto: Int) -> String {
        return substring(to: index(from: upto))
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func substring(with range: Range<Int>) -> String {
        return substring(with: index(from: range.lowerBound)..<index(from: range.upperBound))
    }
}

// ----------------------------------------------------------------------------
