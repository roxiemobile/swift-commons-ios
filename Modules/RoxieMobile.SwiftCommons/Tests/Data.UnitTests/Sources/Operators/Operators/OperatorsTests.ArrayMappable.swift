// ----------------------------------------------------------------------------
//
//  OperatorsTests.ArrayMappable.swift
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

        arrayObjects >>> map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            arrayNotValid >>> map[CodingKeys.notValidValue]
        }

        arrayEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        arrayNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testArrayMappableObjectsFromJSON() {

        let JsonString = JsonKeys.arrayMappableObjects
        let JsonStringNotValid = JsonKeys.arrayMappableObjectsNotValid
        let JsonStringEmpty = JsonKeys.arrayMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var arrayObjects: Array<ValidMappableObjectModel> = []

        arrayObjects <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(arrayObjects.first)

        // Negative
        guardNegativeException {
            arrayObjects <~ mapEmpty[CodingKeys.emptyValue]
        }

        guardNegativeException {
            arrayObjects <~ mapNotValid[CodingKeys.notValidValue]
        }

        guardNegativeException {
            arrayObjects <~ mapValid[CodingKeys.noSuchKey]
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

        arrayObjectsOptional >>> map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            arrayNotValid >>> map[CodingKeys.notValidValue]
        }

        arrayEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        arrayNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testArrayMappableOptionalObjectsFromJSON() {

        let JsonString = JsonKeys.arrayMappableObjects
        let JsonStringNotValid = JsonKeys.arrayMappableObjectsNotValid
        let JsonStringEmpty = JsonKeys.arrayMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var arrayObjectsOptional: Array<ValidMappableObjectModel>? = nil

        arrayObjectsOptional <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(arrayObjectsOptional?.first)

        // Negative
        guardNegativeException {
            arrayObjectsOptional <~ mapEmpty[CodingKeys.emptyValue]
        }

        guardNegativeException {
            arrayObjectsOptional <~ mapNotValid[CodingKeys.notValidValue]
        }

        arrayObjectsOptional <~ mapValid[CodingKeys.noSuchKey]
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

        arrayObjectsImplicitlyUnwrappedOptional >>> map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            arrayNotValid >>> map[CodingKeys.notValidValue]
        }

        arrayEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        arrayNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testArrayMappableImplicitlyUnwrappedOptionalFromJSON() {

        let JsonString = JsonKeys.arrayMappableObjects
        let JsonStringNotValid = JsonKeys.arrayMappableObjectsNotValid
        let JsonStringEmpty = JsonKeys.arrayMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var arrayObjectsImplicitlyUnwrappedOptional: Array<ValidMappableObjectModel>!

        arrayObjectsImplicitlyUnwrappedOptional <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(arrayObjectsImplicitlyUnwrappedOptional.first)

        // Negative
        guardNegativeException {
            arrayObjectsImplicitlyUnwrappedOptional <~ mapEmpty[CodingKeys.emptyValue]
        }

        guardNegativeException {
            arrayObjectsImplicitlyUnwrappedOptional <~ mapNotValid[CodingKeys.notValidValue]
        }

        guardNegativeException {
            arrayObjectsImplicitlyUnwrappedOptional <~ mapValid[CodingKeys.noSuchKey]
        }
    }
}

// ----------------------------------------------------------------------------
