// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.SetMappable.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Set of Mappable objects with transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformSetMappableObjectsToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let objectBasicType: Set<SetValidTransformMappableObjectModel> = [SetValidTransformMappableObjectModel()]

        objectBasicType >>> (map[CodingKeys.validObject], SetValidModelTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformSetMappableObjectsFromJSON() {

        let JsonString = JsonKeys.transformSetMappableObject
        let JsonStringNotValid = JsonKeys.transformSetMappableObjectNotValid
        let JsonStringEmpty = JsonKeys.transformSetMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: Set<SetValidTransformMappableObjectModel> = []

        objectBasicType <~ (mapValid[CodingKeys.validObject], SetValidModelTransform())

        // Positive
        XCTAssertNotNil(objectBasicType.first)

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[CodingKeys.validObject], SetValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.noSuchKey], SetValidModelTransform())
        }

        mapValid.JSON[CodingKeys.nilValue] = nil
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.nilValue], SetValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapEmpty[CodingKeys.validObject], SetValidModelTransform())
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Set of Mappable objects with transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformSetMappableOptionalObjectsToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let objectBasicType: Set<SetValidTransformMappableObjectModel>? = [SetValidTransformMappableObjectModel()]

        objectBasicType >>> (map[CodingKeys.validObject], SetValidModelTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformSetMappableOptionalObjectsFromJSON() {

        let JsonString = JsonKeys.transformSetMappableObject
        let JsonStringNotValid = JsonKeys.transformSetMappableObjectNotValid
        let JsonStringEmpty = JsonKeys.transformSetMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: Set<SetValidTransformMappableObjectModel>? = nil

        objectBasicType <~ (mapValid[CodingKeys.validObject], SetValidModelTransform())

        // Positive
        XCTAssertNotNil(objectBasicType?.first)

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[CodingKeys.validObject], SetValidModelTransform())
        }

        objectBasicType <~ (mapValid[CodingKeys.noSuchKey], SetValidModelTransform())
        XCTAssertNil(objectBasicType)

        mapValid.JSON[CodingKeys.nilValue] = nil
        objectBasicType <~ (mapValid[CodingKeys.nilValue], SetValidModelTransform())
        XCTAssertNil(objectBasicType)

        guardNegativeException {
            objectBasicType <~ (mapEmpty[CodingKeys.validObject], SetValidModelTransform())
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped Optional set of Mappable objects with transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformSetMappableImplicitlyUnwrappedOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        var objectBasicType: Set<SetValidTransformMappableObjectModel>! = [SetValidTransformMappableObjectModel()]

        objectBasicType <~ (map[CodingKeys.validObject], SetValidModelTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformSetMappableImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = JsonKeys.transformSetMappableObject
        let JsonStringNotValid = JsonKeys.transformSetMappableObjectNotValid
        let JsonStringEmpty = JsonKeys.transformSetMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: Set<SetValidTransformMappableObjectModel>! = []

        objectBasicType <~ (mapValid[CodingKeys.validObject], SetValidModelTransform())

        // Positive
        XCTAssertNotNil(objectBasicType.first)

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[CodingKeys.validObject], SetValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.noSuchKey], SetValidModelTransform())
        }

        mapValid.JSON[CodingKeys.nilValue] = nil
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.nilValue], SetValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapEmpty[CodingKeys.validObject], SetValidModelTransform())
        }
    }
}

// ----------------------------------------------------------------------------
