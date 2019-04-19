// ----------------------------------------------------------------------------
//
//  Date.Add.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension Date
{
// MARK: - Methods

    /// Returns a new `Date` object representing the date calculated by adding the amount specified to self date.
    ///
    /// - Parameters:
    ///   - seconds: Number of seconds to add.
    ///   - minutes: Number of minutes to add.
    ///   - hours: Number of hours to add.
    ///   - days: Number of days to add.
    ///   - weeks: Number of weeks to add.
    ///   - months: Number of months to add.
    ///   - years: Number of years to add.
    ///
    public func add(
            seconds: Int = 0,
            minutes: Int = 0,
            hours: Int = 0,
            days: Int = 0,
            weeks: Int = 0,
            months: Int = 0,
            years: Int = 0
    ) -> Date {

        let calendar = Calendar.current
        var result = self

        result = calendar.date(byAdding: .second, value: seconds, to: result)!
        result = calendar.date(byAdding: .minute, value: minutes, to: result)!
        result = calendar.date(byAdding: .hour, value: hours, to: result)!
        result = calendar.date(byAdding: .day, value: days, to: result)!
        result = calendar.date(byAdding: .weekOfMonth, value: weeks, to: result)!
        result = calendar.date(byAdding: .month, value: months, to: result)!
        result = calendar.date(byAdding: .year, value: years, to: result)!

        return result
    }
}

// ----------------------------------------------------------------------------
