// ----------------------------------------------------------------------------
//
//  CheckTests.AllNil.swift
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

    func testAllNil() {
        let method = "Check.allNil"

        let value = "value"
        let nilValue: String? = nil
        let emptyValue = ""

        let array: Array<String?> = [nilValue, nilValue]
        let nilArray: Array<String?>? = nil
        let emptyArray = Array<String?>()


        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNil([nilValue, value])
        }
        checkThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNil([nilValue, emptyValue])
        }

        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNil(array)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNil(nilArray)
        }
        checkNotThrowsError("\(method)_ArrayOfOptionals") {
            try Check.allNil(emptyArray)
        }
    }
}

// ----------------------------------------------------------------------------
