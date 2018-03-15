// ----------------------------------------------------------------------------
//
//  EnumOperatorsTests.DictionariesWithRawRepresentableTypes.swift
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
        let object: [String: EnumType] = [JsonKeys.enumObject: EnumType.typeValue]

        object >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testDictionaryRawRepresentableTypesObjectFromJSON() {

        let JsonString = Constants.enumDictionaryWithRawValues
        let JsonStringNotValid = Constants.enumDictionaryWithInvalidRawValues
        let JsonStringEmpty = Constants.enumEmptyDictionaryWithRawValues

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [String: EnumType] = [:]

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object[JsonKeys.enumObject]?.rawValue, "Another")

        // Negative
        assertExceptionNotNil {
            object <~ mapNotValid[JsonKeys.validObject]
        }
        assertExceptionNotNil {
            object <~ mapValid[JsonKeys.noSuchKey]
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        assertExceptionNotNil {
            object <~ mapValid[JsonKeys.nilValue]
        }
        assertExceptionNotNil {
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
        let object: [String: EnumType]? = [JsonKeys.enumObject: EnumType.typeValue]

        object >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testDictionaryRawRepresentableTypesOptionalObjectFromJSON() {

        let JsonString = Constants.enumDictionaryWithRawValues
        let JsonStringNotValid = Constants.enumDictionaryWithInvalidRawValues
        let JsonStringEmpty = Constants.enumEmptyDictionaryWithRawValues

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [String: EnumType]? = nil

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object?[JsonKeys.enumObject]?.rawValue, "Another")

        // Negative
        assertExceptionNotNil {
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
        var object: [String: EnumType]! = [JsonKeys.enumObject: EnumType.typeValue]

        object <~ map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testDictionaryRawRepresentableTypesImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = Constants.enumDictionaryWithRawValues
        let JsonStringNotValid = Constants.enumDictionaryWithInvalidRawValues
        let JsonStringEmpty = Constants.enumEmptyDictionaryWithRawValues

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [String: EnumType]! = [:]

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object[JsonKeys.enumObject]?.rawValue, "Another")

        // Negative
        assertExceptionNotNil {
            object <~ mapNotValid[JsonKeys.validObject]
        }
        assertExceptionNotNil {
            object <~ mapValid[JsonKeys.noSuchKey]
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        assertExceptionNotNil {
            object <~ mapValid[JsonKeys.nilValue]
        }
        assertExceptionNotNil {
            object <~ mapEmpty[JsonKeys.validObject]
        }
    }
}

// ----------------------------------------------------------------------------
