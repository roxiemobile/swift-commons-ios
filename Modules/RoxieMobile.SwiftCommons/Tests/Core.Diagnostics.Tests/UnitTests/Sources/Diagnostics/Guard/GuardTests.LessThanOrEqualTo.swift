// ----------------------------------------------------------------------------
//
//  GuardTests.LessThanOrEqualTo.swift
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

    func testLessThanOrEqualTo() {
        let method = "Guard.lessThanOrEqualTo"

        guardThrowsException(method) {
            Guard.lessThanOrEqualTo(2, 1)
        }

        guardNotThrowsException(method) {
            Guard.lessThanOrEqualTo(2, 2)
        }

        guardNotThrowsException(method) {
            Guard.lessThanOrEqualTo(1, 2)
        }
    }
}

// ----------------------------------------------------------------------------
