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

    @available(*, deprecated)
    public func minutesAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / Intervals.InSeconds.Minute)
    }

    @available(*, deprecated)
    public func minutesBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / Intervals.InSeconds.Minute)
    }

    @available(*, deprecated)
    public func hoursAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / Intervals.InSeconds.Hour)
    }

    @available(*, deprecated)
    public func hoursBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / Intervals.InSeconds.Hour)
    }

    @available(*, deprecated)
    public func daysAfter(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / Intervals.InSeconds.Day)
    }

    @available(*, deprecated)
    public func daysBefore(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / Intervals.InSeconds.Day)
    }

    @available(*, deprecated)
    public func distanceInDays(to date: Date) -> Int {
        let calendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
        return calendar.dateComponents(Set([.day]), from: self, to: date).day!
    }

// MARK: - Constants

    public struct Intervals
    {
        public struct InSeconds {
            public static let Second = 1.0
            public static let Minute = 60.0
            public static let Hour   = 3600.0
            public static let Day    = 86400.0
            public static let Week   = 604800.0
            public static let Year   = 31556926.0
        }

        public struct InMillis {
            public static let Second = InSeconds.Second * 1000
            public static let Minute = InSeconds.Minute * 1000
            public static let Hour   = InSeconds.Hour * 1000
            public static let Day    = InSeconds.Day * 1000
            public static let Week   = InSeconds.Week * 1000
            public static let Year   = InSeconds.Year * 1000
        }
    }
}

// ----------------------------------------------------------------------------
