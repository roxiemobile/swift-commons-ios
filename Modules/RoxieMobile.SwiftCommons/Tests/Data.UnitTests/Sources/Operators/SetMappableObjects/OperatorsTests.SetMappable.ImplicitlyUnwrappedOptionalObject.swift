// ----------------------------------------------------------------------------
//
//  OperatorsTests.SetMappable.ImplicitlyUnwrappedOptionalObject.swift
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

    func testSetMappableImplicitlyUnwrappedOptionalObjectsToJSON() {
        let objectValid = SetValidMappableObjectModel()
        let objectNotValid = SetNotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let setObjectsImplicitlyUnwrappedOptional: Set<SetValidMappableObjectModel>! = [objectValid]
        let setNotValid: Set<SetNotValidMappableObjectModel> = [objectNotValid]
        let setEmpty: Set<SetValidMappableObjectModel> = []
        let setNil: Set<SetValidMappableObjectModel>? = nil

        setObjectsImplicitlyUnwrappedOptional >>> map[CodingKeys.validSetImplicitlyUnwrappedObjects]

        XCTAssertNotNil(map.JSON[CodingKeys.validSetImplicitlyUnwrappedObjects])

        guardNegativeException {
            setNotValid >>> map[CodingKeys.notValidValue]
        }

        setEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        setNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testSetMappableImplicitlyUnwrappedOptionalObjectsFromJSON() {
        let JSONString = JSONKeys.forSetMappableImplicitlyUnwrappedOptionalObjects
        let JSONStringNotValid = JSONKeys.forSetMappableObjectsNotValid
        let JSONStringEmpty = JSONKeys.forSetMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var setObjectsImplicitlyUnwrappedOptional: Set<SetValidMappableObjectModel>!

        setObjectsImplicitlyUnwrappedOptional <~ mapValid[CodingKeys.validSetImplicitlyUnwrappedObjects]

        /// Valid Set
        XCTAssertNotNil(setObjectsImplicitlyUnwrappedOptional.first)

        /// Empty Set
        guardNegativeException {
            setObjectsImplicitlyUnwrappedOptional <~ mapEmpty[CodingKeys.emptyValue]
        }

        /// Not Valid Set
        guardNegativeException {
            setObjectsImplicitlyUnwrappedOptional <~ mapNotValid[CodingKeys.notValidValue]
        }

        /// Not Valid Key
        guardNegativeException {
            setObjectsImplicitlyUnwrappedOptional <~ mapValid[CodingKeys.noSuchKey]
        }
    }
}

// ----------------------------------------------------------------------------
