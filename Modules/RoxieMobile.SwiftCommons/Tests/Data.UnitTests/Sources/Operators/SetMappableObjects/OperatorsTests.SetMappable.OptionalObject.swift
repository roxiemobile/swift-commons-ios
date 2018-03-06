// ----------------------------------------------------------------------------
//
//  OperatorsTests.SetMappable.OptionalObject.swift
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

    func testSetMappableOptionalObjectsToJSON() {
        let objectValid = SetValidMappableObjectModel()
        let objectNotValid = SetNotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let setObjectsOptional: Set<SetValidMappableObjectModel>? = [objectValid]
        let setNotValid: Set<SetNotValidMappableObjectModel> = [objectNotValid]
        let setEmpty: Set<SetValidMappableObjectModel> = []
        let setNil: Set<SetValidMappableObjectModel>? = nil

        setObjectsOptional >>> map[CodingKeys.validSetOptionalObjects]


        XCTAssertNotNil(map.JSON[CodingKeys.validSetOptionalObjects])


        guardNegativeException {
            setNotValid >>> map[CodingKeys.notValidValue]
        }

        setEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        setNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testSetMappableOptionalObjectsFromJSON() {
        let JSONString = JSONKeys.forSetMappableOptionalObjects
        let JSONStringNotValid = JSONKeys.forSetMappableObjectsNotValid
        let JSONStringEmpty = JSONKeys.forSetMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var setObjectsOptional: Set<SetValidMappableObjectModel>? = []

        setObjectsOptional <~ mapValid[CodingKeys.validSetOptionalObjects]

        /// Valid Set
        XCTAssertNotNil(setObjectsOptional?.first)

        /// Empty Set
        guardNegativeException {
            setObjectsOptional <~ mapEmpty[CodingKeys.emptyValue]
        }

        /// Not Valid Set
        guardNegativeException {
            setObjectsOptional <~ mapNotValid[CodingKeys.notValidValue]
        }

        /// Not Valid Key
        guardNegativeException {
            setObjectsOptional <~ mapValid[CodingKeys.noSuchKey]
        }
    }
}

// ----------------------------------------------------------------------------
