// ----------------------------------------------------------------------------
//
//  CheckTests.LessThan.swift
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

    func testLessThan() {
        let method = "Check.lessThan"

//        checkThrowsError(method) {
//            Check.lessThan(2, 1)
//        }
//        checkThrowsError(method) {
//            Check.lessThan(2, 2)
//        }
//
//        checkNotThrowsError(method) {
//            Check.lessThan(1, 2)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------
