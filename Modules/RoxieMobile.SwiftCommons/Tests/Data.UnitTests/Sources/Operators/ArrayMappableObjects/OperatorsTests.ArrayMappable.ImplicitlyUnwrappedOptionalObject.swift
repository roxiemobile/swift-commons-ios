// ----------------------------------------------------------------------------
//
//  OperatorsTests.ArrayMappable.ImplicitlyUnwrappedOptionalObject.swift
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
