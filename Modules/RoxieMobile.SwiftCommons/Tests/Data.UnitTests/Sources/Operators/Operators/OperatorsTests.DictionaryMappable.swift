// ----------------------------------------------------------------------------
//
//  OperatorsTests.DictionaryMappable.swift
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
// MARK: - Optional Dictionary of Mappable object <String, T: Mappable>
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
// MARK: - Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable>
// ----------------------------------------------------------------------------

extension OperatorsTests
{
    // MARK: - Tests

    func testDictionaryMappableImplicitlyUnwrappedOptionalObjectsToJSON() {
        let objectValid = ValidMappableObjectModel()
        let objectNotValid = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        var dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, ValidMappableObjectModel>! = [CodingKeys.validDictionaryImplicitlyUnwrappedObjects: objectValid]
        let dictionaryNotValid: Dictionary<String, NotValidMappableObjectModel> = [CodingKeys.notValidValue: objectNotValid]
        let dictionaryEmpty: Dictionary<String, ValidMappableObjectModel> = [:]
        let dictionaryNil: Dictionary<String, ValidMappableObjectModel>? = nil

        dictionaryObjectsImplicitlyUnwrappedOptional <~ map[CodingKeys.validDictionaryImplicitlyUnwrappedObjects]


        XCTAssertNotNil(map.JSON[CodingKeys.validDictionaryImplicitlyUnwrappedObjects])


        guardNegativeException {
            dictionaryNotValid >>> map[CodingKeys.notValidValue]
        }

        dictionaryEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        dictionaryNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testDictionaryMappableImplicitlyUnwrappedOptionalObjectsFromJSON() {
        let JSONString = JSONKeys.forDictionaryMappableImplicitlyUnwrappedOptionalObjects
        let JSONStringNotValid = JSONKeys.forDictionaryMappableObjectsNotValid
        let JSONStringEmpty = JSONKeys.forDictionaryMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, ValidMappableObjectModel>!

        dictionaryObjectsImplicitlyUnwrappedOptional <~ mapValid[CodingKeys.validDictionaryImplicitlyUnwrappedObjects]

        /// Valid Dictionary
        XCTAssertNotNil(dictionaryObjectsImplicitlyUnwrappedOptional[CodingKeys.validDictionaryImplicitlyUnwrappedObjects])

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
            dictionaryObjectsImplicitlyUnwrappedOptional <~ mapValid[CodingKeys.noSuchKey]
        }
    }
}

// ----------------------------------------------------------------------------
