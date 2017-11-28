// ----------------------------------------------------------------------------
//
//  CheckTests.NotEqual.swift
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

    func testNotEqual() {
        let method = "Check.notEqual"

        let value = "value"
        let nilValue: String? = nil


        checkThrowsError(method) {
            try Check.notEqual(2, 2)
        }
        checkThrowsError(method) {
            try Check.notEqual(value, value)
        }

        checkNotThrowsError(method) {
            try Check.notEqual(1, 2)
        }
        checkNotThrowsError(method) {
            try Check.notEqual(value, nilValue)
        }
    }
}

// ----------------------------------------------------------------------------
