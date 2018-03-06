// ----------------------------------------------------------------------------
//
//  OperatorsTests.DictionaryMappable.OptionalObjects.swift
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

    func testDictionaryMappableOptionalObjectsToJSON() {
        let objectValid = ValidMappableObjectModel()
        let objectNotValid = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let dictionaryObjectsOptional: Dictionary<String, ValidMappableObjectModel>? = [CodingKeys.validDictionaryOptionalObjects: objectValid]
        let dictionaryNotValid: Dictionary<String, NotValidMappableObjectModel> = [CodingKeys.notValidValue: objectNotValid]
        let dictionaryEmpty: Dictionary<String, ValidMappableObjectModel> = [:]
        let dictionaryNil: Dictionary<String, ValidMappableObjectModel>? = nil

        dictionaryObjectsOptional >>> map[CodingKeys.validDictionaryOptionalObjects]

        XCTAssertNotNil(map.JSON[CodingKeys.validDictionaryOptionalObjects])


        guardNegativeException {
            dictionaryNotValid >>> map[CodingKeys.notValidValue]
        }

        dictionaryEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        dictionaryNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testDictionaryMappableOptionalObjectsFromJSON() {
        let JSONString = JSONKeys.forDictionaryMappableOptionalObjects
        let JSONStringNotValid = JSONKeys.forDictionaryMappableObjectsNotValid
        let JSONStringEmpty = JSONKeys.forDictionaryMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var dictionaryObjectsOptional: Dictionary<String, ValidMappableObjectModel>? = nil

        dictionaryObjectsOptional <~ mapValid[CodingKeys.validDictionaryOptionalObjects]

        /// Valid Dictionary
        XCTAssertNotNil(dictionaryObjectsOptional?.first)

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
