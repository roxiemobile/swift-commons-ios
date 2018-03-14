// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.Mappable.swift
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
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformMappableObjectsFromJSON() {

        let JsonString = Constants.transformMappableObject
        let JsonStringNotValid = Constants.transformMappableObjectNotValid
        let JsonStringEmpty = Constants.transformMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: ValidTransformMappableObjectModel = ValidTransformMappableObjectModel()

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType.x, Int(Constants.maxInt))

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[JsonKeys.notValidValue], ValidModelTransform.shared)
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[JsonKeys.noSuchKey], ValidModelTransform.shared)
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        guardNegativeException {
            objectBasicType <~ (mapValid[JsonKeys.nilValue], ValidModelTransform.shared)
        }
        guardNegativeException {
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
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformMappableOptionalObjectsFromJSON() {

        let JsonString = Constants.transformMappableObject
        let JsonStringNotValid = Constants.transformMappableObjectNotValid
        let JsonStringEmpty = Constants.transformMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: ValidTransformMappableObjectModel? = ValidTransformMappableObjectModel()

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType!.x, Int(Constants.maxInt))

        // Negative
        objectBasicType <~ (mapNotValid[JsonKeys.notValidValue], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapValid[JsonKeys.noSuchKey], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        mapValid.JSON[JsonKeys.nilValue] = nil
        objectBasicType <~ (mapValid[JsonKeys.nilValue], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        guardNegativeException {
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
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformMappableImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = Constants.transformMappableObject
        let JsonStringNotValid = Constants.transformMappableObjectNotValid
        let JsonStringEmpty = Constants.transformMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: ValidTransformMappableObjectModel! = ValidTransformMappableObjectModel()

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType.x, Int(Constants.maxInt))

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[JsonKeys.notValidValue], ValidModelTransform.shared)
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[JsonKeys.noSuchKey], ValidModelTransform.shared)
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        guardNegativeException {
            objectBasicType <~ (mapValid[JsonKeys.nilValue], ValidModelTransform.shared)
        }
        guardNegativeException {
            objectBasicType <~ (mapEmpty[JsonKeys.emptyValue], ValidModelTransform.shared)
        }
    }
}

// ----------------------------------------------------------------------------
