// ----------------------------------------------------------------------------
//
//  EnumOperatorsTests.DictionariesRawRepresentableType.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
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

        // Positive
        let object: [String: EnumObject] = [CodingKeys.enumObject: EnumObject.Another]
        object >>> map[CodingKeys.validObject]
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testDictionaryRawRepresentableTypesObjectFromJSON() {
        let JSONString = JSONKeys.forEnumOperatorsDictionaryObject
        let JSONStringNotValid = JSONKeys.forEnumOperatorsDictionaryObjectNotValid
        let JSONStringEmpty = JSONKeys.forEnumOperatorsDictionaryObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var object: [String: EnumObject] = [:]
        object <~ mapValid[CodingKeys.validObject]
        XCTAssertEqual(object[CodingKeys.enumObject]?.rawValue, "Another")

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
//  MARK: - Optional Dictionary of Raw Representable object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
    // MARK: - Tests

    func testDictionaryRawRepresentableTypesOptionalObjectToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        // Positive
        let object: [String: EnumObject]? = [CodingKeys.enumObject: EnumObject.Another]
        object >>> map[CodingKeys.validObject]
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testDictionaryRawRepresentableTypesOptionalObjectFromJSON() {
        let JSONString = JSONKeys.forEnumOperatorsDictionaryObject
        let JSONStringNotValid = JSONKeys.forEnumOperatorsDictionaryObjectNotValid
        let JSONStringEmpty = JSONKeys.forEnumOperatorsDictionaryObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var object: [String: EnumObject]? = nil
        object <~ mapValid[CodingKeys.validObject]
        XCTAssertEqual(object?[CodingKeys.enumObject]?.rawValue, "Another")

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
//  MARK: - Implicitly Unwrapped Optional Dictionary of Raw Representable object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
    // MARK: - Tests

    func testDictionaryRawRepresentableTypesImplicitlyUnwrappedOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        // Positive
        var object: [String: EnumObject]! = [CodingKeys.enumObject: EnumObject.Another]
        object <~ map[CodingKeys.validObject]
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testDictionaryRawRepresentableTypesImplicitlyUnwrappedOptionalObjectFromJSON() {
        let JSONString = JSONKeys.forEnumOperatorsDictionaryObject
        let JSONStringNotValid = JSONKeys.forEnumOperatorsDictionaryObjectNotValid
        let JSONStringEmpty = JSONKeys.forEnumOperatorsDictionaryObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var object: [String: EnumObject]! = [:]
        object <~ mapValid[CodingKeys.validObject]
        XCTAssertEqual(object[CodingKeys.enumObject]?.rawValue, "Another")

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
