// ----------------------------------------------------------------------------
//
//  EnumOperatorsTests.ArrayRawRepresentableType.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
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
        let object: [EnumObject] = [EnumObject.Another]

        // Positive
        object >>> map[CodingKeys.validObject]
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testArrayRawRepresentableTypesObjectFromJSON() {

        let JsonString = JsonKeys.enumOperatorsArrayObject
        let JsonStringNotValid = JsonKeys.enumOperatorsArrayObjectNotValid
        let JsonStringEmpty = JsonKeys.enumOperatorsArrayObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [EnumObject] = [EnumObject.Default]

        object <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertEqual(object.first?.rawValue, "Another")

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
//  MARK: - Optional Array of Raw Representable  object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testArrayRawRepresentableTypesOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let object: [EnumObject]? = [EnumObject.Another]

        object >>> map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testArrayRawRepresentableTypesOptionalObjectFromJSON() {

        let JsonString = JsonKeys.enumOperatorsArrayObject
        let JsonStringNotValid = JsonKeys.enumOperatorsArrayObjectNotValid
        let JsonStringEmpty = JsonKeys.enumOperatorsArrayObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [EnumObject]? = nil

        object <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertEqual(object?.first?.rawValue, "Another")

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
//  MARK: - Implicitly Unwrapped Optional Array of Raw Representable object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testArrayRawRepresentableTypesImplicitlyUnwrappedOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        var object: [EnumObject]! = [EnumObject.Another]

        object <~ map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testArrayRawRepresentableTypesImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = JsonKeys.enumOperatorsArrayObject
        let JsonStringNotValid = JsonKeys.enumOperatorsArrayObjectNotValid
        let JsonStringEmpty = JsonKeys.enumOperatorsArrayObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)
        var object: [EnumObject]! = [EnumObject.Default]

        object <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertEqual(object.first?.rawValue, "Another")

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
