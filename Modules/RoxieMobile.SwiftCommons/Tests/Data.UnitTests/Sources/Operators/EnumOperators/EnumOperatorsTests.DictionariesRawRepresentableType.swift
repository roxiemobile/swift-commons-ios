// ----------------------------------------------------------------------------
//
//  EnumOperatorsTests.DictionariesRawRepresentableType.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
//  MARK: - Dictionary of Raw Representable object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testDictionaryRawRepresentableTypesObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let object: [String: EnumObject] = [CodingKeys.enumObject: EnumObject.Another]

        object >>> map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testDictionaryRawRepresentableTypesObjectFromJSON() {

        let JsonString = JsonKeys.enumOperatorsDictionaryObject
        let JsonStringNotValid = JsonKeys.enumOperatorsDictionaryObjectNotValid
        let JsonStringEmpty = JsonKeys.enumOperatorsDictionaryObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [String: EnumObject] = [:]

        object <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertEqual(object[CodingKeys.enumObject]?.rawValue, "Another")

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
//  MARK: - Optional Dictionary of Raw Representable object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testDictionaryRawRepresentableTypesOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let object: [String: EnumObject]? = [CodingKeys.enumObject: EnumObject.Another]

        object >>> map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testDictionaryRawRepresentableTypesOptionalObjectFromJSON() {

        let JsonString = JsonKeys.enumOperatorsDictionaryObject
        let JsonStringNotValid = JsonKeys.enumOperatorsDictionaryObjectNotValid
        let JsonStringEmpty = JsonKeys.enumOperatorsDictionaryObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [String: EnumObject]? = nil

        object <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertEqual(object?[CodingKeys.enumObject]?.rawValue, "Another")

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
//  MARK: - Implicitly Unwrapped Optional Dictionary of Raw Representable object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testDictionaryRawRepresentableTypesImplicitlyUnwrappedOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        var object: [String: EnumObject]! = [CodingKeys.enumObject: EnumObject.Another]

        object <~ map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testDictionaryRawRepresentableTypesImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = JsonKeys.enumOperatorsDictionaryObject
        let JsonStringNotValid = JsonKeys.enumOperatorsDictionaryObjectNotValid
        let JsonStringEmpty = JsonKeys.enumOperatorsDictionaryObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [String: EnumObject]! = [:]

        object <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertEqual(object[CodingKeys.enumObject]?.rawValue, "Another")

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
