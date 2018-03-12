// ----------------------------------------------------------------------------
//
//  OperatorsTests.DictionaryArrayMappable.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Dictionary of Mappable objects <String, T: Mappable>
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
// MARK: - Optional Dictionary of Mappable object <String, T: Mappable>
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
// MARK: - Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable>
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
