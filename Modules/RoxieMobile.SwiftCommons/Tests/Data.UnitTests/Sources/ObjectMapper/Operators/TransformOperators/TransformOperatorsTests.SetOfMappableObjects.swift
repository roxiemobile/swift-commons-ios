// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.SetOfMappableObjects.swift
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
        let objectBasicType: Set<ValidTransformMappableObjectModel> = [ValidTransformMappableObjectModel()]

        objectBasicType >>> (map[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformSetMappableObjectsFromJSON() {

        let JsonString = Constants.transformSetOfMappableObjects
        let JsonStringNotValid = Constants.transformSetOfInvalidMappableObjects
        let JsonStringEmpty = Constants.transformEmptySetOfMappableObjects

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: Set<ValidTransformMappableObjectModel> = []

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(objectBasicType.first)

        // Negative
        assertExceptionNotNil {
            objectBasicType <~ (mapNotValid[JsonKeys.validObject], ValidModelTransform.shared)
        }
        assertExceptionNotNil {
            objectBasicType <~ (mapValid[JsonKeys.noSuchKey], ValidModelTransform.shared)
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        assertExceptionNotNil {
            objectBasicType <~ (mapValid[JsonKeys.nilValue], ValidModelTransform.shared)
        }
        assertExceptionNotNil {
            objectBasicType <~ (mapEmpty[JsonKeys.validObject], ValidModelTransform.shared)
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
        let objectBasicType: Set<ValidTransformMappableObjectModel>? = [ValidTransformMappableObjectModel()]

        objectBasicType >>> (map[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformSetMappableOptionalObjectsFromJSON() {

        let JsonString = Constants.transformSetOfMappableObjects
        let JsonStringNotValid = Constants.transformSetOfInvalidMappableObjects
        let JsonStringEmpty = Constants.transformEmptySetOfMappableObjects

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: Set<ValidTransformMappableObjectModel>? = nil

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(objectBasicType?.first)

        // Negative
        assertExceptionNotNil {
            objectBasicType <~ (mapNotValid[JsonKeys.validObject], ValidModelTransform.shared)
        }

        objectBasicType <~ (mapValid[JsonKeys.noSuchKey], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        mapValid.JSON[JsonKeys.nilValue] = nil
        objectBasicType <~ (mapValid[JsonKeys.nilValue], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        assertExceptionNotNil {
            objectBasicType <~ (mapEmpty[JsonKeys.validObject], ValidModelTransform.shared)
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
        var objectBasicType: Set<ValidTransformMappableObjectModel>! = [ValidTransformMappableObjectModel()]

        objectBasicType <~ (map[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformSetMappableImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = Constants.transformSetOfMappableObjects
        let JsonStringNotValid = Constants.transformSetOfInvalidMappableObjects
        let JsonStringEmpty = Constants.transformEmptySetOfMappableObjects

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: Set<ValidTransformMappableObjectModel>! = []

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(objectBasicType.first)

        // Negative
        assertExceptionNotNil {
            objectBasicType <~ (mapNotValid[JsonKeys.validObject], ValidModelTransform.shared)
        }
        assertExceptionNotNil {
            objectBasicType <~ (mapValid[JsonKeys.noSuchKey], ValidModelTransform.shared)
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        assertExceptionNotNil {
            objectBasicType <~ (mapValid[JsonKeys.nilValue], ValidModelTransform.shared)
        }
        assertExceptionNotNil {
            objectBasicType <~ (mapEmpty[JsonKeys.validObject], ValidModelTransform.shared)
        }
    }
}

// ----------------------------------------------------------------------------
