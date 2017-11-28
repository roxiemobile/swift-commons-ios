// ----------------------------------------------------------------------------
//
//  CheckTests.Valid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsCoreDiagnostics
import SwiftCommonsCoreAbstractions
import XCTest

// ----------------------------------------------------------------------------

extension CheckTests
{
// MARK: - Tests

    func testValid() {
        let method = "Check.valid"

        let validObject: Validatable = ValidModel()
        let notValidObject: Validatable = NotValidModel()


        checkThrowsError(method) {
            try Check.valid(notValidObject)
        }

        checkNotThrowsError(method) {
            try Check.valid(validObject)
        }
    }

    func testValidModel() {
        let method = "Check.valid"

        var parking: ParkingModel? = nil

        if let jsonObject = loadJson("test_parking_model_with_valid_vehicles_in_array") {
            checkNotThrowsError("\(method)_Model", errorType: CheckError.self) {
                parking = try ParkingModel(from: jsonObject)
            }
        }

        XCTAssertNotNil(parking)
        if let object = parking { XCTAssertTrue(object.isValid) }
    }
}

// ----------------------------------------------------------------------------
