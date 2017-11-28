// ----------------------------------------------------------------------------
//
//  GuardTests.NotEqual.swift
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

    func testNotEqual() {
        let method = "Guard.notEqual"

        let value = "value"
        let nilValue: String? = nil


        guardThrowsException(method) {
            Guard.notEqual(2, 2)
        }
        guardThrowsException(method) {
            Guard.notEqual(value, value)
        }

        guardNotThrowsException(method) {
            Guard.notEqual(1, 2)
        }
        guardNotThrowsException(method) {
            Guard.notEqual(value, nilValue)
        }
    }
}

// ----------------------------------------------------------------------------
