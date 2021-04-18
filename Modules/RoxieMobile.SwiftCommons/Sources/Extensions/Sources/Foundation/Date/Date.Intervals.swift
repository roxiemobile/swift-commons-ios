// ----------------------------------------------------------------------------
//
//  Date.Intervals.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension Date {

// MARK: - Methods

    /// Returns the time interval between the receiver and another given date in seconds.
    func secondsAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date))
    }

    /// Returns the time interval between the receiver and another given date in seconds.
    func secondsBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self))
    }

    /// Returns the time interval between the receiver and another given date in minutes.
    func minutesAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / 1.minutes.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in minutes.
    func minutesBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / 1.minutes.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in hours.
    func hoursAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / 1.hours.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in hours.
    func hoursBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / 1.hours.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in days.
    func daysAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / 1.days.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in days.
    func daysBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / 1.days.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in weeks.
    func weeksAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / 1.weeks.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in weeks.
    func weeksBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / 1.weeks.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in years.
    func yearsAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / 1.years.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in years.
    func yearsBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / 1.years.timeInterval)
    }

// MARK: - Methods

    /// Returns the difference between the receiver and another given date in days.
    func distanceInDays(to date: Date) -> Int {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        return calendar.dateComponents(Set([.day]), from: self, to: date).day!
    }
}
