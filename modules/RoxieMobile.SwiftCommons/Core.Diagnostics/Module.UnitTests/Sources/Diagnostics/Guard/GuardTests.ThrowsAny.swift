// ----------------------------------------------------------------------------
//
//  GuardTests.ThrowsAny.swift
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

    func testThrowsAny() {
        let method = "Guard.throwsAny"

        guardThrowsException(method) {
            Guard.throwsAny({}, BaseError.self)
        }
        guardThrowsException(method) {
            Guard.throwsAny({ throw JsonSyntaxError() }, BaseError.self)
        }

        guardNotThrowsException(method) {
            Guard.throwsAny({ throw InheritedError() }, BaseError.self)
        }
        guardNotThrowsException(method) {
            Guard.throwsAny({ throw InheritedError() }, InheritedError.self)
        }
    }

// MARK: - Inner Types

    private class BaseError: Error {}
    private class InheritedError: BaseError {}
}

// ----------------------------------------------------------------------------
