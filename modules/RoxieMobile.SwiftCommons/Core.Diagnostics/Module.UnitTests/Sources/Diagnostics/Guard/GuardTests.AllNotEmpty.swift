// ----------------------------------------------------------------------------
//
//  GuardTests.AllNotEmpty.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommons
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testAllNotEmpty_Array() {
        let method = "Guard.allNotEmpty"

//        let value = "value"
//        let emptyValue = ""
//
//        let otherValue = "otherValue"
//        let array: [String]? = [value, otherValue]
//        let nilArray: [String]? = nil
//        let emptyArray = [String]()
//
//
//        guardThrowsException("\(method)_Array") {
//            Guard.allNotEmpty([value, emptyValue])
//        }
//
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNotEmpty(array)
//        }
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNotEmpty(nilArray)
//        }
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNotEmpty(emptyArray)
//        }

        XCTFail(method)
    }

    func testAllNotEmpty_ArrayOfOptionals() {
        let method = "Guard.allNotEmpty"

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
//        guardThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNotEmpty([value, nilValue])
//        }
//        guardThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNotEmpty([value, emptyValue])
//        }
//
//        guardNotThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNotEmpty(array)
//        }
//        guardNotThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNotEmpty(nilArray)
//        }
//        guardNotThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNotEmpty(emptyArray)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
