// ----------------------------------------------------------------------------
//
//  CheckTests.Empty.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testEmpty() {
        let method = "Check.empty"

        let value = "value"
        let otherValue = "otherValue"
        let nilValue: String? = nil
        let emptyValue = ""


        checkThrowsError(method) {
            try Check.empty(value)
        }

        checkNotThrowsError(method) {
            try Check.empty(nilValue)
        }
        checkNotThrowsError(method) {
            try Check.empty(emptyValue)
        }

        // --

        let array = [value, otherValue]
        let nilArray: Array<String>? = nil
        let emptyArray = Array<String>()

        checkThrowsError("\(method)_Array") {
            try Check.empty(array)
        }

        checkNotThrowsError("\(method)_Array") {
            try Check.empty(nilArray)
        }
        checkNotThrowsError("\(method)_Array") {
            try Check.empty(emptyArray)
        }

        // --

        let set: Set = [value, otherValue]
        let nilSet: Set<String>? = nil
        let emptySet = Set<String>()

        checkThrowsError("\(method)_Set") {
            try Check.empty(set)
        }

        checkNotThrowsError("\(method)_Set") {
            try Check.empty(nilSet)
        }
        checkNotThrowsError("\(method)_Set") {
            try Check.empty(emptySet)
        }

        // --

        let map = ["key": value, "otherKey": otherValue]
        let nilMap: Dictionary<String, String>? = nil
        let emptyMap = Dictionary<String, String>()

        checkThrowsError("\(method)_Map") {
            try Check.empty(map)
        }

        checkNotThrowsError("\(method)_Map") {
            try Check.empty(nilMap)
        }
        checkNotThrowsError("\(method)_Map") {
            try Check.empty(emptyMap)
        }
    }
}

// ----------------------------------------------------------------------------
