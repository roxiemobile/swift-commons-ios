// ----------------------------------------------------------------------------
//
//  OperatorsTests.DictionaryMappable.OptionalArrayObjects.swift
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

    func testDictionaryMappableOptionalArrayObjectsToJSON() {
        let objectValid = ValidMappableObjectModel()
        let objectNotValid = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let dictionaryObjectsOptional: Dictionary<String, [ValidMappableObjectModel]>? = [CodingKeys.validDictionaryArrayOptionalObjects: [objectValid]]
        let dictionaryNotValid: Dictionary<String, [NotValidMappableObjectModel]> = [CodingKeys.notValidValue: [objectNotValid]]
        let dictionaryEmpty: Dictionary<String, ValidMappableObjectModel> = [:]
        let dictionaryNil: Dictionary<String, ValidMappableObjectModel>? = nil

        dictionaryObjectsOptional >>> map[CodingKeys.validDictionaryArrayOptionalObjects]


        XCTAssertNotNil(map.JSON[CodingKeys.validDictionaryArrayOptionalObjects])

        guardNegativeException {
            dictionaryNotValid >>> map[CodingKeys.notValidValue]
        }

        dictionaryEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        dictionaryNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testDictionaryMappableOptionalArrayObjectsFromJSON() {
        let JSONString = JSONKeys.forDictionaryMappableArrayOptionalObjects
        let JSONStringNotValid = JSONKeys.forDictionaryMappableArrayObjectsNotValid
        let JSONStringEmpty = JSONKeys.forDictionaryMappableArrayObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var dictionaryObjectsOptional: Dictionary<String, [ValidMappableObjectModel]>? = nil

        dictionaryObjectsOptional <~ mapValid[CodingKeys.validDictionaryArrayOptionalObjects]

        /// Valid Dictionary
        XCTAssertNotNil(dictionaryObjectsOptional?[CodingKeys.validDictionaryArrayOptionalObjects])

        /// Empty Dictionary
        guardNegativeException {
            dictionaryObjectsOptional <~ mapEmpty[CodingKeys.emptyValue]
        }

        /// Not Valid Dictionary
        guardNegativeException {
            dictionaryObjectsOptional <~ mapNotValid[CodingKeys.notValidValue]
        }

        /// Not Valid Key
        dictionaryObjectsOptional <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertNil(dictionaryObjectsOptional)
    }
}

// ----------------------------------------------------------------------------
