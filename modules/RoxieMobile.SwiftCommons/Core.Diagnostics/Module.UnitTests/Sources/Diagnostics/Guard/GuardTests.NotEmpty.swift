// ----------------------------------------------------------------------------
//
//  GuardTests.NotEmpty.swift
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

    func testNotEmpty() {
        let method = "Guard.notEmpty"

//        let value = "value"
//        let nilValue: String? = nil
//        let emptyValue = ""
//
//
//        guardThrowsException(method) {
//            Guard.notEmpty(nilValue)
//        }
//        guardThrowsException(method) {
//            Guard.notEmpty(emptyValue)
//        }
//
//        guardNotThrowsException(method) {
//            Guard.notEmpty(value)
//        }
//
//    // --
//
//        let array = ["value", "otherValue"]
//        let nilArray: [String]? = nil
//        let emptyArray = [String]()
//
//        guardThrowsException("\(method)_Array") {
//            Guard.notEmpty(nilArray)
//        }
//        guardThrowsException("\(method)_Array") {
//            Guard.notEmpty(emptyArray)
//        }
//
//        guardNotThrowsException("\(method)_Array") {
//            Guard.notEmpty(array)
//        }
//
//    // --
//
//        let map = ["key": "value", "otherKey": "otherValue"]
//        let nilMap: [String: String]? = nil
//        let emptyMap = [String: String]()
//
//        guardThrowsException("\(method)_Map") {
//            Guard.notEmpty(nilMap)
//        }
//        guardThrowsException("\(method)_Map") {
//            Guard.notEmpty(emptyMap)
//        }
//
//        guardNotThrowsException("\(method)_Map") {
//            Guard.notEmpty(map)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
