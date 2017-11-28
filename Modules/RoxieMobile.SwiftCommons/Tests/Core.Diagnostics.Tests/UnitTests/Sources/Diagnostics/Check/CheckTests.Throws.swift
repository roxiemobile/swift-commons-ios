// ----------------------------------------------------------------------------
//
//  CheckTests.Throws.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreDiagnostics
import SwiftCommonsCoreData
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
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

    private class BaseError: Error {}
    private class InheritedError: BaseError {}
}

// ----------------------------------------------------------------------------
