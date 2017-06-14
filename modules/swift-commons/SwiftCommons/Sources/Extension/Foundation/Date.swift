// ----------------------------------------------------------------------------
//
//  Date.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension Date
{
// MARK: - Properties

    /**
     * Date year
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var year: Int {
        return getComponent(.year)
    }

    /**
     * Date month
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var month: Int {
        return getComponent(.month)
    }

    /**
     * Date weekday
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var weekday: Int {
        return getComponent(.weekday)
    }

    /**
     * Date weekMonth
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var weekMonth: Int {
        return getComponent(.weekOfMonth)
    }

    /**
     * Date days
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var days: Int {
        return getComponent(.day)
    }

    /**
     * Date hours
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var hours: Int {
        return getComponent(.hour)
    }

    /**
     * Date minuts
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var minutes: Int {
        return getComponent(.minute)
    }

    /**
     * Date seconds
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var seconds: Int {
        return getComponent(.second)
    }

// MARK: - Methods

    public func stringValue(format: String) -> String
    {
        struct Singleton {
            static let dateFormatter: DateFormatter = {
                let formatter = DateFormatter()

                // Init instance
                formatter.formatterBehavior = .behavior10_4
                formatter.locale = Locale(identifier: "ru")
                //formatter.locale = NSLocale.autoupdatingCurrentLocale()
                formatter.timeZone = NSTimeZone.system

                // Done
                return formatter
            }()
        }

        // Init date formatter
        let formatter = Singleton.dateFormatter
        formatter.dateFormat = format

        // Done
        return formatter.string(from: self)
    }

    /**
     * Returns a new Date object representing the date calculated by adding the amount specified to self date
     *
     * - parameter seconds: number of seconds to add
     * - parameter minutes: number of minutes to add
     * - parameter hours: number of hours to add
     * - parameter days: number of days to add
     * - parameter weeks: number of weeks to add
     * - parameter months: number of months to add
     * - parameter years: number of years to add
     * - returns: the Date computed
     *
     */
    public func add(seconds: Int = 0, minutes: Int = 0, hours: Int = 0, days: Int = 0, weeks: Int = 0, months: Int = 0, years: Int = 0) -> Date
    {
        let calendar = Calendar.current
        var components = calendar.dateComponents(Set([.second, .minute, .hour, .day, .weekOfMonth, .month, .year]), from: self)

        components.second!      += seconds
        components.minute!      += minutes
        components.hour!        += hours
        components.day!         += days
        components.weekOfMonth! += weeks
        components.month!       += months
        components.year!        += years

        return calendar.date(from: components)!
    }

    /**
     * Returns a new Date object representing the date calculated by adding an amount of seconds to self date
     *
     * - parameter seconds: number of seconds to add
     * - returns: the Date computed
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func addSeconds(seconds: Int) -> Date {
        return add(seconds: seconds)
    }

    /**
     * Returns a new Date object representing the date calculated by adding an amount of minutes to self date
     *
     * - parameter minutes: number of minutes to add
     * - returns: the Date computed
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func addMinutes(minute: Int) -> Date {
        return add(minutes: minute)
    }

    /**
     * Returns a new Date object representing the date calculated by adding an amount of hours to self date
     *
     * - parameter hours: number of hours to add
     * - returns: the Date computed
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func addHours(hours: Int) -> Date {
        return add(hours: hours)
    }

    /**
     * Returns a new Date object representing the date calculated by adding an amount of days to self date
     *
     * - parameter days: number of days to add
     * - returns: the Date computed
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func addDays(days: Int) -> Date {
        return add(days: days)
    }

    /**
     * Returns a new Date object representing the date calculated by adding an amount of weeks to self date
     *
     * - parameter weeks: number of weeks to add
     * - returns: the Date computed
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func addWeeks(weeks: Int) -> Date {
        return add(weeks: weeks)
    }

    /**
     * Returns a new Date object representing the date calculated by adding an amount of months to self date
     *
     * - parameter months: number of months to add
     * - returns: the Date computed
     */
    public func addMonths(months: Int) -> Date {
        return add(months: months)
    }

    /**
     * Returns a new Date object representing the date calculated by adding an amount of years to self date
     *
     * - parameter years: number of year to add
     * - returns: the Date computed
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func addYears(years: Int) -> Date {
        return add(years: years)
    }

    /**
     * Returns the value of the Date component
     *
     * - parameter component: NSCalendarUnit
     * - returns: the value of the component
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func getComponent(_ component: Calendar.Component) -> Int
    {
        let calendar = Calendar.current
        let components = calendar.dateComponents(Set([component]), from: self)

        return components.value(for: component)!
    }

// MARK: - Methods: Comparison

    /**
     * Checks if self is after input Date
     *
     * - parameter date: Date to compare
     * - returns: True if self is after the input Date, false otherwise
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func isAfter(date: Date) -> Bool {
        return (self.compare(date) == ComparisonResult.orderedDescending)
    }

    /**
     * Checks if self is before input Date
     *
     * - parameter date: Date to compare
     * - returns: True if self is before the input Date, false otherwise
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func isBefore(date: Date) -> Bool {
        return (self.compare(date) == ComparisonResult.orderedAscending)
    }

// MARK: - Methods: Intervals

    public func minutesAfterDate(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / Intervals.InSeconds.Minute)
    }

    public func minutesBeforeDate(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / Intervals.InSeconds.Minute)
    }

    public func hoursAfterDate(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / Intervals.InSeconds.Hour)
    }

    public func hoursBeforeDate(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / Intervals.InSeconds.Hour)
    }

    public func daysAfterDate(date: Date) -> Int {
        return Int(self.timeIntervalSince(date) / Intervals.InSeconds.Day)
    }

    public func daysBeforeDate(date: Date) -> Int {
        return Int(date.timeIntervalSince(self) / Intervals.InSeconds.Day)
    }

    public func distanceInDaysToDate(date: Date) -> Int
    {
        let calendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
        let components = calendar.dateComponents(Set([.day]), from: self, to: date)

        // Done
        return components.day!
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
            public static let Hour   = InSeconds.Hour   * 1000
            public static let Day    = InSeconds.Day    * 1000
            public static let Week   = InSeconds.Week   * 1000
            public static let Year   = InSeconds.Year   * 1000
        }
    }

}

// ----------------------------------------------------------------------------
// MARK: - @protocol Strideable
// ----------------------------------------------------------------------------

extension Date: Strideable
{
// MARK: - Methods

    public typealias Stride = TimeInterval

    public func distance(to other: Date) -> Date.Stride {
        return (other - self)
    }

    public func advanced(by n: Stride) -> Date {
        return type(of: self).init(timeIntervalSinceReferenceDate: self.timeIntervalSinceReferenceDate + n)
    }
}

// ----------------------------------------------------------------------------
// MARK: - Operators
// ----------------------------------------------------------------------------

public func +(date: Date, timeInterval: Int) -> Date {
    return date + TimeInterval(timeInterval)
}

public func -(date: Date, timeInterval: Int) -> Date {
    return date - TimeInterval(timeInterval)
}

public func +=(date: inout Date, timeInterval: Int) {
    date = date + timeInterval
}

public func -=(date: inout Date, timeInterval: Int) {
    date = date - timeInterval
}

public func +=(date: inout Date, timeInterval: Double) {
    date = date + timeInterval
}

public func -=(date: inout Date, timeInterval: Double) {
    date = date - timeInterval
}

public func -(date: Date, otherDate: Date) -> TimeInterval {
    return date.timeIntervalSince(otherDate)
}

// ----------------------------------------------------------------------------
