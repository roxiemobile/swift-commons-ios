// ----------------------------------------------------------------------------
//
//  GuardTests.Same.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testSame() {
        let method = "Guard.same"

        let view = UIView()
        let otherView = UIView()


        guardThrowsException(method) {
            Guard.same(view, otherView)
        }

        guardNotThrowsException(method) {
            Guard.same(view, view)
        }
    }
}

// ----------------------------------------------------------------------------
