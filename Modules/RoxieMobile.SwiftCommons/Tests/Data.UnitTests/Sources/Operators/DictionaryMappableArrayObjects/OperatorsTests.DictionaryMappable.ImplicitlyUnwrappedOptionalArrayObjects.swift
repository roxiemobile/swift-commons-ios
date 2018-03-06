// ----------------------------------------------------------------------------
//
//  OperatorsTests.DictionaryMappable.ImplicitlyUnwrappedOptionalArrayObjects.swift
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

    func testDictionaryMappableImplicitlyUnwrappedOptionalArrayObjectsToJSON() {
        let objectValid = ValidMappableObjectModel()
        let objectNotValid = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        var dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, [ValidMappableObjectModel]>! = [CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects: [objectValid]]
        let dictionaryNotValid: Dictionary<String, [NotValidMappableObjectModel]> = [CodingKeys.notValidValue: [objectNotValid]]
        let dictionaryEmpty: Dictionary<String, [ValidMappableObjectModel]> = [:]
        let dictionaryNil: Dictionary<String, [ValidMappableObjectModel]>? = nil

        dictionaryObjectsImplicitlyUnwrappedOptional <~ map[CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects]


        XCTAssertNotNil(map.JSON[CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects])


        guardNegativeException {
            dictionaryNotValid >>> map[CodingKeys.notValidValue]
        }

        dictionaryEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        dictionaryNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testDictionaryMappableImplicitlyUnwrappedOptionalArrayObjectsFromJSON() {
        let JSONString = JSONKeys.forDictionaryMappableArrayImplicitlyUnwrappedOptionalObjects
        let JSONStringNotValid = JSONKeys.forDictionaryMappableArrayObjectsNotValid
        let JSONStringEmpty = JSONKeys.forDictionaryMappableArrayObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, [ValidMappableObjectModel]>!

        dictionaryObjectsImplicitlyUnwrappedOptional <~ mapValid[CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects]

        /// Valid Dictionary
        XCTAssertNotNil(dictionaryObjectsImplicitlyUnwrappedOptional[CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects])

        /// Empty Dictionary
        guardNegativeException {
            dictionaryObjectsImplicitlyUnwrappedOptional <~ mapEmpty[CodingKeys.emptyValue]
        }

        /// Not Valid Dictionary
        guardNegativeException {
            dictionaryObjectsImplicitlyUnwrappedOptional <~ mapNotValid[CodingKeys.notValidValue]
        }

        /// Not Valid Key
        guardNegativeException {
            dictionaryObjectsImplicitlyUnwrappedOptional <~ mapValid[CodingKeys.nilValue]
        }
    }
}

// ----------------------------------------------------------------------------
