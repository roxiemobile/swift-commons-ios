// ----------------------------------------------------------------------------
//
//  CheckTests.IsNil.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testIsNil() {
        let method = "Check.isNil"

        checkThrowsError(method) {
            try Check.isNil(2)
        }

        checkNotThrowsError(method) {
            try Check.isNil(nil)
        }
    }
}

// ----------------------------------------------------------------------------
