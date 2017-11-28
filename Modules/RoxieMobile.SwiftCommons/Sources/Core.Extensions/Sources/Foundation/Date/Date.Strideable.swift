// ----------------------------------------------------------------------------
//
//  Date.Strideable.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

extension Date: Strideable
{
// MARK: - Methods

    public typealias Stride = TimeInterval

    /// Returns a stride `x` such that `self.advanced(by: x)` approximates `otherDate`.
    public func distance(to otherDate: Date) -> Date.Stride {
        return (otherDate - self)
    }

    /// Returns a `Date` `x` such that `self.distance(to: x)` approximates `seconds`.
    public func advanced(by seconds: Stride) -> Date {
        return type(of: self).init(timeIntervalSinceReferenceDate: self.timeIntervalSinceReferenceDate + seconds)
    }
}

// ----------------------------------------------------------------------------
