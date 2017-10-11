// ----------------------------------------------------------------------------
//
//  CheckTests.Throws.swift
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

    func testThrows() {
        let method = "Check.throws"

// FIXME: C#
//        CheckThrowsError(method) {
//            Check.throws<Exception>(() => {})
//        }
//        CheckThrowsError(method) {
//            Check.throws<IOException>(() => throw new OperationCanceledException())
//        }
//        CheckThrowsError(method) {
//            Check.throws<Exception>(() => throw new IOException())
//        }
//
//        CheckNotThrowsError(method) {
//            Check.throws<IOException>(() => throw new IOException())
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
