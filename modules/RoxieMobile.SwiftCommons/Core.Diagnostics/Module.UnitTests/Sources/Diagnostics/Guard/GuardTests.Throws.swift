// ----------------------------------------------------------------------------
//
//  GuardTests.Throws.swift
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

    func testThrows() {
        let method = "Guard.throws"

// FIXME: C#
//        GuardThrowsException(method) {
//            Guard.throws<Exception>(() => {})
//        }
//        GuardThrowsException(method) {
//            Guard.throws<IOException>(() => throw new OperationCanceledException())
//        }
//        GuardThrowsException(method) {
//            Guard.throws<Exception>(() => throw new IOException())
//        }
//
//        GuardNotThrowsException(method) {
//            Guard.throws<IOException>(() => throw new IOException())
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
