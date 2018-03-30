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
}

// ----------------------------------------------------------------------------
