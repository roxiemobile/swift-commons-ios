// ----------------------------------------------------------------------------
//
//  String.Substring.swift
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

    @available(*, deprecated, message: "Write a description.")
    func substringFrom(index: Int) -> String
    {
        let from = self.index(self.startIndex, offsetBy: index)
        return String(self[from...])
    }

    @available(*, deprecated, message: "Write a description.")
    func substringUpto(index: Int) -> String
    {
        let upto = self.index(self.startIndex, offsetBy: index)
        return String(self[self.startIndex..<upto])
    }

    @available(*, deprecated, message: "Write a description.")
    func substring(range: Range<Int>) -> String
    {
        let from = self.index(self.startIndex, offsetBy: range.lowerBound)
        let upto = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[from..<upto])
    }
}

// ----------------------------------------------------------------------------
