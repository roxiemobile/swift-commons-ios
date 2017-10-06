// ----------------------------------------------------------------------------
//
//  CheckTests.LessThanOrEqualTo.swift
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

    func testLessThanOrEqualTo() {
        let method = "Check.lessThanOrEqualTo"

//        checkThrowsError(method) {
//            Check.lessThanOrEqualTo(2, 1)
//        }
//
//        checkNotThrowsError(method) {
//            Check.lessThanOrEqualTo(2, 2)
//        }
//        checkNotThrowsError(method) {
//            Check.lessThanOrEqualTo(1, 2)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
