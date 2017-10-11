// ----------------------------------------------------------------------------
//
//  CheckTests.AllNotBlank.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommons
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testAllNotBlank_Array() {
        let method = "Check.allNotBlank"

        let value = "value"
        let emptyValue = ""
        let whitespaceValue = " \t\r\n"

        let otherValue = "otherValue"
        let array: [String]? = [value, otherValue]
        let nilArray: [String]? = nil
        let emptyArray = [String]()


        checkThrowsError("\(method)_Array") {
            try Check.allNotBlank([emptyValue])
        }
        checkThrowsError("\(method)_Array") {
            try Check.allNotBlank([whitespaceValue])
        }
        checkThrowsError("\(method)_Array") {
            try Check.allNotBlank([value, whitespaceValue])
        }

        checkNotThrowsError("\(method)_Array") {
            try Check.allNotBlank(array)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allNotBlank(nilArray)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allNotBlank(emptyArray)
        }
    }

    func testAllNotBlank_ArrayOfOptionals() {
        let method = "Check.allNotBlank"

        let value: String? = "value"
        let nilValue: String? = nil
        let emptyValue: String? = ""
        let whitespaceValue: String? = " \t\r\n"

        let otherValue: String? = "otherValue"
        let array: [String?]? = [value, otherValue]
        let nilArray: [String?]? = nil
        let emptyArray = [String?]()


        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotBlank([nilValue])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotBlank([emptyValue])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotBlank([whitespaceValue])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotBlank([value, whitespaceValue])
        }

        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotBlank(array)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotBlank(nilArray)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotBlank(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------
