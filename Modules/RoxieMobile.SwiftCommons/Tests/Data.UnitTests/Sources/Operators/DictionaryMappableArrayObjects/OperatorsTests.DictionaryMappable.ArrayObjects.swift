// ----------------------------------------------------------------------------
//
//  OperatorsTests.DictionaryMappable.ArrayObjects.swift
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

    func testDictionaryMappableArrayObjectsToJSON() {
        let objectValid = ValidMappableObjectModel()
        let objectNotValid = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let dictionaryObjects: Dictionary<String, [ValidMappableObjectModel]> = [CodingKeys.validDictionaryArrayObjects: [objectValid]]
        let dictionaryNotValid: Dictionary<String, [NotValidMappableObjectModel]> = [CodingKeys.notValidValue: [objectNotValid]]
        let dictionaryEmpty: Dictionary<String, [ValidMappableObjectModel]> = [:]
        let dictionaryNil: Dictionary<String, [ValidMappableObjectModel]>? = nil

        dictionaryObjects >>> map[CodingKeys.validDictionaryArrayObjects]

        XCTAssertNotNil(map.JSON[CodingKeys.validDictionaryArrayObjects])

        guardNegativeException {
            dictionaryNotValid >>> map[CodingKeys.notValidValue]
        }

        dictionaryEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        dictionaryNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testDictionaryMappableArrayObjectsFromJSON() {
        let JSONString = JSONKeys.forDictionaryMappableArrayObjects
        let JSONStringNotValid = JSONKeys.forDictionaryMappableArrayObjectsNotValid
        let JSONStringEmpty = JSONKeys.forDictionaryMappableArrayObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var dictionaryObjects: Dictionary<String, [ValidMappableObjectModel]> = [:]

        dictionaryObjects <~ mapValid[CodingKeys.validDictionaryArrayObjects]


        /// Valid Dictionary
        XCTAssertNotNil(dictionaryObjects[CodingKeys.validDictionaryArrayObjects])

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
