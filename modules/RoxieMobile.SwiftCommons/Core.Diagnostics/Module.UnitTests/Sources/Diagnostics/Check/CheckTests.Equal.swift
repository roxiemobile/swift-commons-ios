// ----------------------------------------------------------------------------
//
//  CheckTests.Equal.swift
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

    func testEqual() {
        let method = "Check.equal"

        let value = "value"
        let nilValue: String? = nil


        checkThrowsError(method) {
            try Check.equal(1, 2)
        }
        checkThrowsError(method) {
            try Check.equal(value, nilValue)
        }

        checkNotThrowsError(method) {
            try Check.equal(2, 2)
        }
        checkNotThrowsError(method) {
            try Check.equal(value, value)
        }
    }
}

// ----------------------------------------------------------------------------
