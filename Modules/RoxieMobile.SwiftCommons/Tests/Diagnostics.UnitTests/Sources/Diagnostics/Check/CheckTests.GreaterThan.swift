// ----------------------------------------------------------------------------
//
//  CheckTests.GreaterThan.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests {

// MARK: - Tests

    func testGreaterThan() {
        let method = "Check.greaterThan"

        checkThrowsError(method) {
            try Check.greaterThan(1, 2)
        }
        checkThrowsError(method) {
            try Check.greaterThan(2, 2)
        }

        checkNotThrowsError(method) {
            try Check.greaterThan(2, 1)
        }
    }
}
