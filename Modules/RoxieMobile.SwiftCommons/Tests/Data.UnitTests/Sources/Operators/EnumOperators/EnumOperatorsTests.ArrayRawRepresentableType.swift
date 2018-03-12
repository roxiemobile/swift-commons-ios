// ----------------------------------------------------------------------------
//
//  EnumOperatorsTests.ArrayRawRepresentableType.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
//  MARK: - Array of Raw Representable object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
    // MARK: - Tests

    func testArrayRawRepresentableTypesObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        // Positive
        let object: [EnumObject] = [EnumObject.Another]
        object >>> map[CodingKeys.validObject]
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testArrayRawRepresentableTypesObjectFromJSON() {
        let JSONString = JSONKeys.forEnumOperatorsArrayObject
        let JSONStringNotValid = JSONKeys.forEnumOperatorsArrayObjectNotValid
        let JSONStringEmpty = JSONKeys.forEnumOperatorsArrayObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var object: [EnumObject] = [EnumObject.Default]
        object <~ mapValid[CodingKeys.validObject]
        XCTAssertEqual(object.first?.rawValue, "Another")

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
//  MARK: - Optional Array of Raw Representable  object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
    // MARK: - Tests

    func testArrayRawRepresentableTypesOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        // Positive
        let object: [EnumObject]? = [EnumObject.Another]
        object >>> map[CodingKeys.validObject]
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testArrayRawRepresentableTypesOptionalObjectFromJSON() {
        let JSONString = JSONKeys.forEnumOperatorsArrayObject
        let JSONStringNotValid = JSONKeys.forEnumOperatorsArrayObjectNotValid
        let JSONStringEmpty = JSONKeys.forEnumOperatorsArrayObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var object: [EnumObject]? = nil
        object <~ mapValid[CodingKeys.validObject]
        XCTAssertEqual(object?.first?.rawValue, "Another")

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
//  MARK: - Implicitly Unwrapped Optional Array of Raw Representable object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
    // MARK: - Tests

    func testArrayRawRepresentableTypesImplicitlyUnwrappedOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        // Positive
        var object: [EnumObject]! = [EnumObject.Another]
        object <~ map[CodingKeys.validObject]
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testArrayRawRepresentableTypesImplicitlyUnwrappedOptionalObjectFromJSON() {
        let JSONString = JSONKeys.forEnumOperatorsArrayObject
        let JSONStringNotValid = JSONKeys.forEnumOperatorsArrayObjectNotValid
        let JSONStringEmpty = JSONKeys.forEnumOperatorsArrayObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var object: [EnumObject]! = [EnumObject.Default]
        object <~ mapValid[CodingKeys.validObject]
        XCTAssertEqual(object.first?.rawValue, "Another")

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
