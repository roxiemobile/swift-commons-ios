// ----------------------------------------------------------------------------
//
//  OperatorsTests.DictionaryMappable.Object.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testDictionaryMappableObjectsToJSON() {
        let objectValid = ValidMappableObjectModel()
        let objectNotValid = SetNotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let dictionaryObjects: Dictionary<String, ValidMappableObjectModel> = [CodingKeys.validDictionaryObjects: objectValid]

        let dictionaryNotValid: Dictionary<String, SetNotValidMappableObjectModel> = [CodingKeys.notValidValue: objectNotValid]
        let dictionaryEmpty: Dictionary<String, ValidMappableObjectModel> = [:]
        let dictionaryNil: Dictionary<String, ValidMappableObjectModel>? = nil

        dictionaryObjects >>> map[CodingKeys.validDictionaryObjects]

        XCTAssertNotNil(map.JSON[CodingKeys.validDictionaryObjects])

        guardNegativeException {
            dictionaryNotValid >>> map[CodingKeys.notValidValue]
        }

        dictionaryEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        dictionaryNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testDictionaryMappableObjectsFromJSON() {
        let JSONString = JSONKeys.forDictionaryMappableObjects
        let JSONStringNotValid = JSONKeys.forDictionaryMappableObjectsNotValid
        let JSONStringEmpty = JSONKeys.forDictionaryMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var dictionaryObjects: Dictionary<String, ValidMappableObjectModel> = [:]

        dictionaryObjects <~ mapValid[CodingKeys.validDictionaryObjects]


        /// Valid Dictionary
        XCTAssertNotNil(dictionaryObjects[CodingKeys.validDictionaryObjects])

        /// Empty Dictionary
        guardNegativeException {
            dictionaryObjects <~ mapEmpty[CodingKeys.emptyValue]
        }

        /// Not Valid Dictionary
        guardNegativeException {
            dictionaryObjects <~ mapNotValid[CodingKeys.notValidValue]
        }

        /// Not Valid Key
        guardNegativeException {
            dictionaryObjects <~ mapValid[CodingKeys.noSuchKey]
        }
    }
}

// ----------------------------------------------------------------------------
