// ----------------------------------------------------------------------------
//
//  Date.Add.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
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
    ///   - years: Number of years to add.
    ///   - months: Number of months to add.
    ///   - days: Number of days to add.
    ///   - hours: Number of hours to add.
    ///   - minutes: Number of minutes to add.
    ///   - seconds: Number of seconds to add.
    ///
    public func add(
            years: Int = 0,
            months: Int = 0,
            days: Int = 0,
            hours: Int = 0,
            minutes: Int = 0,
            seconds: Int = 0
    ) -> Date? {

        let calendar = Calendar.current
        var newDate: Date? = Date(timeIntervalSinceReferenceDate: self.timeIntervalSinceReferenceDate)

        if years != 0, let date = newDate {
            newDate = calendar.date(byAdding: .year, value: years, to: date)
        }

        if months != 0, let date = newDate {
            newDate = calendar.date(byAdding: .month, value: months, to: date)
        }

        if days != 0, let date = newDate {
            newDate = calendar.date(byAdding: .day, value: days, to: date)
        }

        if hours != 0, let date = newDate {
            newDate = calendar.date(byAdding: .hour, value: hours, to: date)
        }

        if minutes != 0, let date = newDate {
            newDate = calendar.date(byAdding: .minute, value: minutes, to: date)
        }

        if seconds != 0, let date = newDate {
            newDate = calendar.date(byAdding: .second, value: seconds, to: date)
        }

        // Date
        return newDate
    }
}

// ----------------------------------------------------------------------------
