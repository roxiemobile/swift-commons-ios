// ----------------------------------------------------------------------------
//
//  GuardTests.AllBlank.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests {

// MARK: - Tests

    func testAllBlank_Array() {
        let method = "Guard.allBlank"

        let value = "value"
        let emptyValue = ""
        let whitespaceValue = " \t\r\n"

        let array: Array<String> = [emptyValue, whitespaceValue]
        let nilArray: Array<String>? = nil
        let emptyArray = Array<String>()


        guardThrowsException("\(method)_Array") {
            Guard.allBlank([value])
        }
        guardThrowsException("\(method)_Array") {
            Guard.allBlank([emptyValue, value])
        }
        guardThrowsException("\(method)_Array") {
            Guard.allBlank([whitespaceValue, value])
        }

        guardNotThrowsException("\(method)_Array") {
            Guard.allBlank(array)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allBlank(nilArray)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allBlank(emptyArray)
        }
    }

    func testAllBlank_ArrayOfOptionals() {
        let method = "Guard.allBlank"

        let value: String? = "value"
        let nilValue: String? = nil
        let emptyValue: String? = ""
        let whitespaceValue: String? = " \t\r\n"

        let array: Array<String?>? = [nilValue, emptyValue, whitespaceValue]
        let nilArray: Array<String?>? = nil
        let emptyArray = Array<String?>()


        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allBlank([value])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allBlank([nilValue, value])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allBlank([emptyValue, value])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allBlank([whitespaceValue, value])
        }

        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allBlank(array)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allBlank(nilArray)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allBlank(emptyArray)
        }
    }
}
