// ----------------------------------------------------------------------------
//
//  ReflectionTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsLang
import XCTest

// ----------------------------------------------------------------------------

class ReflectionTests: XCTestCase
{
    func testReflectionTests() {
        let reflection = Reflection(of: ReflectionTests.self)

        XCTAssertEqual(reflection.type.fullName, "SwiftCommonsLang_UnitTests.ReflectionTests")
        XCTAssertEqual(reflection.type.name, "ReflectionTests")
    }

    func testOptionalReflectionTests() {
        let reflection = Reflection(of: ReflectionTests?.self)

        XCTAssertEqual(reflection.type.fullName, "SwiftCommonsLang_UnitTests.ReflectionTests")
        XCTAssertEqual(reflection.type.name, "ReflectionTests")
    }
}

// ----------------------------------------------------------------------------
