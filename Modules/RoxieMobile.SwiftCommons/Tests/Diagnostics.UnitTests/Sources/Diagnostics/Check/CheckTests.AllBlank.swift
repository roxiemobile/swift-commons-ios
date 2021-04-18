// ----------------------------------------------------------------------------
//
//  CheckTests.AllBlank.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests {

// MARK: - Tests

    func testAllBlank_Array() {
        let method = "Check.allBlank"

        let value = "value"
        let emptyValue = ""
        let whitespaceValue = " \t\r\n"

        let array: Array<String> = [emptyValue, whitespaceValue]
        let nilArray: Array<String>? = nil
        let emptyArray = Array<String>()


        checkThrowsError("\(method)_Array") {
            try Check.allBlank([value])
        }
        checkThrowsError("\(method)_Array") {
            try Check.allBlank([emptyValue, value])
        }
        checkThrowsError("\(method)_Array") {
            try Check.allBlank([whitespaceValue, value])
        }

        checkNotThrowsError("\(method)_Array") {
            try Check.allBlank(array)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allBlank(nilArray)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allBlank(emptyArray)
        }
    }

    func testAllBlank_ArrayOfOptionals() {
        let method = "Check.allBlank"

        let value: String? = "value"
        let nilValue: String? = nil
        let emptyValue: String? = ""
        let whitespaceValue: String? = " \t\r\n"

        let array: Array<String?>? = [nilValue, emptyValue, whitespaceValue]
        let nilArray: Array<String?>? = nil
        let emptyArray = Array<String?>()


        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allBlank([value])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allBlank([nilValue, value])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allBlank([emptyValue, value])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allBlank([whitespaceValue, value])
        }

        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allBlank(array)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allBlank(nilArray)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allBlank(emptyArray)
        }
    }
}
