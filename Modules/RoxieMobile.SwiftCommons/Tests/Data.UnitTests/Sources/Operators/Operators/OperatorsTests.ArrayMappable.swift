// ----------------------------------------------------------------------------
//
//  OperatorsTests.ArrayMappable.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
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

        arrayObjects >>> map[CodingKeys.validArrayObjects]

        XCTAssertNotNil(map.JSON[CodingKeys.validArrayObjects])

        guardNegativeException {
            arrayNotValid >>> map[CodingKeys.notValidValue]
        }

        arrayEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        arrayNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testArrayMappableObjectsFromJSON() {
        let JSONString = JSONKeys.forArrayMappableObjects
        let JSONStringNotValid = JSONKeys.forArrayMappableObjectsNotValid
        let JSONStringEmpty = JSONKeys.forArrayMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var arrayObjects: Array<ValidMappableObjectModel> = []

        arrayObjects <~ mapValid[CodingKeys.validArrayObjects]

        /// Valid Array
        XCTAssertNotNil(arrayObjects.first)

        /// Empty Array
        guardNegativeException {
            arrayObjects <~ mapEmpty[CodingKeys.emptyValue]
        }

        /// Not Valid Array
        guardNegativeException {
            arrayObjects <~ mapNotValid[CodingKeys.notValidValue]
        }

        /// Not Valid Key
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

        arrayObjectsOptional >>> map[CodingKeys.validArrayOptionalObjects]

        XCTAssertNotNil(map.JSON[CodingKeys.validArrayOptionalObjects])

        guardNegativeException {
            arrayNotValid >>> map[CodingKeys.notValidValue]
        }

        arrayEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        arrayNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testArrayMappableOptionalObjectsFromJSON() {
        let JSONString = JSONKeys.forArrayMappableOptionalObjects
        let JSONStringNotValid = JSONKeys.forArrayMappableObjectsNotValid
        let JSONStringEmpty = JSONKeys.forArrayMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var arrayObjectsOptional: Array<ValidMappableObjectModel>? = nil

        arrayObjectsOptional <~ mapValid[CodingKeys.validArrayOptionalObjects]

        /// Valid Array
        XCTAssertNotNil(arrayObjectsOptional?.first)

        /// Empty Array
        guardNegativeException {
            arrayObjectsOptional <~ mapEmpty[CodingKeys.emptyValue]
        }

        /// Not Valid Array
        guardNegativeException {
            arrayObjectsOptional <~ mapNotValid[CodingKeys.notValidValue]
        }

        /// Not Valid Key
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

        arrayObjectsImplicitlyUnwrappedOptional >>> map[CodingKeys.validArrayImplicitlyUnwrappedObjects]


        XCTAssertNotNil(map.JSON[CodingKeys.validArrayImplicitlyUnwrappedObjects])


        guardNegativeException {
            arrayNotValid >>> map[CodingKeys.notValidValue]
        }

        arrayEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        arrayNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testArrayMappableImplicitlyUnwrappedOptionalFromJSON() {
        let JSONString = JSONKeys.forArrayMappableImplicitlyUnwrappedOptionalObjects
        let JSONStringNotValid = JSONKeys.forArrayMappableObjectsNotValid
        let JSONStringEmpty = JSONKeys.forArrayMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var arrayObjectsImplicitlyUnwrappedOptional: Array<ValidMappableObjectModel>!

        arrayObjectsImplicitlyUnwrappedOptional <~ mapValid[CodingKeys.validArrayImplicitlyUnwrappedObjects]

        /// Valid Array
        XCTAssertNotNil(arrayObjectsImplicitlyUnwrappedOptional.first)

        /// Empty Array
        guardNegativeException {
            arrayObjectsImplicitlyUnwrappedOptional <~ mapEmpty[CodingKeys.emptyValue]
        }

        /// Not Valid Array
        guardNegativeException {
            arrayObjectsImplicitlyUnwrappedOptional <~ mapNotValid[CodingKeys.notValidValue]
        }

        /// Not Valid Key
        guardNegativeException {
            arrayObjectsImplicitlyUnwrappedOptional <~ mapValid[CodingKeys.noSuchKey]
        }
    }
}

// ----------------------------------------------------------------------------
