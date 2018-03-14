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

        objectBasicType >>> (map[JsonKeys.validObject], SetValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformSetMappableObjectsFromJSON() {

        let JsonString = Constants.transformSetMappableObject
        let JsonStringNotValid = Constants.transformSetMappableObjectNotValid
        let JsonStringEmpty = Constants.transformSetMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: Set<SetValidTransformMappableObjectModel> = []

        objectBasicType <~ (mapValid[JsonKeys.validObject], SetValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(objectBasicType.first)

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[JsonKeys.validObject], SetValidModelTransform.shared)
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[JsonKeys.noSuchKey], SetValidModelTransform.shared)
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        guardNegativeException {
            objectBasicType <~ (mapValid[JsonKeys.nilValue], SetValidModelTransform.shared)
        }
        guardNegativeException {
            objectBasicType <~ (mapEmpty[JsonKeys.validObject], SetValidModelTransform.shared)
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

        objectBasicType >>> (map[JsonKeys.validObject], SetValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformSetMappableOptionalObjectsFromJSON() {

        let JsonString = Constants.transformSetMappableObject
        let JsonStringNotValid = Constants.transformSetMappableObjectNotValid
        let JsonStringEmpty = Constants.transformSetMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: Set<SetValidTransformMappableObjectModel>? = nil

        objectBasicType <~ (mapValid[JsonKeys.validObject], SetValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(objectBasicType?.first)

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[JsonKeys.validObject], SetValidModelTransform.shared)
        }

        objectBasicType <~ (mapValid[JsonKeys.noSuchKey], SetValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        mapValid.JSON[JsonKeys.nilValue] = nil
        objectBasicType <~ (mapValid[JsonKeys.nilValue], SetValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        guardNegativeException {
            objectBasicType <~ (mapEmpty[JsonKeys.validObject], SetValidModelTransform.shared)
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

        objectBasicType <~ (map[JsonKeys.validObject], SetValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformSetMappableImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = Constants.transformSetMappableObject
        let JsonStringNotValid = Constants.transformSetMappableObjectNotValid
        let JsonStringEmpty = Constants.transformSetMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: Set<SetValidTransformMappableObjectModel>! = []

        objectBasicType <~ (mapValid[JsonKeys.validObject], SetValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(objectBasicType.first)

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[JsonKeys.validObject], SetValidModelTransform.shared)
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[JsonKeys.noSuchKey], SetValidModelTransform.shared)
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        guardNegativeException {
            objectBasicType <~ (mapValid[JsonKeys.nilValue], SetValidModelTransform.shared)
        }
        guardNegativeException {
            objectBasicType <~ (mapEmpty[JsonKeys.validObject], SetValidModelTransform.shared)
        }
    }
}

// ----------------------------------------------------------------------------
