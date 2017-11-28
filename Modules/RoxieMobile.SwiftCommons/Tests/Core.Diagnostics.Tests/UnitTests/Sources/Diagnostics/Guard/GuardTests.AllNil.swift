// ----------------------------------------------------------------------------
//
//  GuardTests.AllNil.swift
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

    func testAllNil() {
        let method = "Guard.allNil"

        let value = "value"
        let nilValue: String? = nil
        let emptyValue = ""

        let array: Array<String?> = [nilValue, nilValue]
        let nilArray: Array<String?>? = nil
        let emptyArray = Array<String?>()


        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNil([nilValue, value])
        }
        guardThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNil([nilValue, emptyValue])
        }

        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNil(array)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNil(nilArray)
        }
        guardNotThrowsException("\(method)_ArrayOfOptionals") {
            Guard.allNil(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------
