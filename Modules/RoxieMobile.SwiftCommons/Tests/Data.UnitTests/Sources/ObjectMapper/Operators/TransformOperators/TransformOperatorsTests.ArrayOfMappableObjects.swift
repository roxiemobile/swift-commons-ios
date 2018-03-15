// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.ArrayOfMappableObjects.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Array of Mappable objects
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformArrayMappableObjectsToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let objectBasicType: [ValidTransformMappableObjectModel] = [ValidTransformMappableObjectModel()]

        objectBasicType >>> (map[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformArrayMappableObjectsFromJSON() {

        let JsonString = Constants.transformArrayOfMappableObjects
        let JsonStringNotValid = Constants.transformArrayOfInvalidMappableObject
        let JsonStringEmpty = Constants.transformEmptyArrayOfMappableObjects

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: [ValidTransformMappableObjectModel] = []

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType[0].x, Int.max)

        // Negative
        assertExceptionNotNil {
            objectBasicType <~ (mapNotValid[JsonKeys.invalidValue], ValidModelTransform.shared)
        }
        assertExceptionNotNil {
            objectBasicType <~ (mapValid[JsonKeys.noSuchKey], ValidModelTransform.shared)
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        assertExceptionNotNil {
            objectBasicType <~ (mapValid[JsonKeys.nilValue], ValidModelTransform.shared)
        }
        assertExceptionNotNil {
            objectBasicType <~ (mapEmpty[JsonKeys.emptyValue], ValidModelTransform.shared)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional array of Mappable objects
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformArrayMappableOptionalObjectsToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let objectBasicType: [ValidTransformMappableObjectModel]? = [ValidTransformMappableObjectModel()]

        objectBasicType >>> (map[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformArrayMappableOptionalObjectsFromJSON() {

        let JsonString = Constants.transformArrayOfMappableObjects
        let JsonStringNotValid = Constants.transformArrayOfInvalidMappableObject
        let JsonStringEmpty = Constants.transformEmptyArrayOfMappableObjects

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: [ValidTransformMappableObjectModel]? = nil

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType?[0].x, Int.max)

        // Negative
        objectBasicType <~ (mapNotValid[JsonKeys.invalidValue], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapValid[JsonKeys.noSuchKey], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        mapValid.JSON[JsonKeys.nilValue] = nil
        objectBasicType <~ (mapValid[JsonKeys.nilValue], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapEmpty[JsonKeys.emptyValue], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped Optional array of Mappable objects
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformArrayMappableImplicitlyUnwrappedOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        var objectBasicType: [ValidTransformMappableObjectModel]! = [ValidTransformMappableObjectModel()]

        objectBasicType <~ (map[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformArrayMappableImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = Constants.transformArrayOfMappableObjects
        let JsonStringNotValid = Constants.transformArrayOfInvalidMappableObject
        let JsonStringEmpty = Constants.transformEmptyArrayOfMappableObjects

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: [ValidTransformMappableObjectModel]! = []

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType[0].x, Int.max)

        // Negative
        assertExceptionNotNil {
            objectBasicType <~ (mapNotValid[JsonKeys.invalidValue], ValidModelTransform.shared)
        }
        assertExceptionNotNil {
            objectBasicType <~ (mapValid[JsonKeys.noSuchKey], ValidModelTransform.shared)
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        assertExceptionNotNil {
            objectBasicType <~ (mapValid[JsonKeys.nilValue], ValidModelTransform.shared)
        }
        assertExceptionNotNil {
            objectBasicType <~ (mapEmpty[JsonKeys.emptyValue], ValidModelTransform.shared)
        }
    }
}

// ----------------------------------------------------------------------------
