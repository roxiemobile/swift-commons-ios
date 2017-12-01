// ----------------------------------------------------------------------------
//
//  CheckTests.Same.swift
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

    func testSame() {
        let method = "Check.same"

        let view = UIView()
        let otherView = UIView()


        checkThrowsError(method) {
            try Check.same(view, otherView)
        }

        checkNotThrowsError(method) {
            try Check.same(view, view)
        }
    }
}

// ----------------------------------------------------------------------------
