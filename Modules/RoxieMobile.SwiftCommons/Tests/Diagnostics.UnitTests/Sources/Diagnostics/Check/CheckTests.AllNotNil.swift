// ----------------------------------------------------------------------------
//
//  CheckTests.AllNotNil.swift
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

    func testAllNotNil() {
        let method = "Check.allNotNil"

        let value = "value"
        let nilValue: String? = nil
        let emptyValue = ""

        let array: Array<String?> = [value, emptyValue]
        let nilArray: Array<String?>? = nil
        let emptyArray = Array<String?>()


        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotNil([value, nilValue])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotNil([emptyValue, nilValue])
        }

        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotNil(array)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotNil(nilArray)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNotNil(emptyArray)
        }
    }
}
