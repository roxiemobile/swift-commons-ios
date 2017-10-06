// ----------------------------------------------------------------------------
//
//  GuardTests.AllNotNil.swift
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

    func testAllNotNil() {
        let method = "Guard.allNotNil"

// FIXME: C#
//        const string value = "value"
//        const string nilValue = null
//        const string emptyValue = ""
//
//        string[] array = ToArray(value, emptyValue)
//        string[] nilArray = null
//        string[] emptyArray = {}
//
//
//        guardThrowsException("\(method)_Array") {
//            Guard.allNotNil(ToArray(value, nilValue))
//        }
//        guardThrowsException("\(method)_Array") {
//            Guard.allNotNil(ToArray(emptyValue, nilValue))
//        }
//
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNotNil(array)
//        }
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNotNil(nilArray)
//        }
//        guardNotThrowsException("\(method)_Array") {
//            Guard.allNotNil(emptyArray)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
