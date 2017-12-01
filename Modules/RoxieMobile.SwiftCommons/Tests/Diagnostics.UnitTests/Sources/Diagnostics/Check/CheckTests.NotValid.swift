// ----------------------------------------------------------------------------
//
//  CheckTests.NotValid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsDiagnostics
import SwiftCommonsAbstractions
import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testNotValid() {
        let method = "Check.notValid"

        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()


        checkThrowsError(method) {
            try Check.notValid(validObject)
        }

        checkNotThrowsError(method) {
            try Check.notValid(notValidObject)
        }
    }

    func testNotValidModel() {
        let method = "Check.notValid"

        var parking: ParkingModel? = nil

        if let jsonObject = loadJson("test_parking_model_with_one_non_valid_vehicle_in_array") {
            checkThrowsError("\(method)_Model", errorType: JsonSyntaxError.self) {
                parking = try ParkingModel(from: jsonObject)
            }
        }

        XCTAssertNil(parking)
    }
}

// ----------------------------------------------------------------------------
