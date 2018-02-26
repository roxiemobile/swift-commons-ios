//
//  CheckTests.Bool.swift
//  CheckTests.Bool
//
//  Created by Семаков Никита  Владимирович on 17/01/2018.
//  Copyright © 2018 Ekassir. All rights reserved.
//

@testable import SwiftCommonsDiagnostics
//import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests for complete model

// MARK: - Can't create model with empty default values for non-optional fields.

//    func testCompleteBoolModelWithoutDefaultValues() {
//        let method = "testCompleteBoolModelWithoutDefaultValues"
//
//        var completeModel: BoolModelWithoutDefaultValues? = nil
//        if let jsonObject = loadJson("test_complete_model") {
//            completeModel = try? BoolModelWithoutDefaultValues(from: jsonObject)
//        }
//
//        XCTAssertNotNil(completeModel)
//    }

    func testCompleteBoolModelWithoutDefaultValuesOptional() {
        let method = "testCompleteBoolModelWithoutDefaultValuesOptional"

        var completeModel: BoolModelWithoutDefaultValuesOptional? = nil
        if let jsonObject = loadJson("test_complete_model") {
            completeModel = try? BoolModelWithoutDefaultValuesOptional(from: jsonObject)
        }

        XCTAssertNotNil(completeModel)
    }

    func testCompleteBoolModelWithoutDefaultValuesRequired() {
        let method = "testCompleteBoolModelWithoutDefaultValuesRequired"

        var completeModel: BoolModelWithoutDefaultValuesRequired? = nil
        if let jsonObject = loadJson("test_complete_model") {
            completeModel = try? BoolModelWithoutDefaultValuesRequired(from: jsonObject)
        }

        XCTAssertNotNil(completeModel)
    }

// MARK: - Tests for incomplete model


// MARK: - Can't create model with empty default values for non-optional fields.

//    func testIncompleteBoolModelWithoutDefaultValues() {
//        let method = "testIncompleteBoolModelWithoutDefaultValues"
//
//        var incompleteModel: BoolModelWithoutDefaultValues? = nil
//        if let jsonObject = loadJson("test_incomplete_model") {
//            incompleteModel = try? BoolModelWithoutDefaultValues(from: jsonObject)
//        }
//
//        XCTAssertNil(incompleteModel)
//    }

    func testIncompleteBoolModelWithoutDefaultValuesOptional() {
        let method = "testIncompleteBoolModelWithoutDefaultValuesOptional"

        var incompleteModel: BoolModelWithoutDefaultValuesOptional? = nil
        if let jsonObject = loadJson("test_incomplete_model") {
            incompleteModel = try? BoolModelWithoutDefaultValuesOptional(from: jsonObject)
        }

        XCTAssertNotNil(incompleteModel)
    }

    func testIncompleteBoolModelWithoutDefaultValuesRequired() {
        let method = "testIncompleteBoolModelWithoutDefaultValuesRequired"

        var incompleteModel: BoolModelWithoutDefaultValuesRequired? = nil
        if let jsonObject = loadJson("test_incomplete_model") {
            incompleteModel = try? BoolModelWithoutDefaultValuesRequired(from: jsonObject)
        }

        XCTAssertNil(incompleteModel)
    }
}

// ----------------------------------------------------------------------------
