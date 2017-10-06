// ----------------------------------------------------------------------------
//
//  GuardTests.Empty.swift
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

    func testEmpty() {
        let method = "Guard.empty"

//        let value = "value"
//        let nilValue: String? = nil
//        let emptyValue = ""
//
//
//        guardThrowsException(method) {
//            Guard.empty(value)
//        }
//
//        guardNotThrowsException(method) {
//            Guard.empty(nilValue)
//        }
//        guardNotThrowsException(method) {
//            Guard.empty(emptyValue)
//        }
//
//    // --
//
//        let array = ["value", "otherValue"]
//        let nilArray: [String]? = nil
//        let emptyArray = [String]()
//
//        guardThrowsException("\(method)_Array") {
//            Guard.empty(array)
//        }
//
//        guardNotThrowsException("\(method)_Array") {
//            Guard.empty(nilArray)
//        }
//        guardNotThrowsException("\(method)_Array") {
//            Guard.empty(emptyArray)
//        }
//
//    // --
//
//        let map = ["key": "value", "otherKey": "otherValue"]
//        let nilMap: [String: String]? = nil
//        let emptyMap = [String: String]()
//
//        guardThrowsException("\(method)_Map") {
//            Guard.empty(map)
//        }
//
//        guardNotThrowsException("\(method)_Map") {
//            Guard.empty(nilMap)
//        }
//        guardNotThrowsException("\(method)_Map") {
//            Guard.empty(emptyMap)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
