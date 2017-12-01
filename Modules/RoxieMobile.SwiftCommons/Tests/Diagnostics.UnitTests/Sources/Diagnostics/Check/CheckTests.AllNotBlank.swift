// ----------------------------------------------------------------------------
//
//  CheckTests.AllNotBlank.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
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
        let array: Array<String>? = [value, otherValue]
        let nilArray: Array<String>? = nil
        let emptyArray = Array<String>()


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

        // --

        let set: Set<String>? = [value, otherValue]
        let nilSet: Set<String>? = nil
        let emptySet = Set<String>()


        checkThrowsError("\(method)_Set") {
            try Check.allNotBlank(Set([emptyValue]))
        }
        checkThrowsError("\(method)_Set") {
            try Check.allNotBlank(Set([whitespaceValue]))
        }
        checkThrowsError("\(method)_Set") {
            try Check.allNotBlank(Set([value, whitespaceValue]))
        }

        checkNotThrowsError("\(method)_Set") {
            try Check.allNotBlank(set)
        }
        checkNotThrowsError("\(method)_Set") {
            try Check.allNotBlank(nilSet)
        }
        checkNotThrowsError("\(method)_Set") {
            try Check.allNotBlank(emptySet)
        }
    }

    func testAllNotBlank_ArrayOfOptionals() {
        let method = "Check.allNotBlank"

        let value: String? = "value"
        let nilValue: String? = nil
        let emptyValue: String? = ""
        let whitespaceValue: String? = " \t\r\n"

        let otherValue: String? = "otherValue"
        let array: Array<String?>? = [value, otherValue]
        let nilArray: Array<String?>? = nil
        let emptyArray = Array<String?>()


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
