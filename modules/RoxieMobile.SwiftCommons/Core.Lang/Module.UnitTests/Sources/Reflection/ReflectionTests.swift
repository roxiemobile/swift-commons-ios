// ----------------------------------------------------------------------------
//
//  ReflectionTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreLang
import XCTest

// ----------------------------------------------------------------------------

class ReflectionTests: XCTestCase
{
// MARK: - Tests

    func testFatalErrorException() {
        let type = Reflection(of: FatalErrorException.self).type

        XCTAssertEqual(type.fullName, "SwiftCommonsCoreLang.FatalErrorException")
        XCTAssertEqual(type.name, "FatalErrorException")
    }
}

// ----------------------------------------------------------------------------
