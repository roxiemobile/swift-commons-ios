// ----------------------------------------------------------------------------
//
//  GuardTests.AllNotBlank.swift
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

    func testAllNotBlank_Array() {
        let method = "Guard.allNotBlank"

        let value = "value"
        let emptyValue = ""
        let whitespaceValue = " \t\r\n"

        let otherValue = "otherValue"
        let array: Array<String>? = [value, otherValue]
        let nilArray: Array<String>? = nil
        let emptyArray = Array<String>()


        guardThrowsException("\(method)_Array") {
            Guard.allNotBlank([emptyValue])
        }
        guardThrowsException("\(method)_Array") {
            Guard.allNotBlank([whitespaceValue])
        }
        guardThrowsException("\(method)_Array") {
            Guard.allNotBlank([value, whitespaceValue])
        }

        guardNotThrowsException("\(method)_Array") {
            Guard.allNotBlank(array)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allNotBlank(nilArray)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.allNotBlank(emptyArray)
        }

        // --

        let set: Set<String>? = [value, otherValue]
        let nilSet: Set<String>? = nil
        let emptySet = Set<String>()


        guardThrowsException("\(method)_Set") {
            Guard.allNotBlank(Set([emptyValue]))
        }
        guardThrowsException("\(method)_Set") {
            Guard.allNotBlank(Set([whitespaceValue]))
        }
        guardThrowsException("\(method)_Set") {
            Guard.allNotBlank(Set([value, whitespaceValue]))
        }

        guardNotThrowsException("\(method)_Set") {
            Guard.allNotBlank(set)
        }
        guardNotThrowsException("\(method)_Set") {
            Guard.allNotBlank(nilSet)
        }
        guardNotThrowsException("\(method)_Set") {
            Guard.allNotBlank(emptySet)
        }
    }

    func testAllNotBlank_ArrayOfOptionals() {
        let method = "Guard.allNotBlank"

        let value: String? = "value"
        let nilValue: String? = nil
        let emptyValue: String? = ""
        let whitespaceValue: String? = " \t\r\n"

        let otherValue: String? = "otherValue"
        let array: Array<String?>? = [value, otherValue]
        let nilArray: Array<String?>? = nil
        let emptyArray = Array<String?>()


        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotBlank([nilValue])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotBlank([emptyValue])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotBlank([whitespaceValue])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotBlank([value, whitespaceValue])
        }

        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotBlank(array)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotBlank(nilArray)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotBlank(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------
