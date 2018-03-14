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

        let JsonString = Constants.basicTypes
        let JsonStringNotValid = Constants.basicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        let bool: Bool = Bool(JsonString[JsonKeys.bool]!)
        var boolValueFromJSON = false

        boolValueFromJSON <~ mapValid[JsonKeys.bool]

        // Positive
        XCTAssertEqual(boolValueFromJSON, bool)

        /// Bool Negative results
        guardNegativeException {
            boolValueFromJSON <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            boolValueFromJSON <~ mapValid[JsonKeys.noSuchKey]
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        guardNegativeException {
            boolValueFromJSON <~ mapValid[JsonKeys.nilValue]
        }
    }

    func testBasicTypesObjectFromJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let boolValueToJSON = true

        boolValueToJSON >>> map[JsonKeys.bool]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.bool])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
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

        let JsonString = Constants.basicTypes
        let JsonStringNotValid = Constants.basicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        let bool: Bool? = Bool(JsonString[JsonKeys.bool]!)
        var boolValueFromJSON: Bool? = false

        boolValueFromJSON <~ mapValid[JsonKeys.bool]

        // Positive
        XCTAssertEqual(boolValueFromJSON, bool)

        // Negative
        boolValueFromJSON <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertEqual(boolValueFromJSON, nil)

        mapValid.JSON[JsonKeys.nilValue] = nil
        boolValueFromJSON <~ mapValid[JsonKeys.nilValue]
        XCTAssertEqual(boolValueFromJSON, nil)

        guardNegativeException {
            boolValueFromJSON <~ mapNotValid[JsonKeys.notValidValue]
        }
    }

    func testBasicTypesOptionalObjectFromJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let boolValueToJSON: Bool? = true

        boolValueToJSON >>> map[JsonKeys.bool]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.bool])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
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

        let JsonString = Constants.basicTypes
        let JsonStringNotValid = Constants.basicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        let bool: Bool! = Bool(JsonString[JsonKeys.bool]!)
        var boolValueFromJSON: Bool! = false

        boolValueFromJSON <~ mapValid[JsonKeys.bool]

        // Positive
        XCTAssertEqual(boolValueFromJSON, bool)

        // Negative
        guardNegativeException {
            boolValueFromJSON <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            boolValueFromJSON <~ mapValid[JsonKeys.noSuchKey]
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        guardNegativeException {
            boolValueFromJSON <~ mapValid[JsonKeys.nilValue]
        }
    }

    func testBasicTypesImplicitlyUnwrappedOptionalObjectFromJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let boolValueToJSON: Bool! = true

        boolValueToJSON >>> map[JsonKeys.bool]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.bool])

        /// Bool Negative results
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
