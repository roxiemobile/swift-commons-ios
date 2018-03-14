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

        setObjects >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            setNotValid >>> map[JsonKeys.notValidValue]
        }

        setEmpty >>> map[JsonKeys.emptyValue]
        XCTAssertNotNil(map.JSON[JsonKeys.emptyValue])

        setNil >>> map[JsonKeys.nilValue]
        XCTAssertNil(map.JSON[JsonKeys.nilValue])
    }

    func testSetMappableObjectsFromJSON() {

        let JsonString = Constants.setMappableObject
        let JsonStringNotValid = Constants.setMappableObjectsNotValid
        let JsonStringEmpty = Constants.setMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var setObjects: Set<SetValidMappableObjectModel> = []

        setObjects <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(setObjects.first)

        // Negative
        guardNegativeException {
            setObjects <~ mapEmpty[JsonKeys.emptyValue]
        }

        guardNegativeException {
            setObjects <~ mapNotValid[JsonKeys.notValidValue]
        }

        guardNegativeException {
            setObjects <~ mapValid[JsonKeys.noSuchKey]
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

        setObjectsOptional >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            setNotValid >>> map[JsonKeys.notValidValue]
        }

        setEmpty >>> map[JsonKeys.emptyValue]
        XCTAssertNotNil(map.JSON[JsonKeys.emptyValue])

        setNil >>> map[JsonKeys.nilValue]
        XCTAssertNil(map.JSON[JsonKeys.nilValue])
    }

    func testSetMappableOptionalObjectsFromJSON() {

        let JsonString = Constants.setMappableObject
        let JsonStringNotValid = Constants.setMappableObjectsNotValid
        let JsonStringEmpty = Constants.setMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var setObjectsOptional: Set<SetValidMappableObjectModel>? = []

        setObjectsOptional <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(setObjectsOptional?.first)

        // Negative
        guardNegativeException {
            setObjectsOptional <~ mapEmpty[JsonKeys.emptyValue]
        }

        guardNegativeException {
            setObjectsOptional <~ mapNotValid[JsonKeys.notValidValue]
        }

        guardNegativeException {
            setObjectsOptional <~ mapValid[JsonKeys.noSuchKey]
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

        setObjectsImplicitlyUnwrappedOptional >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            setNotValid >>> map[JsonKeys.notValidValue]
        }

        setEmpty >>> map[JsonKeys.emptyValue]
        XCTAssertNotNil(map.JSON[JsonKeys.emptyValue])

        setNil >>> map[JsonKeys.nilValue]
        XCTAssertNil(map.JSON[JsonKeys.nilValue])
    }

    func testSetMappableImplicitlyUnwrappedOptionalObjectsFromJSON() {

        let JsonString = Constants.setMappableObject
        let JsonStringNotValid = Constants.setMappableObjectsNotValid
        let JsonStringEmpty = Constants.setMappableObjectsEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var setObjectsImplicitlyUnwrappedOptional: Set<SetValidMappableObjectModel>!

        setObjectsImplicitlyUnwrappedOptional <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(setObjectsImplicitlyUnwrappedOptional.first)

        // Negative
        guardNegativeException {
            setObjectsImplicitlyUnwrappedOptional <~ mapEmpty[JsonKeys.emptyValue]
        }

        guardNegativeException {
            setObjectsImplicitlyUnwrappedOptional <~ mapNotValid[JsonKeys.notValidValue]
        }

        guardNegativeException {
            setObjectsImplicitlyUnwrappedOptional <~ mapValid[JsonKeys.noSuchKey]
        }
    }
}

// ----------------------------------------------------------------------------
