//
//  CheckTests.Bool.swift
//  CheckTests.Bool
//
//  Created by Семаков Никита  Владимирович on 17/01/2018.
//  Copyright © 2018 Ekassir. All rights reserved.
//

@testable import SwiftCommonsDiagnostics
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests for complete model

    func testCompleteBoolModelWithDefaultValues() {
        let method = "testCompleteBoolModelWithDefaultValues"

        var completeModel: BoolModelWithDefaultValues? = nil
        if let jsonObject = loadJson("test_complete_model") {
            completeModel = try? BoolModelWithDefaultValues(from: jsonObject)
        }

        XCTAssertNotNil(completeModel)
    }

    func testCompleteBoolModelWithDefaultValuesOptional() {
        let method = "testCompleteBoolModelWithDefaultValuesOptional"

        var completeModel: BoolModelWithDefaultValuesOptional? = nil
        if let jsonObject = loadJson("test_complete_model") {
            completeModel = try? BoolModelWithDefaultValuesOptional(from: jsonObject)
        }

        XCTAssertNotNil(completeModel)
    }

    func testCompleteBoolModelWithDefaultValuesRequired() {
        let method = "testCompleteBoolModelWithDefaultValuesRequired"

        var completeModel: BoolModelWithDefaultValuesRequired? = nil
        if let jsonObject = loadJson("test_complete_model") {
            completeModel = try? BoolModelWithDefaultValuesRequired(from: jsonObject)
        }

        XCTAssertNotNil(completeModel)
    }

// MARK: - Tests for incomplete model

    func testIncompleteBoolModelWithDefaultValues() {
        let method = "testIncompleteBoolModelWithDefaultValues"

        var incompleteModel: BoolModelWithDefaultValues? = nil
        if let jsonObject = loadJson("test_incomplete_model") {
            incompleteModel = try? BoolModelWithDefaultValues(from: jsonObject)
        }

        XCTAssertNil(incompleteModel)
    }

    func testIncompleteBoolModelWithDefaultValuesOptional() {
        let method = "testIncompleteBoolModelWithDefaultValuesOptional"

        var incompleteModel: BoolModelWithDefaultValuesOptional? = nil
        if let jsonObject = loadJson("test_incomplete_model") {
            incompleteModel = try? BoolModelWithDefaultValuesOptional(from: jsonObject)
        }

        XCTAssertNotNil(incompleteModel)
    }

    func testIncompleteBoolModelWithDefaultValuesRequired() {
        let method = "testIncompleteBoolModelWithDefaultValuesRequired"

        var incompleteModel: BoolModelWithDefaultValuesRequired? = nil
        if let jsonObject = loadJson("test_incomplete_model") {
            incompleteModel = try? BoolModelWithDefaultValuesRequired(from: jsonObject)
        }

        XCTAssertNotNil(incompleteModel)
    }
}

// ----------------------------------------------------------------------------
