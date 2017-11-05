// ----------------------------------------------------------------------------
//
//  CheckTests.ThrowsAny.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommons
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testThrowsAny() {
        let method = "Check.throwsAny"

        checkThrowsError(method) {
            try Check.throwsAny({}, BaseError.self)
        }
        checkThrowsError(method) {
            try Check.throwsAny({ throw JsonSyntaxError() }, BaseError.self)
        }

        checkNotThrowsError(method) {
            try Check.throwsAny({ throw InheritedError() }, BaseError.self)
        }
        checkNotThrowsError(method) {
            try Check.throwsAny({ throw InheritedError() }, InheritedError.self)
        }
    }

// MARK: - Inner Types

    private class BaseError: Error {}
    private class InheritedError: BaseError {}
}

// ----------------------------------------------------------------------------
