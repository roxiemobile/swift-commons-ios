// ----------------------------------------------------------------------------
//
//  OperatorsTests.BasicTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
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

        let JsonString = JsonKeys.basicTypes
        let JsonStringNotValid = JsonKeys.basicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        let bool: Bool = Bool(JsonString[CodingKeys.bool]!)
        var boolValueFromJSON = false

        boolValueFromJSON <~ mapValid[CodingKeys.bool]

        // Positive
        XCTAssertEqual(boolValueFromJSON, bool)

        /// Bool Negative results
        guardNegativeException {
            boolValueFromJSON <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            boolValueFromJSON <~ mapValid[CodingKeys.noSuchKey]
        }

        mapValid.JSON[CodingKeys.nilValue] = nil
        guardNegativeException {
            boolValueFromJSON <~ mapValid[CodingKeys.nilValue]
        }
    }

    func testBasicTypesObjectFromJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let boolValueToJSON = true

        boolValueToJSON >>> map[CodingKeys.bool]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.bool])

        // Negative
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

        let JsonString = JsonKeys.basicTypes
        let JsonStringNotValid = JsonKeys.basicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        let bool: Bool? = Bool(JsonString[CodingKeys.bool]!)
        var boolValueFromJSON: Bool? = false

        boolValueFromJSON <~ mapValid[CodingKeys.bool]

        // Positive
        XCTAssertEqual(boolValueFromJSON, bool)

        // Negative
        boolValueFromJSON <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(boolValueFromJSON, nil)

        mapValid.JSON[CodingKeys.nilValue] = nil
        boolValueFromJSON <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(boolValueFromJSON, nil)

        guardNegativeException {
            boolValueFromJSON <~ mapNotValid[CodingKeys.notValidValue]
        }
    }

    func testBasicTypesOptionalObjectFromJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let boolValueToJSON: Bool? = true

        boolValueToJSON >>> map[CodingKeys.bool]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.bool])

        // Negative
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

        let JsonString = JsonKeys.basicTypes
        let JsonStringNotValid = JsonKeys.basicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        let bool: Bool! = Bool(JsonString[CodingKeys.bool]!)
        var boolValueFromJSON: Bool! = false

        boolValueFromJSON <~ mapValid[CodingKeys.bool]

        // Positive
        XCTAssertEqual(boolValueFromJSON, bool)

        // Negative
        guardNegativeException {
            boolValueFromJSON <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            boolValueFromJSON <~ mapValid[CodingKeys.noSuchKey]
        }

        mapValid.JSON[CodingKeys.nilValue] = nil
        guardNegativeException {
            boolValueFromJSON <~ mapValid[CodingKeys.nilValue]
        }
    }

    func testBasicTypesImplicitlyUnwrappedOptionalObjectFromJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let boolValueToJSON: Bool! = true

        boolValueToJSON >>> map[CodingKeys.bool]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.bool])

        /// Bool Negative results
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
