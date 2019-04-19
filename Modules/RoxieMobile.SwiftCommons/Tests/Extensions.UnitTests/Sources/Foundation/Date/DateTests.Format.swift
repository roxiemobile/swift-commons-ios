// ----------------------------------------------------------------------------
//
//  DateTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsExtensions
import XCTest

// ----------------------------------------------------------------------------

class DateTests: XCTestCase
{
// MARK: - Tests

    func testFatalErrorException() {
        let date = Date(timeIntervalSince1970: (1.hours + 1.minutes + 1.seconds).timeInterval)

        // List of NSTimeZone Abbreviations and Names (iOS 9.3.1)
        // @link https://gist.github.com/mteece/80fff3329074cf90d7991e55f4fc8de4

        let tzUTC = TimeZone(abbreviation: "UTC")
        XCTAssertEqual(date.format(with: "yyyy-MM-dd'T'HH:mm:ss", timeZone: tzUTC), "1970-01-01T01:01:01")
        XCTAssertEqual(date.format(with: "yyyy-MM-dd", timeZone: tzUTC), "1970-01-01")
        XCTAssertEqual(date.format(timeZone: tzUTC), "1970-01-01T01:01:01+0000")

        // = America/Juneau
        let tzJuneau = TimeZone(abbreviation: "AKST")
        XCTAssertEqual(date.format(timeZone: tzJuneau), "1969-12-31T17:01:01-0800")

        // = Europe/Moscow
        let tzMoscow = TimeZone(abbreviation: "MSK")
        XCTAssertEqual(date.format(timeZone: tzMoscow), "1970-01-01T04:01:01+0300")
    }

    func testSecondsAddingSubtracting() {
        XCTAssertEqual(referenceDate.add(seconds: 86400), date(from: "Apr 1, 2019 12:00:00 AM"))
        XCTAssertEqual(referenceDate.add(seconds: -86400), date(from: "Mar 30, 2019 12:00:00 AM"))
    }

    func testMinutesAddingSubtracting() {
        XCTAssertEqual(referenceDate.add(minutes: 1440), date(from: "Apr 1, 2019 12:00:00 AM"))
        XCTAssertEqual(referenceDate.add(minutes: -1440), date(from: "Mar 30, 2019 12:00:00 AM"))
    }

    func testHoursAddingSubtracting() {
        XCTAssertEqual(referenceDate.add(hours: 24), date(from: "Apr 1, 2019 12:00:00 AM"))
        XCTAssertEqual(referenceDate.add(hours: -24), date(from: "Mar 30, 2019 12:00:00 AM"))
    }

    func testDaysAddingSubtracting() {
        XCTAssertEqual(referenceDate.add(days: 1), date(from: "Apr 1, 2019 12:00:00 AM"))
        XCTAssertEqual(referenceDate.add(days: -1), date(from: "Mar 30, 2019 12:00:00 AM"))
    }

    func testWeeksAddingSubtracting() {
        XCTAssertEqual(referenceDate.add(weeks: 1), date(from: "Apr 7, 2019 12:00:00 AM"))
        XCTAssertEqual(referenceDate.add(weeks: -1), date(from: "Mar 24, 2019 12:00:00 AM"))
    }

    func testMonthsAddingSubtracting() {
        XCTAssertEqual(referenceDate.add(months: 1), date(from: "Apr 30, 2019 12:00:00 AM"))
        XCTAssertEqual(referenceDate.add(months: -1), date(from: "Feb 28, 2019 12:00:00 AM"))
    }

    func testYearsAddingSubtracting() {
        XCTAssertEqual(referenceDate.add(years: 1), date(from: "Mar 31, 2020 12:00:00 AM"))
        XCTAssertEqual(referenceDate.add(years: -1), date(from: "Mar 31, 2018 12:00:00 AM"))
    }

    func testAddingSubtractingAllComponents() {
        XCTAssertEqual(referenceDate.add(seconds: 1, minutes: 1, hours: 1, days: 1, weeks: 1, months: 1, years: 1), date(from: "May 8, 2020 1:01:01 AM"))
        XCTAssertEqual(referenceDate.add(seconds: -1, minutes: -1, hours: -1, days: -1, weeks: -1, months: -1, years: -1), date(from: "Feb 22, 2018 10:58:59 PM"))
    }

    private func date(from string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy h:mm:ss a"
        return formatter.date(from: string)!
    }

    private var referenceDate: Date {
        return date(from: "Mar 31, 2019 12:00:00 AM")
    }
}

// ----------------------------------------------------------------------------
