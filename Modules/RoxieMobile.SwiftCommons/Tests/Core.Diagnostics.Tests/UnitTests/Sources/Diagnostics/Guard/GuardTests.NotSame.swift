// ----------------------------------------------------------------------------
//
//  GuardTests.NotSame.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension GuardTests
{
// MARK: - Tests

    func testNotSame() {
        let method = "Guard.notSame"

        let view = UIView()
        let otherView = UIView()


        guardThrowsException(method) {
            Guard.notSame(view, view)
        }

        guardNotThrowsException(method) {
            Guard.notSame(view, otherView)
        }
    }
}

// ----------------------------------------------------------------------------
