// ----------------------------------------------------------------------------
//
//  GuardTests.Empty.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests {

// MARK: - Tests

    func testEmpty() {
        let method = "Guard.empty"

        let value = "value"
        let otherValue = "otherValue"
        let nilValue: String? = nil
        let emptyValue = ""


        guardThrowsException(method) {
            Guard.empty(value)
        }

        guardNotThrowsException(method) {
            Guard.empty(nilValue)
        }
        guardNotThrowsException(method) {
            Guard.empty(emptyValue)
        }

        // --

        let array = [value, otherValue]
        let nilArray: Array<String>? = nil
        let emptyArray = Array<String>()

        guardThrowsException("\(method)_Array") {
            Guard.empty(array)
        }

        guardNotThrowsException("\(method)_Array") {
            Guard.empty(nilArray)
        }
        guardNotThrowsException("\(method)_Array") {
            Guard.empty(emptyArray)
        }

        // --

        let set = [value, otherValue]
        let nilSet: Set<String>? = nil
        let emptySet = Set<String>()

        guardThrowsException("\(method)_Set") {
            Guard.empty(set)
        }

        guardNotThrowsException("\(method)_Set") {
            Guard.empty(nilSet)
        }
        guardNotThrowsException("\(method)_Set") {
            Guard.empty(emptySet)
        }

        // --

        let map = ["key": value, "otherKey": otherValue]
        let nilMap: Dictionary<String, String>? = nil
        let emptyMap = Dictionary<String, String>()

        guardThrowsException("\(method)_Map") {
            Guard.empty(map)
        }

        guardNotThrowsException("\(method)_Map") {
            Guard.empty(nilMap)
        }
        guardNotThrowsException("\(method)_Map") {
            Guard.empty(emptyMap)
        }
    }
}
