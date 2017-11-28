// ----------------------------------------------------------------------------
//
//  Date.Operators.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

/// Returns a `Date` with a specified amount of time added to it.
public func +(date: Date, timeInterval: Int) -> Date {
    return date + TimeInterval(timeInterval)
}

/// Returns a `Date` with a specified amount of time subtracted from it.
public func -(date: Date, timeInterval: Int) -> Date {
    return date - TimeInterval(timeInterval)
}

/// Add a specified amount of time to a `Date`.
///
/// - Warning:
///   This only adjusts an absolute value. If you wish to add calendrical concepts like hours,
///   days, months then you must use a `Calendar`. That will take into account complexities like
///   daylight saving time, months with different numbers of days, and more.
///
public func +=(date: inout Date, timeInterval: Int) {
    date = date + TimeInterval(timeInterval)
}

/// Subtract a specified amount of time from a `Date`.
///
/// - Warning:
///   This only adjusts an absolute value. If you wish to add calendrical concepts like hours,
///   days, months then you must use a `Calendar`. That will take into account complexities like
///   daylight saving time, months with different numbers of days, and more.
///
public func -=(date: inout Date, timeInterval: Int) {
    date = date - TimeInterval(timeInterval)
}

/// Add a specified amount of time to a `Date`.
///
/// - Warning:
///   This only adjusts an absolute value. If you wish to add calendrical concepts like hours,
///   days, months then you must use a `Calendar`. That will take into account complexities like
///   daylight saving time, months with different numbers of days, and more.
///
public func +=(date: inout Date, timeInterval: Double) {
    date = date + TimeInterval(timeInterval)
}

/// Subtract a specified amount of time from a `Date`.
///
/// - Warning:
///   This only adjusts an absolute value. If you wish to add calendrical concepts like hours,
///   days, months then you must use a `Calendar`. That will take into account complexities like
///   daylight saving time, months with different numbers of days, and more.
///
public func -=(date: inout Date, timeInterval: Double) {
    date = date - TimeInterval(timeInterval)
}

/// Returns the interval between the given dates.
///
/// - Parameters:
///   - date: The date to compare.
///   - anotherDate: The date with which to compare the `date`.
///
/// - Returns:
///   The interval between the `date` and the `anotherDate` parameter. If the `date` is
///   earlier than `anotherDate`, the return value is negative. If `anotherDate` is `nil`,
///   the results are undefined.
///
public func -(date: Date, otherDate: Date) -> TimeInterval {
    return date.timeIntervalSince(otherDate)
}

// ----------------------------------------------------------------------------
