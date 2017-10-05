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
import SwiftCommons
import XCTest

// ----------------------------------------------------------------------------

class RoxieTests: XCTestCase
{
// MARK: - Tests

    func testExpectationError() {
        var name = Roxie.typeName(of: ExpectationError(""))
        XCTAssertEqual(name, "ExpectationError")
    }

    func testObjectMapperException() {
        var name = Roxie.typeName(of: ObjectMapperException.self)
        XCTAssertEqual(name, "ObjectMapperException")
    }

    func testDatabaseHelper() {
        var name = Roxie.typeName(of: DatabaseHelper(databaseName: "", version: 0))
        XCTAssertEqual(name, "DatabaseHelper")
    }

    func testValidatableModel() {
//        // FIXME: @see ValidatableModel.swift:157
//        name = Roxie.typeName(of: ValidatableModel(params: [String:Any]()))
//        XCTAssertEqual(name, "ValidatableModel")
    }
}

// ----------------------------------------------------------------------------
