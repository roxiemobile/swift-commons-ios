// ----------------------------------------------------------------------------
//
//  OperatorsTests.ArrayOfMappableObjects.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Array of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testArrayMappableObjectsToJSON() {

        let objectValid = ValidMappableObjectModel()
        let objectNotValid = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let arrayObjects: Array<ValidMappableObjectModel> = [objectValid]
        let arrayNotValid: Array<NotValidMappableObjectModel> = [objectNotValid]
        let arrayEmpty: Array<ValidMappableObjectModel> = []
        let arrayNil: Array<ValidMappableObjectModel>? = nil

        arrayObjects >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            arrayNotValid >>> map[JsonKeys.invalidValue]
        }

        arrayEmpty >>> map[JsonKeys.emptyValue]
        XCTAssertNotNil(map.JSON[JsonKeys.emptyValue])

        arrayNil >>> map[JsonKeys.nilValue]
        XCTAssertNil(map.JSON[JsonKeys.nilValue])
    }

    func testArrayMappableObjectsFromJSON() {

        let JsonString = Constants.arrayOfMappableObjects
        let JsonStringNotValid = Constants.arrayOfInvalidMappableObjects
        let JsonStringEmpty = Constants.emptyArrayOfMappableObjects

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var arrayObjects: Array<ValidMappableObjectModel> = []

        arrayObjects <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(arrayObjects.first)

        // Negative
        assertExceptionNotNil {
            arrayObjects <~ mapEmpty[JsonKeys.emptyValue]
        }

        assertExceptionNotNil {
            arrayObjects <~ mapNotValid[JsonKeys.invalidValue]
        }

        assertExceptionNotNil {
            arrayObjects <~ mapValid[JsonKeys.noSuchKey]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional array of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testArrayMappableOptionalObjectsToJSON() {

        let objectValid = ValidMappableObjectModel()
        let objectNotValid = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let arrayObjectsOptional: Array<ValidMappableObjectModel>? = [objectValid]
        let arrayNotValid: Array<NotValidMappableObjectModel> = [objectNotValid]
        let arrayEmpty: Array<ValidMappableObjectModel> = []
        let arrayNil: Array<ValidMappableObjectModel>? = nil

        arrayObjectsOptional >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            arrayNotValid >>> map[JsonKeys.invalidValue]
        }

        arrayEmpty >>> map[JsonKeys.emptyValue]
        XCTAssertNotNil(map.JSON[JsonKeys.emptyValue])

        arrayNil >>> map[JsonKeys.nilValue]
        XCTAssertNil(map.JSON[JsonKeys.nilValue])
    }

    func testArrayMappableOptionalObjectsFromJSON() {

        let JsonString = Constants.arrayOfMappableObjects
        let JsonStringNotValid = Constants.arrayOfInvalidMappableObjects
        let JsonStringEmpty = Constants.emptyArrayOfMappableObjects

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var arrayObjectsOptional: Array<ValidMappableObjectModel>? = nil

        arrayObjectsOptional <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(arrayObjectsOptional?.first)

        // Negative
        assertExceptionNotNil {
            arrayObjectsOptional <~ mapEmpty[JsonKeys.emptyValue]
        }

        assertExceptionNotNil {
            arrayObjectsOptional <~ mapNotValid[JsonKeys.invalidValue]
        }

        arrayObjectsOptional <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertNil(arrayObjectsOptional)
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped Optional array of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testArrayMappableImplicitlyUnwrappedOptionalObjectsToJSON() {

        let objectValid = ValidMappableObjectModel()
        let objectNotValid = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let arrayObjectsImplicitlyUnwrappedOptional: Array<ValidMappableObjectModel>! = [objectValid]
        let arrayNotValid: Array<NotValidMappableObjectModel> = [objectNotValid]
        let arrayEmpty: Array<ValidMappableObjectModel> = []
        let arrayNil: Array<ValidMappableObjectModel>? = nil

        arrayObjectsImplicitlyUnwrappedOptional >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            arrayNotValid >>> map[JsonKeys.invalidValue]
        }

        arrayEmpty >>> map[JsonKeys.emptyValue]
        XCTAssertNotNil(map.JSON[JsonKeys.emptyValue])

        arrayNil >>> map[JsonKeys.nilValue]
        XCTAssertNil(map.JSON[JsonKeys.nilValue])
    }

    func testArrayMappableImplicitlyUnwrappedOptionalFromJSON() {

        let JsonString = Constants.arrayOfMappableObjects
        let JsonStringNotValid = Constants.arrayOfInvalidMappableObjects
        let JsonStringEmpty = Constants.emptyArrayOfMappableObjects

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var arrayObjectsImplicitlyUnwrappedOptional: Array<ValidMappableObjectModel>!

        arrayObjectsImplicitlyUnwrappedOptional <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(arrayObjectsImplicitlyUnwrappedOptional.first)

        // Negative
        assertExceptionNotNil {
            arrayObjectsImplicitlyUnwrappedOptional <~ mapEmpty[JsonKeys.emptyValue]
        }

        assertExceptionNotNil {
            arrayObjectsImplicitlyUnwrappedOptional <~ mapNotValid[JsonKeys.invalidValue]
        }

        assertExceptionNotNil {
            arrayObjectsImplicitlyUnwrappedOptional <~ mapValid[JsonKeys.noSuchKey]
        }
    }
}

// ----------------------------------------------------------------------------
