// ----------------------------------------------------------------------------
//
//  CheckTests.Throws.swift
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

extension CheckTests {

// MARK: - Tests

    func testThrows() {
        let method = "Check.isThrows"

        checkThrowsError(method) {
            try Check.isThrows({}, BaseError.self)
        }
        checkThrowsError(method) {
            try Check.isThrows({ throw JsonSyntaxError() }, BaseError.self)
        }
        checkThrowsError(method) {
            try Check.isThrows({ throw InheritedError() }, BaseError.self)
        }

        checkNotThrowsError(method) {
            try Check.isThrows({ throw InheritedError() }, InheritedError.self)
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
