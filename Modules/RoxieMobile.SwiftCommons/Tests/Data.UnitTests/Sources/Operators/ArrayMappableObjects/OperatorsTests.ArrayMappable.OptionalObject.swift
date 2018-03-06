// ----------------------------------------------------------------------------
//
//  OperatorsTests.ArrayMappable.OptionalObject.swift
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
