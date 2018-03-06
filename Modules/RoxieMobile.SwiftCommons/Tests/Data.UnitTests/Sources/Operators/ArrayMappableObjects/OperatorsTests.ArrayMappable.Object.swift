// ----------------------------------------------------------------------------
//
//  OperatorsTests.ArrayMappable.Object.swift
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
