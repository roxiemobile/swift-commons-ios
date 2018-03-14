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

        let dictionaryObjects: Dictionary<String, [ValidMappableObjectModel]> = [JsonKeys.validDictionaryArrayObjects: [objectValid]]
        let dictionaryNotValid: Dictionary<String, [NotValidMappableObjectModel]> = [JsonKeys.notValidValue: [objectNotValid]]
        let dictionaryEmpty: Dictionary<String, [ValidMappableObjectModel]> = [:]
        let dictionaryNil: Dictionary<String, [ValidMappableObjectModel]>? = nil

        dictionaryObjects >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            dictionaryNotValid >>> map[JsonKeys.notValidValue]
        }

        dictionaryEmpty >>> map[JsonKeys.emptyValue]
        XCTAssertNotNil(map.JSON[JsonKeys.emptyValue])

        dictionaryNil >>> map[JsonKeys.nilValue]
        XCTAssertNil(map.JSON[JsonKeys.nilValue])
    }

    func testDictionaryMappableArrayObjectsFromJSON() {

        let JsonString = Constants.dictionaryMappableArrayObjects
        let JsonStringNotValid = Constants.dictionaryMappableArrayObjectsNotValid
        let JsonStringEmpty = Constants.dictionaryMappableArrayObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var dictionaryObjects: Dictionary<String, [ValidMappableObjectModel]> = [:]

        dictionaryObjects <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(dictionaryObjects[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            dictionaryObjects <~ mapEmpty[JsonKeys.emptyValue]
        }

        guardNegativeException {
            dictionaryObjects <~ mapNotValid[JsonKeys.notValidValue]
        }

        guardNegativeException {
            dictionaryObjects <~ mapValid[JsonKeys.noSuchKey]
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

        let dictionaryObjectsOptional: Dictionary<String, [ValidMappableObjectModel]>? = [JsonKeys.validDictionaryArrayOptionalObjects: [objectValid]]
        let dictionaryNotValid: Dictionary<String, [NotValidMappableObjectModel]> = [JsonKeys.notValidValue: [objectNotValid]]
        let dictionaryEmpty: Dictionary<String, ValidMappableObjectModel> = [:]
        let dictionaryNil: Dictionary<String, ValidMappableObjectModel>? = nil

        dictionaryObjectsOptional >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            dictionaryNotValid >>> map[JsonKeys.notValidValue]
        }

        dictionaryEmpty >>> map[JsonKeys.emptyValue]
        XCTAssertNotNil(map.JSON[JsonKeys.emptyValue])

        dictionaryNil >>> map[JsonKeys.nilValue]
        XCTAssertNil(map.JSON[JsonKeys.nilValue])
    }

    func testDictionaryMappableOptionalArrayObjectsFromJSON() {

        let JsonString = Constants.dictionaryMappableArrayObjects
        let JsonStringNotValid = Constants.dictionaryMappableArrayObjectsNotValid
        let JsonStringEmpty = Constants.dictionaryMappableArrayObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var dictionaryObjectsOptional: Dictionary<String, [ValidMappableObjectModel]>? = nil

        dictionaryObjectsOptional <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(dictionaryObjectsOptional?[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            dictionaryObjectsOptional <~ mapEmpty[JsonKeys.emptyValue]
        }

        guardNegativeException {
            dictionaryObjectsOptional <~ mapNotValid[JsonKeys.notValidValue]
        }

        dictionaryObjectsOptional <~ mapValid[JsonKeys.noSuchKey]
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

        var dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, [ValidMappableObjectModel]>! = [JsonKeys.validDictionaryArrayImplicitlyUnwrappedObjects: [objectValid]]
        let dictionaryNotValid: Dictionary<String, [NotValidMappableObjectModel]> = [JsonKeys.notValidValue: [objectNotValid]]
        let dictionaryEmpty: Dictionary<String, [ValidMappableObjectModel]> = [:]
        let dictionaryNil: Dictionary<String, [ValidMappableObjectModel]>? = nil

        dictionaryObjectsImplicitlyUnwrappedOptional <~ map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            dictionaryNotValid >>> map[JsonKeys.notValidValue]
        }

        dictionaryEmpty >>> map[JsonKeys.emptyValue]
        XCTAssertNotNil(map.JSON[JsonKeys.emptyValue])

        dictionaryNil >>> map[JsonKeys.nilValue]
        XCTAssertNil(map.JSON[JsonKeys.nilValue])
    }

    func testDictionaryMappableImplicitlyUnwrappedOptionalArrayObjectsFromJSON() {

        let JsonString = Constants.dictionaryMappableArrayObjects
        let JsonStringNotValid = Constants.dictionaryMappableArrayObjectsNotValid
        let JsonStringEmpty = Constants.dictionaryMappableArrayObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, [ValidMappableObjectModel]>!

        dictionaryObjectsImplicitlyUnwrappedOptional <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(dictionaryObjectsImplicitlyUnwrappedOptional[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            dictionaryObjectsImplicitlyUnwrappedOptional <~ mapEmpty[JsonKeys.emptyValue]
        }

        guardNegativeException {
            dictionaryObjectsImplicitlyUnwrappedOptional <~ mapNotValid[JsonKeys.notValidValue]
        }

        guardNegativeException {
            dictionaryObjectsImplicitlyUnwrappedOptional <~ mapValid[JsonKeys.nilValue]
        }
    }
}

// ----------------------------------------------------------------------------
