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

        object >>> map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testRawRepresentableTypesObjectFromJSON() {

        let JSONString = JsonKeys.enumOperatorsObject
        let JSONStringNotValid = JsonKeys.enumOperatorsObjectNotValid
        let JSONStringEmpty = JsonKeys.enumOperatorsObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var object: EnumObject = EnumObject.Default

        object <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertEqual(object.rawValue, "Another")

        // Negative
        guardNegativeException {
            object <~ mapNotValid[CodingKeys.validObject]
        }
        guardNegativeException {
            object <~ mapValid[CodingKeys.noSuchKey]
        }

        mapValid.JSON[CodingKeys.nilValue] = nil
        guardNegativeException {
            object <~ mapValid[CodingKeys.nilValue]
        }
        guardNegativeException {
            object <~ mapEmpty[CodingKeys.validObject]
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

        object >>> map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testRawRepresentableTypesOptionalObjectFromJSON() {

        let JSONString = JsonKeys.enumOperatorsObject
        let JSONStringNotValid = JsonKeys.enumOperatorsObjectNotValid
        let JSONStringEmpty = JsonKeys.enumOperatorsObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var object: EnumObject? = EnumObject.Default

        object <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertEqual(object?.rawValue, "Another")

        // Negative
        guardNegativeException {
            object <~ mapNotValid[CodingKeys.validObject]
        }

        object <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertNil(object)

        mapValid.JSON[CodingKeys.nilValue] = nil
        object <~ mapValid[CodingKeys.nilValue]
        XCTAssertNil(object)

        object <~ mapEmpty[CodingKeys.validObject]
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

        object <~ map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testRawRepresentableTypesImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = JsonKeys.enumOperatorsObject
        let JsonStringNotValid = JsonKeys.enumOperatorsObjectNotValid
        let JsonStringEmpty = JsonKeys.enumOperatorsObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)
        var object: EnumObject! = EnumObject.Default

        object <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertEqual(object.rawValue, "Another")

        // Negative
        guardNegativeException {
            object <~ mapNotValid[CodingKeys.validObject]
        }
        guardNegativeException {
            object <~ mapValid[CodingKeys.noSuchKey]
        }

        mapValid.JSON[CodingKeys.nilValue] = nil
        guardNegativeException {
            object <~ mapValid[CodingKeys.nilValue]
        }
        guardNegativeException {
            object <~ mapEmpty[CodingKeys.validObject]
        }
    }
}

// ----------------------------------------------------------------------------
