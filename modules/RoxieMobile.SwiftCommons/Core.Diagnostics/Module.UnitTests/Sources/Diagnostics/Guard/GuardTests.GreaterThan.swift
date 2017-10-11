// ----------------------------------------------------------------------------
//
//  GuardTests.GreaterThan.swift
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

    func testGreaterThan() {
        let method = "Guard.greaterThan"

//        guardThrowsException(method) {
//            Guard.greaterThan(1, 2)
//        }
//        guardThrowsException(method) {
//            Guard.greaterThan(2, 2)
//        }
//
//        guardNotThrowsException(method) {
//            Guard.greaterThan(2, 1)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
