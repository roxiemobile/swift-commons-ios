// ----------------------------------------------------------------------------
//
//  CheckTests.AllNotNil.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommons
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testAllNotNil() {
        let method = "Check.allNotNil"

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
//        CheckThrowsError("\(method)_Array") {
//            Check.allNotNil(ToArray(value, nilValue))
//        }
//        CheckThrowsError("\(method)_Array") {
//            Check.allNotNil(ToArray(emptyValue, nilValue))
//        }
//
//        CheckNotThrowsError("\(method)_Array") {
//            Check.allNotNil(array)
//        }
//        CheckNotThrowsError("\(method)_Array") {
//            Check.allNotNil(nilArray)
//        }
//        CheckNotThrowsError("\(method)_Array") {
//            Check.allNotNil(emptyArray)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
