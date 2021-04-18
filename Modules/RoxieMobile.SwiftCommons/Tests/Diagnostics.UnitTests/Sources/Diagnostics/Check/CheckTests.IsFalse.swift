// ----------------------------------------------------------------------------
//
//  CheckTests.IsFalse.swift
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

    func testIsFalse() {
        let method = "Check.isFalse"

        checkThrowsError(method) {
            try Check.isFalse(2 > 1)
        }

        checkNotThrowsError(method) {
            try Check.isFalse(1 > 2)
        }
    }
}
