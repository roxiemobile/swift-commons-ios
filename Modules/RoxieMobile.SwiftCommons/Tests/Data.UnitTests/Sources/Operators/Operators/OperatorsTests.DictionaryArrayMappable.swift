// ----------------------------------------------------------------------------
//
//  OperatorsTests.DictionaryArrayMappable.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
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

        dictionaryObjects >>> map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            dictionaryNotValid >>> map[CodingKeys.notValidValue]
        }

        dictionaryEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        dictionaryNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testDictionaryMappableArrayObjectsFromJSON() {

        let JsonString = JsonKeys.dictionaryMappableArrayObjects
        let JsonStringNotValid = JsonKeys.dictionaryMappableArrayObjectsNotValid
        let JsonStringEmpty = JsonKeys.dictionaryMappableArrayObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var dictionaryObjects: Dictionary<String, [ValidMappableObjectModel]> = [:]

        dictionaryObjects <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(dictionaryObjects[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            dictionaryObjects <~ mapEmpty[CodingKeys.emptyValue]
        }

        guardNegativeException {
            dictionaryObjects <~ mapNotValid[CodingKeys.notValidValue]
        }

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

        dictionaryObjectsOptional >>> map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            dictionaryNotValid >>> map[CodingKeys.notValidValue]
        }

        dictionaryEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        dictionaryNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testDictionaryMappableOptionalArrayObjectsFromJSON() {

        let JsonString = JsonKeys.dictionaryMappableArrayObjects
        let JsonStringNotValid = JsonKeys.dictionaryMappableArrayObjectsNotValid
        let JsonStringEmpty = JsonKeys.dictionaryMappableArrayObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var dictionaryObjectsOptional: Dictionary<String, [ValidMappableObjectModel]>? = nil

        dictionaryObjectsOptional <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(dictionaryObjectsOptional?[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            dictionaryObjectsOptional <~ mapEmpty[CodingKeys.emptyValue]
        }

        guardNegativeException {
            dictionaryObjectsOptional <~ mapNotValid[CodingKeys.notValidValue]
        }

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

        dictionaryObjectsImplicitlyUnwrappedOptional <~ map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            dictionaryNotValid >>> map[CodingKeys.notValidValue]
        }

        dictionaryEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        dictionaryNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testDictionaryMappableImplicitlyUnwrappedOptionalArrayObjectsFromJSON() {

        let JsonString = JsonKeys.dictionaryMappableArrayObjects
        let JsonStringNotValid = JsonKeys.dictionaryMappableArrayObjectsNotValid
        let JsonStringEmpty = JsonKeys.dictionaryMappableArrayObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, [ValidMappableObjectModel]>!

        dictionaryObjectsImplicitlyUnwrappedOptional <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(dictionaryObjectsImplicitlyUnwrappedOptional[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            dictionaryObjectsImplicitlyUnwrappedOptional <~ mapEmpty[CodingKeys.emptyValue]
        }

        guardNegativeException {
            dictionaryObjectsImplicitlyUnwrappedOptional <~ mapNotValid[CodingKeys.notValidValue]
        }

        guardNegativeException {
            dictionaryObjectsImplicitlyUnwrappedOptional <~ mapValid[CodingKeys.nilValue]
        }
    }
}

// ----------------------------------------------------------------------------
