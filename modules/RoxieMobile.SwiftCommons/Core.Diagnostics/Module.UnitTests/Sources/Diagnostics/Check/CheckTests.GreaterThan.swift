﻿// ----------------------------------------------------------------------------
//
//  CheckTests.GreaterThan.swift
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

    func testGreaterThan() {
        let method = "Check.greaterThan"

//        checkThrowsError(method) {
//            Check.greaterThan(1, 2)
//        }
//        checkThrowsError(method) {
//            Check.greaterThan(2, 2)
//        }
//
//        checkNotThrowsError(method) {
//            Check.greaterThan(2, 1)
//        }

        XCTFail(method)
    }
}

// ----------------------------------------------------------------------------