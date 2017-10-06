// ----------------------------------------------------------------------------
//
//  GuardTests.AllNotBlank.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testAllNotBlank_Array() {
        let method = "Guard.allNotBlank"

//        let value = "value"
//        let emptyValue = ""
//        let whitespaceValue = " \t\r\n"
//
//        let otherValue = "otherValue"
//        let array: [String]? = [value, otherValue]
//        let nilArray: [String]? = nil
//        let emptyArray = [String]()
//
//
//        guardThrowsException("\(method)_Array") {
//            Guard.allNotBlank([emptyValue])
//        }
//        guardThrowsException("\(method)_Array") {
//            Guard.allNotBlank([whitespaceValue])
//        }
//        guardThrowsException("\(method)_Array") {
//            Guard.allNotBlank([value, whitespaceValue])
//        }
//
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNotBlank(array)
//        }
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNotBlank(nilArray)
//        }
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNotBlank(emptyArray)
//        }

        XCTFail(method)
    }

    func testAllNotBlank_ArrayOfOptionals() {
        let method = "Guard.allNotBlank"

//        let value: String? = "value"
//        let nilValue: String? = nil
//        let emptyValue: String? = ""
//        let whitespaceValue: String? = " \t\r\n"
//
//        let otherValue: String? = "otherValue"
//        let array: [String?]? = [value, otherValue]
//        let nilArray: [String?]? = nil
//        let emptyArray = [String?]()
//
//
//        guardThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNotBlank([nilValue])
//        }
//        guardThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNotBlank([emptyValue])
//        }
//        guardThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNotBlank([whitespaceValue])
//        }
//        guardThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNotBlank([value, whitespaceValue])
//        }
//
//        guardNotThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNotBlank(array)
//        }
//        guardNotThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNotBlank(nilArray)
//        }
//        guardNotThrowsException("\(method)_ArrayOfOptionals") {
//            Guard.allNotBlank(emptyArray)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
