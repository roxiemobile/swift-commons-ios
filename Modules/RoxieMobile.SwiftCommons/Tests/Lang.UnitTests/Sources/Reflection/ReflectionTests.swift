// ----------------------------------------------------------------------------
//
//  ReflectionTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsLang
import XCTest

// ----------------------------------------------------------------------------

class ReflectionTests: XCTestCase {

// MARK: - Tests

    func testReflectionOfType() {
        let type = Reflection(of: FatalErrorException.self).type

        XCTAssertEqual(type.fullName, "SwiftCommonsLang.FatalErrorException")
        XCTAssertEqual(type.name, "FatalErrorException")
    }

    func testReflectionOfObject() {
        let type = Reflection(of: FatalErrorException(reason: "")).type

        XCTAssertEqual(type.fullName, "SwiftCommonsLang.FatalErrorException")
        XCTAssertEqual(type.name, "FatalErrorException")
    }
}
