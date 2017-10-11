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

// FIXME: C#
//        guardThrowsException(method) {
//            Guard.throwsAny<Exception>(() => {})
//        }
//        guardThrowsException(method) {
//            Guard.throwsAny<IOException>(() => throw new OperationCanceledException())
//        }
//
//        guardNotThrowsException(method) {
//            Guard.throwsAny<Exception>(() => throw new IOException())
//        }
//        guardNotThrowsException(method) {
//            Guard.throwsAny<IOException>(() => throw new IOException())
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
