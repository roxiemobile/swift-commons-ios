// ----------------------------------------------------------------------------
//
//  CheckTests.ThrowsAny.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testThrowsAny() {
        let method = "Check.throwsAny"

// FIXME: C#
//        CheckThrowsError(method) {
//            Check.throwsAny<Exception>(() => {})
//        }
//        CheckThrowsError(method) {
//            Check.throwsAny<IOException>(() => throw new OperationCanceledException())
//        }
//
//        CheckNotThrowsError(method) {
//            Check.throwsAny<Exception>(() => throw new IOException())
//        }
//        CheckNotThrowsError(method) {
//            Check.throwsAny<IOException>(() => throw new IOException())
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
