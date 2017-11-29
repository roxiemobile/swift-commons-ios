// ----------------------------------------------------------------------------
//
//  GuardTests.LessThan.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testLessThan() {
        let method = "Guard.lessThan"

        guardThrowsException(method) {
            Guard.lessThan(2, 1)
        }
        guardThrowsException(method) {
            Guard.lessThan(2, 1)
        }

        guardNotThrowsException(method) {
            Guard.lessThan(1, 2)
        }
    }
}

// ----------------------------------------------------------------------------
