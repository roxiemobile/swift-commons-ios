// ----------------------------------------------------------------------------
//
//  DateTests.Add.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsExtensions
import XCTest

// ----------------------------------------------------------------------------

extension DateTests
{
// MARK: - Tests

    func testChangingYears() {
        let date: Date? = Date(timeIntervalSinceReferenceDate: 0)

        XCTAssertEqual(format(date?.add(years:  1)), "2002-01-01T00:00:00")
        XCTAssertEqual(format(date?.add(years: -1)), "2000-01-01T00:00:00")
    }

    func testChangingMonths() {
        let date: Date? = Date(timeIntervalSinceReferenceDate: 0)

        XCTAssertEqual(format(date?.add(months:  1)), "2001-02-01T00:00:00")
        XCTAssertEqual(format(date?.add(months: -1)), "2000-12-01T00:00:00")
    }

    func testChangingDays() {
        let date: Date? = Date(timeIntervalSinceReferenceDate: 0)

        XCTAssertEqual(format(date?.add(days:  1)), "2001-01-02T00:00:00")
        XCTAssertEqual(format(date?.add(days: -1)), "2000-12-31T00:00:00")
    }

    func testChangingHours() {
        let date: Date? = Date(timeIntervalSinceReferenceDate: 0)

        XCTAssertEqual(format(date?.add(hours:  1)), "2001-01-01T01:00:00")
        XCTAssertEqual(format(date?.add(hours: -1)), "2000-12-31T23:00:00")
    }

    func testChangingMinutes() {
        let date: Date? = Date(timeIntervalSinceReferenceDate: 0)

        XCTAssertEqual(format(date?.add(minutes:  1)), "2001-01-01T00:01:00")
        XCTAssertEqual(format(date?.add(minutes: -1)), "2000-12-31T23:59:00")
    }

    func testChangingSeconds() {
        let date: Date? = Date(timeIntervalSinceReferenceDate: 0)

        XCTAssertEqual(format(date?.add(seconds:  1)), "2001-01-01T00:00:01")
        XCTAssertEqual(format(date?.add(seconds: -1)), "2000-12-31T23:59:59")
    }

    func testChangingAllComponentsAtOnce() {
        let date: Date? = Date(timeIntervalSinceReferenceDate: 0)

        XCTAssertEqual(format(date?.add(years:  1)), "2002-01-01T00:00:00")
        XCTAssertEqual(format(date?.add(years:  1, months:  1)), "2002-02-01T00:00:00")
        XCTAssertEqual(format(date?.add(years:  1, months:  1, days:  1)), "2002-02-02T00:00:00")
        XCTAssertEqual(format(date?.add(years:  1, months:  1, days:  1, hours:  1)), "2002-02-02T01:00:00")
        XCTAssertEqual(format(date?.add(years:  1, months:  1, days:  1, hours:  1, minutes:  1)), "2002-02-02T01:01:00")
        XCTAssertEqual(format(date?.add(years:  1, months:  1, days:  1, hours:  1, minutes:  1, seconds:  1)), "2002-02-02T01:01:01")

        XCTAssertEqual(format(date?.add(years: -1)), "2000-01-01T00:00:00")
        XCTAssertEqual(format(date?.add(years: -1, months: -1)), "1999-12-01T00:00:00")
        XCTAssertEqual(format(date?.add(years: -1, months: -1, days: -1)), "1999-11-30T00:00:00")
        XCTAssertEqual(format(date?.add(years: -1, months: -1, days: -1, hours: -1)), "1999-11-29T23:00:00")
        XCTAssertEqual(format(date?.add(years: -1, months: -1, days: -1, hours: -1, minutes: -1)), "1999-11-29T22:59:00")
        XCTAssertEqual(format(date?.add(years: -1, months: -1, days: -1, hours: -1, minutes: -1, seconds: -1)), "1999-11-29T22:58:59")
    }

    func testSyntheticDate() {
        let tzUTC = TimeZone(abbreviation: "UTC")!

        var cal = Calendar.current
        cal.timeZone = tzUTC

        var dtc = DateComponents()
        dtc.year     = 2019
        dtc.month    = 4
        dtc.day      = 2
        dtc.timeZone = TimeZone(abbreviation: "UTC")
        dtc.hour     = 4
        dtc.minute   = 33
        dtc.second   = 28

        var date: Date? = cal.date(from: dtc)
        XCTAssertEqual(format(date), "2019-04-02T04:33:28")

        date = cal.startOfDay(for: date!)
        XCTAssertEqual(format(date), "2019-04-02T00:00:00")

        date = date?.add(days: -2)
        XCTAssertEqual(format(date), "2019-03-31T00:00:00")

        XCTAssertEqual(format(date?.add(months:  1)), "2019-04-30T00:00:00")
        XCTAssertEqual(format(date?.add(months: -1)), "2019-02-28T00:00:00")

        XCTAssertEqual(format(date?.add(months:  1, days:  1)), "2019-05-01T00:00:00")
        XCTAssertEqual(format(date?.add(months: -1, days:  1)), "2019-03-01T00:00:00")

        XCTAssertEqual(format(date?.add(months:  1, days: -1)), "2019-04-29T00:00:00")
        XCTAssertEqual(format(date?.add(months: -1, days: -1)), "2019-02-27T00:00:00")
    }

// MARK: - Private Methods

    private func format(_ date: Date?) -> String? {
        return date?.format(with: "yyyy-MM-dd'T'HH:mm:ss", timeZone: TimeZone(abbreviation: "UTC"))
    }
}

// ----------------------------------------------------------------------------
