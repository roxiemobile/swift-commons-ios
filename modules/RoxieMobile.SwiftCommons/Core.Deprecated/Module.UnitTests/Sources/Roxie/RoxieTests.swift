// ----------------------------------------------------------------------------
//
//  RoxieTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreDeprecated
import XCTest

// ----------------------------------------------------------------------------

class RoxieTests: XCTestCase
{
// MARK: - Tests

    func testExpectationError() {
        var name: String?

        name = Roxie.typeName(of: ExpectationError(""))
        XCTAssertEqual(name, "ExpectationError")

        name = Roxie.typeName(of: ObjectMapperException.self)
        XCTAssertEqual(name, "ObjectMapperException")

        name = Roxie.typeName(of: DatabaseHelper(databaseName: "", version: 0))
        XCTAssertEqual(name, "DatabaseHelper")

// FIXME: @see ValidatableModel.swift:157
//        name = Roxie.typeName(of: ValidatableModel(params: [String:Any]()))
//        XCTAssertEqual(name, "ValidatableModel")
    }
}

// ----------------------------------------------------------------------------
