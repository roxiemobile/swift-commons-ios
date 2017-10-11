// ----------------------------------------------------------------------------
//
//  GuardTests.GreaterThanOrEqualTo.swift
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

    func testGreaterThanOrEqualTo() {
        let method = "Guard.greaterThanOrEqualTo"

//        guardThrowsException(method) {
//            Guard.greaterThanOrEqualTo(1, 2)
//        }
//
//        guardNotThrowsException(method) {
//            Guard.greaterThanOrEqualTo(2, 2)
//        }
//        guardNotThrowsException(method) {
//            Guard.greaterThanOrEqualTo(2, 1)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
