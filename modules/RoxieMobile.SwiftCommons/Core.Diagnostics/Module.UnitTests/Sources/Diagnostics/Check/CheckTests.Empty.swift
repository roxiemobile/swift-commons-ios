// ----------------------------------------------------------------------------
//
//  CheckTests.Empty.swift
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

    func testEmpty() {
        let method = "Check.empty"

//        let value = "value"
//        let nilValue: String? = nil
//        let emptyValue = ""
//
//
//        checkThrowsError(method) {
//            try Check.empty(value)
//        }
//
//        checkNotThrowsError(method) {
//            try Check.empty(nilValue)
//        }
//        checkNotThrowsError(method) {
//            try Check.empty(emptyValue)
//        }
//
//    // --
//
//        let array = ["value", "otherValue"]
//        let nilArray: [String]? = nil
//        let emptyArray = [String]()
//
//        checkThrowsError("\(method)_Array") {
//            try Check.empty(array)
//        }
//
//        checkNotThrowsError("\(method)_Array") {
//            try Check.empty(nilArray)
//        }
//        checkNotThrowsError("\(method)_Array") {
//            try Check.empty(emptyArray)
//        }
//
//    // --
//
//        let map = ["key": "value", "otherKey": "otherValue"]
//        let nilMap: [String: String]? = nil
//        let emptyMap = [String: String]()
//
//        checkThrowsError("\(method)_Map") {
//            try Check.empty(map)
//        }
//
//        checkNotThrowsError("\(method)_Map") {
//            try Check.empty(nilMap)
//        }
//        checkNotThrowsError("\(method)_Map") {
//            try Check.empty(emptyMap)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
