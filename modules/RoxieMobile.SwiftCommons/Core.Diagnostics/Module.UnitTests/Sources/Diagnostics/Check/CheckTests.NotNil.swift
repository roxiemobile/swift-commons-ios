// ----------------------------------------------------------------------------
//
//  CheckTests.NotNil.swift
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

    func testNotNil() {
        let method = "Check.notNil"

        checkThrowsError(method) {
            try Check.notNil(nil)
        }

        checkNotThrowsError(method) {
            try Check.notNil(2)
        }
    }
}

// ----------------------------------------------------------------------------
