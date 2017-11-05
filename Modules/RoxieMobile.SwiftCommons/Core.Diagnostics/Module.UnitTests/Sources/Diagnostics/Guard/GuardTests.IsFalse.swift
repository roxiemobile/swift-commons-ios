// ----------------------------------------------------------------------------
//
//  GuardTests.IsFalse.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommons
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testIsFalse() {
        let method = "Guard.isFalse"

        guardThrowsException(method) {
            Guard.isFalse(2 > 1)
        }

        guardNotThrowsException(method) {
            Guard.isFalse(1 > 2)
        }
    }
}

// ----------------------------------------------------------------------------
