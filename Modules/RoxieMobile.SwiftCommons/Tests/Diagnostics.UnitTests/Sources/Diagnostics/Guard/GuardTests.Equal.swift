// ----------------------------------------------------------------------------
//
//  GuardTests.Equal.swift
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

    func testEqual() {
        let method = "Guard.equal"

        let value = "value"
        let nilValue: String? = nil


        guardThrowsException(method) {
            Guard.equal(1, 2)
        }
        guardThrowsException(method) {
            Guard.equal(value, nilValue)
        }

        guardNotThrowsException(method) {
            Guard.equal(2, 2)
        }
        guardNotThrowsException(method) {
            Guard.equal(value, value)
        }
    }
}
