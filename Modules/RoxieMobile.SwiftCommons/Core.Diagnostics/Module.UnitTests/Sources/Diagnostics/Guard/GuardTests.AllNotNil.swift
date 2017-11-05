// ----------------------------------------------------------------------------
//
//  GuardTests.AllNotNil.swift
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

    func testAllNotNil() {
        let method = "Guard.allNotNil"

        let value = "value"
        let nilValue: String? = nil
        let emptyValue = ""

        let array: Array<String?> = [value, emptyValue]
        let nilArray: Array<String?>? = nil
        let emptyArray = Array<String?>()


        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotNil([value, nilValue])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotNil([emptyValue, nilValue])
        }

        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotNil(array)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotNil(nilArray)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNotNil(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------
