// ----------------------------------------------------------------------------
//
//  CheckTests.AllNotEmpty.swift
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

    func testAllNotEmpty_Array() {
        let method = "Check.allNotEmpty"

        let value = "value"
        let otherValue = "otherValue"
        let emptyValue = ""

        let array: Array<String>? = [value, otherValue]
        let nilArray: Array<String>? = nil
        let emptyArray = Array<String>()


        checkThrowsError("\(method)_Array") {
            try Check.allNotEmpty([value, emptyValue])
        }

        checkNotThrowsError("\(method)_Array") {
            try Check.allNotEmpty(array)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allNotEmpty(nilArray)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allNotEmpty(emptyArray)
        }

        // --

        let set: Set<String>? = [value, otherValue]
        let nilSet: Set<String>? = nil
        let emptySet = Set<String>()


        checkThrowsError("\(method)_Set") {
            try Check.allNotEmpty(Set([value, emptyValue]))
        }

        checkNotThrowsError("\(method)_Set") {
            try Check.allNotEmpty(set)
        }
        checkNotThrowsError("\(method)_Set") {
            try Check.allNotEmpty(nilSet)
        }
        checkNotThrowsError("\(method)_Set") {
            try Check.allNotEmpty(emptySet)
        }
    }

    func testAllNotEmpty_ArrayOfOptionals() {
        let method = "Check.allNotEmpty"

        let value: String? = "value"
        let otherValue: String? = "otherValue"
        let nilValue: String? = nil
        let emptyValue: String? = ""

        let array: Array<String?>? = [value, otherValue]
        let nilArray: Array<String?>? = nil
        let emptyArray = Array<String?>()


        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotEmpty([value, nilValue])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotEmpty([value, emptyValue])
        }

        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotEmpty(array)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotEmpty(nilArray)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotEmpty(emptyArray)
        }
    }
}
