// ----------------------------------------------------------------------------
//
//  CheckTests.NotEmpty.swift
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

    func testNotEmpty() {
        let method = "Check.notEmpty"

        let value = "value"
        let otherValue = "otherValue"
        let nilValue: String? = nil
        let emptyValue = ""


        checkThrowsError(method) {
            try Check.notEmpty(nilValue)
        }
        checkThrowsError(method) {
            try Check.notEmpty(emptyValue)
        }

        checkNotThrowsError(method) {
            try Check.notEmpty(value)
        }

        // --

        let array = [value, otherValue]
        let nilArray: Array<String>? = nil
        let emptyArray = Array<String>()

        checkThrowsError("\(method)_Array") {
            try Check.notEmpty(nilArray)
        }
        checkThrowsError("\(method)_Array") {
            try Check.notEmpty(emptyArray)
        }

        checkNotThrowsError("\(method)_Array") {
            try Check.notEmpty(array)
        }

        // --

        let set: Set = [value, otherValue]
        let nilSet: Set<String>? = nil
        let emptySet = Set<String>()

        checkThrowsError("\(method)_Set") {
            try Check.notEmpty(nilSet)
        }
        checkThrowsError("\(method)_Set") {
            try Check.notEmpty(emptySet)
        }

        checkNotThrowsError("\(method)_Set") {
            try Check.notEmpty(set)
        }

        // --

        let map = ["key": value, "otherKey": otherValue]
        let nilMap: Dictionary<String, String>? = nil
        let emptyMap = Dictionary<String, String>()

        checkThrowsError("\(method)_Map") {
            try Check.notEmpty(nilMap)
        }
        checkThrowsError("\(method)_Map") {
            try Check.notEmpty(emptyMap)
        }

        checkNotThrowsError("\(method)_Map") {
            try Check.notEmpty(map)
        }
    }
}

// ----------------------------------------------------------------------------
