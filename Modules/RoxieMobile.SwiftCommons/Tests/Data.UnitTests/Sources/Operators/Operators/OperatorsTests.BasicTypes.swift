// ----------------------------------------------------------------------------
//
//  OperatorsTests.BasicTypes.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Object of Basic type
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testBasicTypesObjectToJSON() {

        let JSONString = JSONKeys.forBasicTypes
        let JSONStringNotValid = JSONKeys.forBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)

        mapValid.JSON[CodingKeys.nilValue] = nil

        // Bool Positive results
        let bool: Bool = Bool(JSONString[CodingKeys.bool]!)
        var boolValueFromJSON: Bool = Constants.boolFalse

        boolValueFromJSON <~ mapValid[CodingKeys.bool]
        XCTAssertEqual(boolValueFromJSON, bool)

        /// Bool Negative results
        guardNegativeException {
            boolValueFromJSON <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            boolValueFromJSON <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            boolValueFromJSON <~ mapValid[CodingKeys.nilValue]
        }
    }

    /// Tests for BasicTypes
    func testBasicTypesObjectFromJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        /// Bool Positive results
        let boolValueToJSON = true

        boolValueToJSON >>> map[CodingKeys.bool]
        XCTAssertNotNil(map.JSON[CodingKeys.bool])

        /// Bool Negative results
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional object of basic type
// ----------------------------------------------------------------------------

extension OperatorsTests
{
    // MARK: - Tests

    func testBasicTypesOptionalObjectToJSON() {

        let JSONString = JSONKeys.forBasicTypes
        let JSONStringNotValid = JSONKeys.forBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        mapValid.JSON[CodingKeys.nilValue] = nil

        /// Bool Positive results
        let bool: Bool? = Bool(JSONString[CodingKeys.bool]!)
        var boolValueFromJSON: Bool? = Constants.boolFalse
        boolValueFromJSON <~ mapValid[CodingKeys.bool]
        XCTAssertEqual(boolValueFromJSON, bool)

        /// Bool Negative results
        boolValueFromJSON <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(boolValueFromJSON, nil)
        boolValueFromJSON <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(boolValueFromJSON, nil)
        guardNegativeException {
            boolValueFromJSON <~ mapNotValid[CodingKeys.notValidValue]
        }
    }

    func testBasicTypesOptionalObjectFromJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        /// Bool Positive results
        let boolValueToJSON: Bool? = Constants.boolTrue
        boolValueToJSON >>> map[CodingKeys.bool]
        XCTAssertNotNil(map.JSON[CodingKeys.bool])

        /// Bool Negative results
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional object of basic type
// ----------------------------------------------------------------------------

extension OperatorsTests
{
    // MARK: - Tests

    func testBasicTypesImplicitlyUnwrappedOptionalObjectToJSON() {

        let JSONString = JSONKeys.forBasicTypes
        let JSONStringNotValid = JSONKeys.forBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        mapValid.JSON[CodingKeys.nilValue] = nil

        /// Bool Positive results
        let bool: Bool! = Bool(JSONString[CodingKeys.bool]!)
        var boolValueFromJSON: Bool! = Constants.boolFalse
        boolValueFromJSON <~ mapValid[CodingKeys.bool]
        XCTAssertEqual(boolValueFromJSON, bool)

        /// Bool Negative results
        guardNegativeException {
            boolValueFromJSON <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            boolValueFromJSON <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            boolValueFromJSON <~ mapValid[CodingKeys.nilValue]
        }
    }

    func testBasicTypesImplicitlyUnwrappedOptionalObjectFromJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        /// Bool Positive results
        let boolValueToJSON: Bool! = true
        boolValueToJSON >>> map[CodingKeys.bool]
        XCTAssertNotNil(map.JSON[CodingKeys.bool])

        /// Bool Negative results
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
