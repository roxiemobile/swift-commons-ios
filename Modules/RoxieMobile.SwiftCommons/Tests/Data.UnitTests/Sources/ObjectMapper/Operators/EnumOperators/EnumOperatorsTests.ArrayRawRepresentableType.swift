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
        object >>> map[JsonKeys.validObject]
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testArrayRawRepresentableTypesObjectFromJSON() {

        let JsonString = Constants.enumOperatorsArrayObject
        let JsonStringNotValid = Constants.enumOperatorsArrayObjectNotValid
        let JsonStringEmpty = Constants.enumOperatorsArrayObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [EnumObject] = [EnumObject.Default]

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object.first?.rawValue, "Another")

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
//  MARK: - Optional Array of Raw Representable  object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testArrayRawRepresentableTypesOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let object: [EnumObject]? = [EnumObject.Another]

        object >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testArrayRawRepresentableTypesOptionalObjectFromJSON() {

        let JsonString = Constants.enumOperatorsArrayObject
        let JsonStringNotValid = Constants.enumOperatorsArrayObjectNotValid
        let JsonStringEmpty = Constants.enumOperatorsArrayObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [EnumObject]? = nil

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object?.first?.rawValue, "Another")

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
//  MARK: - Implicitly Unwrapped Optional Array of Raw Representable object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testArrayRawRepresentableTypesImplicitlyUnwrappedOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        var object: [EnumObject]! = [EnumObject.Another]

        object <~ map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testArrayRawRepresentableTypesImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = Constants.enumOperatorsArrayObject
        let JsonStringNotValid = Constants.enumOperatorsArrayObjectNotValid
        let JsonStringEmpty = Constants.enumOperatorsArrayObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)
        var object: [EnumObject]! = [EnumObject.Default]

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object.first?.rawValue, "Another")

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
