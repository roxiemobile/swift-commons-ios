// ----------------------------------------------------------------------------
//
//  EnumOperatorsTests.RawRepresentableTypes.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
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

        // Positive
        let object: EnumObject = EnumObject.Another
        object >>> map[CodingKeys.validObject]
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testRawRepresentableTypesObjectFromJSON() {
        let JSONString = JSONKeys.forEnumOperatorsObject
        let JSONStringNotValid = JSONKeys.forEnumOperatorsObjectNotValid
        let JSONStringEmpty = JSONKeys.forEnumOperatorsObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var object: EnumObject = EnumObject.Default
        object <~ mapValid[CodingKeys.validObject]
        XCTAssertEqual(object.rawValue, "Another")

        // Negative
        guardNegativeException {
            object <~ mapNotValid[CodingKeys.validObject]
        }
        guardNegativeException {
            object <~ mapValid[CodingKeys.noSuchKey]
        }
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

        // Positive
        let object: EnumObject? = EnumObject.Another
        object >>> map[CodingKeys.validObject]
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testRawRepresentableTypesOptionalObjectFromJSON() {
        let JSONString = JSONKeys.forEnumOperatorsObject
        let JSONStringNotValid = JSONKeys.forEnumOperatorsObjectNotValid
        let JSONStringEmpty = JSONKeys.forEnumOperatorsObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var object: EnumObject? = EnumObject.Default
        object <~ mapValid[CodingKeys.validObject]
        XCTAssertEqual(object?.rawValue, "Another")

        // Negative
        guardNegativeException {
            object <~ mapNotValid[CodingKeys.validObject]
        }
        object <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertNil(object)

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

        // Positive
        var object: EnumObject! = EnumObject.Another
        object <~ map[CodingKeys.validObject]
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testRawRepresentableTypesImplicitlyUnwrappedOptionalObjectFromJSON() {
        let JSONString = JSONKeys.forEnumOperatorsObject
        let JSONStringNotValid = JSONKeys.forEnumOperatorsObjectNotValid
        let JSONStringEmpty = JSONKeys.forEnumOperatorsObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var object: EnumObject! = EnumObject.Default
        object <~ mapValid[CodingKeys.validObject]
        XCTAssertEqual(object.rawValue, "Another")

        // Negative
        guardNegativeException {
            object <~ mapNotValid[CodingKeys.validObject]
        }
        guardNegativeException {
            object <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            object <~ mapValid[CodingKeys.nilValue]
        }
        guardNegativeException {
            object <~ mapEmpty[CodingKeys.validObject]
        }
    }
}

// ----------------------------------------------------------------------------
