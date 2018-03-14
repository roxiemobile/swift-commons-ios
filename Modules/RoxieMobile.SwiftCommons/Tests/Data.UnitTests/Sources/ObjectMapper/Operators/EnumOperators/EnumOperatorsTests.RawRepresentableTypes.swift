// ----------------------------------------------------------------------------
//
//  EnumOperatorsTests.RawRepresentableTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
//  MARK: - Object of Raw Representable type
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testRawRepresentableTypesObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let object: EnumObject = EnumObject.Another

        object >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testRawRepresentableTypesObjectFromJSON() {

        let JSONString = Constants.enumOperatorsObject
        let JSONStringNotValid = Constants.enumOperatorsObjectNotValid
        let JSONStringEmpty = Constants.enumOperatorsObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var object: EnumObject = EnumObject.Default

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object.rawValue, "Another")

        // Negative
        guardNegativeException {
            object <~ mapNotValid[JsonKeys.validObject]
        }
        guardNegativeException {
            object <~ mapValid[JsonKeys.noSuchKey]
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        guardNegativeException {
            object <~ mapValid[JsonKeys.nilValue]
        }
        guardNegativeException {
            object <~ mapEmpty[JsonKeys.validObject]
        }
    }
}

// ----------------------------------------------------------------------------
//  MARK: - Optional Object of Raw Representable type
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testRawRepresentableTypesOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let object: EnumObject? = EnumObject.Another

        object >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testRawRepresentableTypesOptionalObjectFromJSON() {

        let JSONString = Constants.enumOperatorsObject
        let JSONStringNotValid = Constants.enumOperatorsObjectNotValid
        let JSONStringEmpty = Constants.enumOperatorsObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var object: EnumObject? = EnumObject.Default

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object?.rawValue, "Another")

        // Negative
        guardNegativeException {
            object <~ mapNotValid[JsonKeys.validObject]
        }

        object <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertNil(object)

        mapValid.JSON[JsonKeys.nilValue] = nil
        object <~ mapValid[JsonKeys.nilValue]
        XCTAssertNil(object)

        object <~ mapEmpty[JsonKeys.validObject]
        XCTAssertNil(object)
    }
}

// ----------------------------------------------------------------------------
//  MARK: - Implicitly Unwrapped Optional Object of Raw Representable type
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testRawRepresentableTypesImplicitlyUnwrappedOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        var object: EnumObject! = EnumObject.Another

        object <~ map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testRawRepresentableTypesImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = Constants.enumOperatorsObject
        let JsonStringNotValid = Constants.enumOperatorsObjectNotValid
        let JsonStringEmpty = Constants.enumOperatorsObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)
        var object: EnumObject! = EnumObject.Default

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object.rawValue, "Another")

        // Negative
        guardNegativeException {
            object <~ mapNotValid[JsonKeys.validObject]
        }
        guardNegativeException {
            object <~ mapValid[JsonKeys.noSuchKey]
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        guardNegativeException {
            object <~ mapValid[JsonKeys.nilValue]
        }
        guardNegativeException {
            object <~ mapEmpty[JsonKeys.validObject]
        }
    }
}

// ----------------------------------------------------------------------------
