// ----------------------------------------------------------------------------
//
//  OperatorsTests.SetMappable.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
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

        setObjects >>> map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            setNotValid >>> map[CodingKeys.notValidValue]
        }

        setEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        setNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testSetMappableObjectsFromJSON() {

        let JsonString = JsonKeys.setMappableObject
        let JsonStringNotValid = JsonKeys.setMappableObjectsNotValid
        let JsonStringEmpty = JsonKeys.setMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var setObjects: Set<SetValidMappableObjectModel> = []

        setObjects <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(setObjects.first)

        // Negative
        guardNegativeException {
            setObjects <~ mapEmpty[CodingKeys.emptyValue]
        }

        guardNegativeException {
            setObjects <~ mapNotValid[CodingKeys.notValidValue]
        }

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

    func testSetMappableOptionalObjectsToJSON() {

        let objectValid = SetValidMappableObjectModel()
        let objectNotValid = SetNotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let setObjectsOptional: Set<SetValidMappableObjectModel>? = [objectValid]
        let setNotValid: Set<SetNotValidMappableObjectModel> = [objectNotValid]
        let setEmpty: Set<SetValidMappableObjectModel> = []
        let setNil: Set<SetValidMappableObjectModel>? = nil

        setObjectsOptional >>> map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            setNotValid >>> map[CodingKeys.notValidValue]
        }

        setEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        setNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testSetMappableOptionalObjectsFromJSON() {

        let JsonString = JsonKeys.setMappableObject
        let JsonStringNotValid = JsonKeys.setMappableObjectsNotValid
        let JsonStringEmpty = JsonKeys.setMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var setObjectsOptional: Set<SetValidMappableObjectModel>? = []

        setObjectsOptional <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(setObjectsOptional?.first)

        // Negative
        guardNegativeException {
            setObjectsOptional <~ mapEmpty[CodingKeys.emptyValue]
        }

        guardNegativeException {
            setObjectsOptional <~ mapNotValid[CodingKeys.notValidValue]
        }

        guardNegativeException {
            setObjectsOptional <~ mapValid[CodingKeys.noSuchKey]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped Optional Set of Mappable objects
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

        setObjectsImplicitlyUnwrappedOptional >>> map[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            setNotValid >>> map[CodingKeys.notValidValue]
        }

        setEmpty >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        setNil >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }

    func testSetMappableImplicitlyUnwrappedOptionalObjectsFromJSON() {

        let JsonString = JsonKeys.setMappableObject
        let JsonStringNotValid = JsonKeys.setMappableObjectsNotValid
        let JsonStringEmpty = JsonKeys.setMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var setObjectsImplicitlyUnwrappedOptional: Set<SetValidMappableObjectModel>!

        setObjectsImplicitlyUnwrappedOptional <~ mapValid[CodingKeys.validObject]

        // Positive
        XCTAssertNotNil(setObjectsImplicitlyUnwrappedOptional.first)

        // Negative
        guardNegativeException {
            setObjectsImplicitlyUnwrappedOptional <~ mapEmpty[CodingKeys.emptyValue]
        }

        guardNegativeException {
            setObjectsImplicitlyUnwrappedOptional <~ mapNotValid[CodingKeys.notValidValue]
        }

        guardNegativeException {
            setObjectsImplicitlyUnwrappedOptional <~ mapValid[CodingKeys.noSuchKey]
        }
    }
}

// ----------------------------------------------------------------------------
