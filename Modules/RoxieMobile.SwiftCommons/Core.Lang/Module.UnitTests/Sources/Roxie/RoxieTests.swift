// ----------------------------------------------------------------------------
//
//  RoxieTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreLang
import XCTest

// ----------------------------------------------------------------------------

class RoxieTests: XCTestCase
{
// MARK: - Tests

    func testFatalErrorException() {
        let name = Roxie.typeName(of: FatalErrorException.self)

        XCTAssertEqual(name, "FatalErrorException")
    }
}

// ----------------------------------------------------------------------------
