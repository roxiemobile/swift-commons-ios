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
        var components = calendar.dateComponents(Set([.second, .minute, .hour, .day, .weekOfMonth, .month, .year]), from: self)

        components.second! += seconds
        components.minute! += minutes
        components.hour! += hours
        components.day! += days
        components.weekOfMonth! += weeks
        components.month! += months
        components.year! += years

        return calendar.date(from: components)!
    }
}

// ----------------------------------------------------------------------------
