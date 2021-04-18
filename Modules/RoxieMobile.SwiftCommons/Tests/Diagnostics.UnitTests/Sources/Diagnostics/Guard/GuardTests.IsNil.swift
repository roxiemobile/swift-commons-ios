// ----------------------------------------------------------------------------
//
//  GuardTests.IsNil.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests {

// MARK: - Tests

    func testIsNil() {
        let method = "Guard.isNil"

        guardThrowsException(method) {
            Guard.isNil(2)
        }

        guardNotThrowsException(method) {
            Guard.isNil(nil)
        }
    }
}
