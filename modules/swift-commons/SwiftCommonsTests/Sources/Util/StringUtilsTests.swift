// ----------------------------------------------------------------------------
//
//  StringUtilsTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons
import UIKit
import XCTest

// ----------------------------------------------------------------------------

final class StringUtilsTests: XCTestCase {
    // Do nothing
}

// ----------------------------------------------------------------------------

extension StringUtilsTests
{
// MARK: - Tests

    func testStrip() {
        XCTAssertTrue(StringUtils.strip(nil) == nil)
        XCTAssertTrue(StringUtils.strip("") == "")
        XCTAssertTrue(StringUtils.strip("   ") == "")
        XCTAssertTrue(StringUtils.strip("abc") == "abc")
        XCTAssertTrue(StringUtils.strip("  abc") == "abc")
        XCTAssertTrue(StringUtils.strip("abc  ") == "abc")
        XCTAssertTrue(StringUtils.strip(" abc ") == "abc")
        XCTAssertTrue(StringUtils.strip(" ab c ") == "ab c")
        XCTAssertTrue(StringUtils.strip("  abcyx", stripChars: CharacterSet(charactersIn: "xyz")) == "  abc")
    }

    func testStripStart() {
        XCTAssertTrue(StringUtils.stripStart(nil, stripChars: CharacterSet()) == nil)
        XCTAssertTrue(StringUtils.stripStart("", stripChars: CharacterSet()) == "")
        XCTAssertTrue(StringUtils.stripStart("   ") == "")
        XCTAssertTrue(StringUtils.stripStart("abc", stripChars: CharacterSet(charactersIn: "")) == "abc")
        XCTAssertTrue(StringUtils.stripStart("abc") == "abc")
        XCTAssertTrue(StringUtils.stripStart("  abc") == "abc")
        XCTAssertTrue(StringUtils.stripStart("abc  ") == "abc  ")
        XCTAssertTrue(StringUtils.stripStart(" abc ") == "abc ")
        XCTAssertTrue(StringUtils.stripStart("yxabc  ", stripChars: CharacterSet(charactersIn: "xyz")) == "abc  ")
        XCTAssertTrue(StringUtils.stripStart("120.00", stripChars: CharacterSet(charactersIn: "12")) == "0.00")
    }

    func testStripEnd() {
        XCTAssertTrue(StringUtils.stripEnd(nil, stripChars: CharacterSet()) == nil)
        XCTAssertTrue(StringUtils.stripEnd("", stripChars: CharacterSet()) == "")
        XCTAssertTrue(StringUtils.stripEnd("   ") == "")
        XCTAssertTrue(StringUtils.stripEnd("abc", stripChars: CharacterSet(charactersIn: "")) == "abc")
        XCTAssertTrue(StringUtils.stripEnd("abc") == "abc")
        XCTAssertTrue(StringUtils.stripEnd("  abc") == "  abc")
        XCTAssertTrue(StringUtils.stripEnd("abc  ") == "abc")
        XCTAssertTrue(StringUtils.stripEnd(" abc ") == " abc")
        XCTAssertTrue(StringUtils.stripEnd("  abcyx", stripChars: CharacterSet(charactersIn: "xyz")) == "  abc")
        XCTAssertTrue(StringUtils.stripEnd("120.00", stripChars: CharacterSet(charactersIn: ".0")) == "12")
    }
}

// ----------------------------------------------------------------------------
