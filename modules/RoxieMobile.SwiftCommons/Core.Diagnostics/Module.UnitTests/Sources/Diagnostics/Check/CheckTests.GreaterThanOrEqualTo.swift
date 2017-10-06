// ----------------------------------------------------------------------------
//
//  CheckTests.GreaterThanOrEqualTo.swift
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

    func testGreaterThanOrEqualTo() {
        let method = "Check.greaterThanOrEqualTo"

//        checkThrowsError(method) {
//            Check.greaterThanOrEqualTo(1, 2)
//        }
//
//        checkNotThrowsException(method) {
//            Check.greaterThanOrEqualTo(2, 2)
//        }
//        checkNotThrowsException(method) {
//            Check.greaterThanOrEqualTo(2, 1)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
