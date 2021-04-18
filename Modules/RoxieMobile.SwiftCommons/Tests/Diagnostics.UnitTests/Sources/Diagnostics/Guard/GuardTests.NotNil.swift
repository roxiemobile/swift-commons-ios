// ----------------------------------------------------------------------------
//
//  GuardTests.NotNil.swift
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

    func testNotNil() {
        let method = "Guard.notNil"

        guardThrowsException(method) {
            Guard.notNil(nil)
        }

        guardNotThrowsException(method) {
            Guard.notNil(2)
        }
    }
}
