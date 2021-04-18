// ----------------------------------------------------------------------------
//
//  GuardTests.Throws.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests {

// MARK: - Tests

    func testThrows() {
        let method = "Guard.isThrows"

        guardThrowsException(method) {
            Guard.isThrows({}, BaseError.self)
        }
        guardThrowsException(method) {
            Guard.isThrows({ throw JsonSyntaxError() }, BaseError.self)
        }
        guardThrowsException(method) {
            Guard.isThrows({ throw InheritedError() }, BaseError.self)
        }

        guardNotThrowsException(method) {
            Guard.isThrows({ throw InheritedError() }, InheritedError.self)
        }
    }

// MARK: - Inner Types

    private class BaseError: Error {
        // Do nothing
    }

    private class InheritedError: BaseError {
        // Do nothing
    }
}
