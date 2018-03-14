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
        let object: [String: EnumObject] = [JsonKeys.enumObject: EnumObject.Another]

        object >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testDictionaryRawRepresentableTypesObjectFromJSON() {

        let JsonString = Constants.enumOperatorsDictionaryObject
        let JsonStringNotValid = Constants.enumOperatorsDictionaryObjectNotValid
        let JsonStringEmpty = Constants.enumOperatorsDictionaryObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [String: EnumObject] = [:]

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object[JsonKeys.enumObject]?.rawValue, "Another")

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
//  MARK: - Optional Dictionary of Raw Representable object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testDictionaryRawRepresentableTypesOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let object: [String: EnumObject]? = [JsonKeys.enumObject: EnumObject.Another]

        object >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testDictionaryRawRepresentableTypesOptionalObjectFromJSON() {

        let JsonString = Constants.enumOperatorsDictionaryObject
        let JsonStringNotValid = Constants.enumOperatorsDictionaryObjectNotValid
        let JsonStringEmpty = Constants.enumOperatorsDictionaryObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [String: EnumObject]? = nil

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object?[JsonKeys.enumObject]?.rawValue, "Another")

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
//  MARK: - Implicitly Unwrapped Optional Dictionary of Raw Representable object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testDictionaryRawRepresentableTypesImplicitlyUnwrappedOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        var object: [String: EnumObject]! = [JsonKeys.enumObject: EnumObject.Another]

        object <~ map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testDictionaryRawRepresentableTypesImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = Constants.enumOperatorsDictionaryObject
        let JsonStringNotValid = Constants.enumOperatorsDictionaryObjectNotValid
        let JsonStringEmpty = Constants.enumOperatorsDictionaryObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [String: EnumObject]! = [:]

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object[JsonKeys.enumObject]?.rawValue, "Another")

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
