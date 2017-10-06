// ----------------------------------------------------------------------------
//
//  CheckTests.AllNotEmpty.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testAllNotEmpty_Array() {
        let method = "Check.allNotEmpty"

//        let value = "value"
//        let emptyValue = ""
//
//        let otherValue = "otherValue"
//        let array: [String]? = [value, otherValue]
//        let nilArray: [String]? = nil
//        let emptyArray = [String]()
//
//
//        checkThrowsError("\(method)_Array") {
//            try Check.allNotEmpty([value, emptyValue])
//        }
//
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allNotEmpty(array)
//        }
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allNotEmpty(nilArray)
//        }
//        checkNotThrowsError("\(method)_Array") {
//            try Check.allNotEmpty(emptyArray)
//        }

        XCTFail(method)
    }

    func testAllNotEmpty_ArrayOfOptionals() {
        let method = "Check.allNotEmpty"

//        let value: String? = "value"
//        let nilValue: String? = nil
//        let emptyValue: String? = ""
//
//        let otherValue: String? = "otherValue"
//        let array: [String?]? = [value, otherValue]
//        let nilArray: [String?]? = nil
//        let emptyArray = [String?]()
//
//
//        checkThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNotEmpty([value, nilValue])
//        }
//        checkThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNotEmpty([value, emptyValue])
//        }
//
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNotEmpty(array)
//        }
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNotEmpty(nilArray)
//        }
//        checkNotThrowsError("\(method)_ArrayOfOptionals") {
//            try Check.allNotEmpty(emptyArray)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
