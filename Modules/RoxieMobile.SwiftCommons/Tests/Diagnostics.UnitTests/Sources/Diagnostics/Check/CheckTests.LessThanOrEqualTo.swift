// ----------------------------------------------------------------------------
//
//  CheckTests.LessThanOrEqualTo.swift
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

    func testLessThanOrEqualTo() {
        let method = "Check.lessThanOrEqualTo"

        checkThrowsError(method) {
            try Check.lessThanOrEqualTo(2, 1)
        }

        checkNotThrowsError(method) {
            try Check.lessThanOrEqualTo(2, 2)
        }
        checkNotThrowsError(method) {
            try Check.lessThanOrEqualTo(1, 2)
        }
    }
}

// ----------------------------------------------------------------------------
