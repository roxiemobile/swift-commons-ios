// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.MappableObjects.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Object conforming to Mappable that have transforms
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformMappableObjectsToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let objectBasicType: ValidTransformMappableObjectModel = ValidTransformMappableObjectModel()

        objectBasicType >>> (map[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformMappableObjectsFromJSON() {

        let JsonString = Constants.transformMappableObjects
        let JsonStringNotValid = Constants.transformInvalidMappableObjects
        let JsonStringEmpty = Constants.transformEmptyMappableObjects

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: ValidTransformMappableObjectModel = ValidTransformMappableObjectModel()

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType.x, Int.max)

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
// MARK: - Optional Mappable objects that have transforms
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformMappableOptionalObjectsToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let objectBasicType: ValidTransformMappableObjectModel? = ValidTransformMappableObjectModel()

        objectBasicType >>> (map[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformMappableOptionalObjectsFromJSON() {

        let JsonString = Constants.transformMappableObjects
        let JsonStringNotValid = Constants.transformInvalidMappableObjects
        let JsonStringEmpty = Constants.transformEmptyMappableObjects

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: ValidTransformMappableObjectModel? = ValidTransformMappableObjectModel()

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType!.x, Int.max)

        // Negative
        objectBasicType <~ (mapNotValid[JsonKeys.invalidValue], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapValid[JsonKeys.noSuchKey], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        mapValid.JSON[JsonKeys.nilValue] = nil
        objectBasicType <~ (mapValid[JsonKeys.nilValue], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        assertExceptionNotNil {
            objectBasicType <~ (mapEmpty[JsonKeys.emptyValue], ValidModelTransform.shared)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional Mappable objects that have transforms
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformMappableImplicitlyUnwrappedOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        var objectBasicType: ValidTransformMappableObjectModel! = ValidTransformMappableObjectModel()

        objectBasicType <~ (map[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformMappableImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = Constants.transformMappableObjects
        let JsonStringNotValid = Constants.transformInvalidMappableObjects
        let JsonStringEmpty = Constants.transformEmptyMappableObjects

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: ValidTransformMappableObjectModel! = ValidTransformMappableObjectModel()

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType.x, Int.max)

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
