// ----------------------------------------------------------------------------
//
//  CheckTests.NotSame.swift
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

    func testNotSame() {
        let method = "Check.notSame"

        let view = UIView()
        let otherView = UIView()


        checkThrowsError(method) {
            try Check.notSame(view, view)
        }

        checkNotThrowsError(method) {
            try Check.notSame(view, otherView)
        }
    }
}

// ----------------------------------------------------------------------------
