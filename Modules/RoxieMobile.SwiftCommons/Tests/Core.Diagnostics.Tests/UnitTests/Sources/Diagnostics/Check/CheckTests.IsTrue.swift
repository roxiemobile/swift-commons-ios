// ----------------------------------------------------------------------------
//
//  CheckTests.IsTrue.swift
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

    func testIsTrue() {
        let method = "Check.isTrue"

        checkThrowsError(method) {
            try Check.isTrue(1 > 2)
        }

        checkNotThrowsError(method) {
            try Check.isTrue(2 > 1)
        }
    }
}

// ----------------------------------------------------------------------------
