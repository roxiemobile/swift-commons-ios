// ----------------------------------------------------------------------------
//
//  OperatorsTests.SetMappable.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Set of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testSetMappableObjectsToJSON() {
        let objectValid = SetValidMappableObjectModel()
        let objectNotValid = SetNotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let setObjects: Set<SetValidMappableObjectModel> = [objectValid]

        let setNotValid: Set<SetNotValidMappableObjectModel> = [objectNotValid]
        let setEmpty: Set<SetValidMappableObjectModel> = []
        let setNil: Set<SetValidMappableObjectModel>? = nil

        setObjects >>> map[CodingKeys.validSetObjects]

        XCTAssertNotNil(map.JSON[CodingKeys.validSetObjects])

        guardNegativeException {
            setNotValid >>> map[CodingKeys.notValidValue]
        }

        setEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        setNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testSetMappableObjectsFromJSON() {
        let JSONString = JSONKeys.forSetMappableObject
        let JSONStringNotValid = JSONKeys.forSetMappableObjectsNotValid
        let JSONStringEmpty = JSONKeys.forSetMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var setObjects: Set<SetValidMappableObjectModel> = []

        setObjects <~ mapValid[CodingKeys.validSetObjects]

        /// Valid Set
        XCTAssertNotNil(setObjects.first)

        /// Empty Set
        guardNegativeException {
            setObjects <~ mapEmpty[CodingKeys.emptyValue]
        }

        /// Not Valid Set
        guardNegativeException {
            setObjects <~ mapNotValid[CodingKeys.notValidValue]
        }

        /// Not Valid Key
        guardNegativeException {
            setObjects <~ mapValid[CodingKeys.noSuchKey]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Set of Mappable objects
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
// MARK: - Implicitly unwrapped Optional Set of Mappable objects
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
