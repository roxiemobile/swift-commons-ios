// ----------------------------------------------------------------------------
//
//  NSDate.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public extension NSDate
{
// MARK: - Properties

    /**
     * Date year
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var year: Int {
        return getComponent(.Year)
    }

    /**
     * Date month
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var month: Int {
        return getComponent(.Month)
    }

    /**
     * Date weekday
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var weekday: Int {
        return getComponent(.Weekday)
    }

    /**
     * Date weekMonth
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var weekMonth: Int {
        return getComponent(.WeekOfMonth)
    }

    /**
     * Date days
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var days: Int {
        return getComponent(.Day)
    }

    /**
     * Date hours
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var hours: Int {
        return getComponent(.Hour)
    }

    /**
     * Date minuts
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var minutes: Int {
        return getComponent(.Minute)
    }

    /**
     * Date seconds
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public var seconds: Int {
        return getComponent(.Second)
    }

// MARK: - Methods

    public func stringValue(format: String) -> String
    {
        struct Singleton {
            static let dateFormatter: NSDateFormatter = {
                let formatter = NSDateFormatter()

                // Init instance
                formatter.formatterBehavior = .Behavior10_4
                formatter.locale = NSLocale(localeIdentifier: "ru")
                //formatter.locale = NSLocale.autoupdatingCurrentLocale()
                formatter.timeZone = NSTimeZone.systemTimeZone()

                // Done
                return formatter
            }()
        }

        // Init date formatter
        let formatter = Singleton.dateFormatter
        formatter.dateFormat = format

        // Done
        return formatter.stringFromDate(self)
    }

    /**
     * Returns a new NSDate object representing the date calculated by adding the amount specified to self date
     *
     * - parameter seconds: number of seconds to add
     * - parameter minutes: number of minutes to add
     * - parameter hours: number of hours to add
     * - parameter days: number of days to add
     * - parameter weeks: number of weeks to add
     * - parameter months: number of months to add
     * - parameter years: number of years to add
     * - returns: the NSDate computed
     *
     */
    public func add(seconds: Int = 0, minutes: Int = 0, hours: Int = 0, days: Int = 0, weeks: Int = 0, months: Int = 0, years: Int = 0) -> NSDate
    {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Second, .Minute, .Hour, .Day, .WeekOfMonth, .Month, .Year], fromDate: self)
        components.second      += seconds
        components.minute      += minutes
        components.hour        += hours
        components.day         += days
        components.weekOfMonth += weeks
        components.month       += months
        components.year        += years

        return calendar.dateFromComponents(components)!
    }

    /**
     * Returns a new NSDate object representing the date calculated by adding an amount of seconds to self date
     *
     * - parameter seconds: number of seconds to add
     * - returns: the NSDate computed
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func addSeconds(seconds: Int) -> NSDate {
        return add(seconds)
    }

    /**
     * Returns a new NSDate object representing the date calculated by adding an amount of minutes to self date
     *
     * - parameter minutes: number of minutes to add
     * - returns: the NSDate computed
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func addMinutes(minute: Int) -> NSDate {
        return add(minutes: minute)
    }

    /**
     * Returns a new NSDate object representing the date calculated by adding an amount of hours to self date
     *
     * - parameter hours: number of hours to add
     * - returns: the NSDate computed
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func addHours(hours: Int) -> NSDate {
        return add(hours: hours)
    }

    /**
     * Returns a new NSDate object representing the date calculated by adding an amount of days to self date
     *
     * - parameter days: number of days to add
     * - returns: the NSDate computed
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func addDays(days: Int) -> NSDate {
        return add(days: days)
    }

    /**
     * Returns a new NSDate object representing the date calculated by adding an amount of weeks to self date
     *
     * - parameter weeks: number of weeks to add
     * - returns: the NSDate computed
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func addWeeks(weeks: Int) -> NSDate {
        return add(weeks: weeks)
    }

    /**
     * Returns a new NSDate object representing the date calculated by adding an amount of months to self date
     *
     * - parameter months: number of months to add
     * - returns: the NSDate computed
     */
    public func addMonths(months: Int) -> NSDate {
        return add(months: months)
    }

    /**
     * Returns a new NSDate object representing the date calculated by adding an amount of years to self date
     *
     * - parameter years: number of year to add
     * - returns: the NSDate computed
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func addYears(years: Int) -> NSDate {
        return add(years: years)
    }

    /**
     * Returns the value of the NSDate component
     *
     * - parameter component: NSCalendarUnit
     * - returns: the value of the component
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func getComponent(component: NSCalendarUnit) -> Int
    {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(component, fromDate: self)

        return components.valueForComponent(component)
    }

// MARK: - Methods: Comparison

    /**
     * Checks if self is after input NSDate
     *
     * - parameter date: NSDate to compare
     * - returns: True if self is after the input NSDate, false otherwise
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func isAfter(date: NSDate) -> Bool {
        return (self.compare(date) == NSComparisonResult.OrderedDescending)
    }

    /**
     * Checks if self is before input NSDate
     *
     * - parameter date: NSDate to compare
     * - returns: True if self is before the input NSDate, false otherwise
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    public func isBefore(date: NSDate) -> Bool {
        return (self.compare(date) == NSComparisonResult.OrderedAscending)
    }

// MARK: - Methods: Intervals

    public func minutesAfterDate(date: NSDate) -> Int {
        return Int(self.timeIntervalSinceDate(date) / Intervals.InSeconds.Minute)
    }

    public func minutesBeforeDate(date: NSDate) -> Int {
        return Int(date.timeIntervalSinceDate(self) / Intervals.InSeconds.Minute)
    }

    public func hoursAfterDate(date: NSDate) -> Int {
        return Int(self.timeIntervalSinceDate(date) / Intervals.InSeconds.Hour)
    }

    public func hoursBeforeDate(date: NSDate) -> Int {
        return Int(date.timeIntervalSinceDate(self) / Intervals.InSeconds.Hour)
    }

    public func daysAfterDate(date: NSDate) -> Int {
        return Int(self.timeIntervalSinceDate(date) / Intervals.InSeconds.Day)
    }

    public func daysBeforeDate(date: NSDate) -> Int {
        return Int(date.timeIntervalSinceDate(self) / Intervals.InSeconds.Day)
    }

    public func distanceInDaysToDate(date: NSDate) -> Int
    {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let components = calendar!.components(.Day, fromDate: self, toDate: date, options: [])

        // Done
        return components.day;
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

extension NSDate: Strideable
{
// MARK: - Methods

    public func distanceTo(other: NSDate) -> NSTimeInterval {
        return (other - self)
    }

    public func advancedBy(n: NSTimeInterval) -> Self {
        return self.dynamicType.init(timeIntervalSinceReferenceDate: self.timeIntervalSinceReferenceDate + n)
    }
}

// ----------------------------------------------------------------------------
// MARK: - @protocol Equatable
// ----------------------------------------------------------------------------

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == NSComparisonResult.OrderedSame
}

// ----------------------------------------------------------------------------
// MARK: - @protocol Comparable
// ----------------------------------------------------------------------------

extension NSDate: Comparable {
    // Do nothing
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == NSComparisonResult.OrderedAscending
}

// ----------------------------------------------------------------------------
// MARK: - Operators
// ----------------------------------------------------------------------------

public func +(date: NSDate, timeInterval: Int) -> NSDate {
    return date + NSTimeInterval(timeInterval)
}

public func -(date: NSDate, timeInterval: Int) -> NSDate {
    return date - NSTimeInterval(timeInterval)
}

public func +=(inout date: NSDate, timeInterval: Int) {
    date = date + timeInterval
}

public func -=(inout date: NSDate, timeInterval: Int) {
    date = date - timeInterval
}

public func +(date: NSDate, timeInterval: Double) -> NSDate {
    return date.dateByAddingTimeInterval(NSTimeInterval(timeInterval))
}

public func -(date: NSDate, timeInterval: Double) -> NSDate {
    return date.dateByAddingTimeInterval(NSTimeInterval(-timeInterval))
}

public func +=(inout date: NSDate, timeInterval: Double) {
    date = date + timeInterval
}

public func -=(inout date: NSDate, timeInterval: Double) {
    date = date - timeInterval
}

public func -(date: NSDate, otherDate: NSDate) -> NSTimeInterval {
    return date.timeIntervalSinceDate(otherDate)
}

// ----------------------------------------------------------------------------
