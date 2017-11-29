// ----------------------------------------------------------------------------
//
//  CheckTests.AllEmpty.swift
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

    func testAllEmpty_Array() {
        let method = "Check.allEmpty"

        let value = "value"
        let emptyValue = ""

        let array: Array<String>? = [emptyValue]
        let nilArray: Array<String>? = nil
        let emptyArray = Array<String>()


        checkThrowsError("\(method)_Array") {
            try Check.allEmpty([value])
        }
        checkThrowsError("\(method)_Array") {
            try Check.allEmpty([emptyValue, value])
        }

        checkNotThrowsError("\(method)_Array") {
            try Check.allEmpty(array)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allEmpty(nilArray)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.allEmpty(emptyArray)
        }
    }

    func testAllEmpty_ArrayOfOptionals() {
        let method = "Check.allEmpty"

        let value: String? = "value"
        let nilValue: String? = nil
        let emptyValue: String? = ""

        let array: Array<String?>? = [nilValue, emptyValue]
        let nilArray: Array<String?>? = nil
        let emptyArray = Array<String?>()


        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allEmpty([value])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allEmpty([nilValue, value])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allEmpty([emptyValue, value])
        }

        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allEmpty(array)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allEmpty(nilArray)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allEmpty(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------
