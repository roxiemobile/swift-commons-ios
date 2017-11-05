// ----------------------------------------------------------------------------
//
//  GuardTests.IsTrue.swift
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

    func testIsTrue() {
        let method = "Guard.isTrue"

        guardThrowsException(method) {
            Guard.isTrue(1 > 2)
        }

        guardNotThrowsException(method) {
            Guard.isTrue(2 > 1)
        }
    }
}

// ----------------------------------------------------------------------------
