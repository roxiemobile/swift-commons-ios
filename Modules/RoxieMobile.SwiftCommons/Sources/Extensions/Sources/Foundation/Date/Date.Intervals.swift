// ----------------------------------------------------------------------------
//
//  Date.Intervals.swift
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

    /// Returns the time interval between the receiver and another given date in seconds.
    public func secondsAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date))
    }

    /// Returns the time interval between the receiver and another given date in seconds.
    public func secondsBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self))
    }

    /// Returns the time interval between the receiver and another given date in minutes.
    public func minutesAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / 1.minutes.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in minutes.
    public func minutesBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / 1.minutes.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in hours.
    public func hoursAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / 1.hours.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in hours.
    public func hoursBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / 1.hours.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in days.
    public func daysAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / 1.days.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in days.
    public func daysBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / 1.days.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in weeks.
    public func weeksAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / 1.weeks.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in weeks.
    public func weeksBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / 1.weeks.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in years.
    public func yearsAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / 1.years.timeInterval)
    }

    /// Returns the time interval between the receiver and another given date in years.
    public func yearsBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / 1.years.timeInterval)
    }

// MARK: - Methods

    /// Returns the difference between the receiver and another given date in days.
    public func distanceInDays(to date: Date) -> Int {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        return calendar.dateComponents(Set([.day]), from: self, to: date).day!
    }
}

// ----------------------------------------------------------------------------
