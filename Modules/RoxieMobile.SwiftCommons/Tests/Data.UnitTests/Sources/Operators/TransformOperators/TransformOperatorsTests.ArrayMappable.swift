// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.ArrayMappable.swift
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

        objectBasicType >>> (map[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformArrayMappableObjectsFromJSON() {

        let JsonString = JsonKeys.transformArrayMappableObject
        let JsonStringNotValid = JsonKeys.transformArrayMappableObjectNotValid
        let JsonStringEmpty = JsonKeys.transformArrayMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: [ValidTransformMappableObjectModel] = []

        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertEqual(objectBasicType[0].x, Int(Constants.maxInt))

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[CodingKeys.notValidValue], ValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.noSuchKey], ValidModelTransform())
        }

        mapValid.JSON[CodingKeys.nilValue] = nil
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.nilValue], ValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapEmpty[CodingKeys.emptyValue], ValidModelTransform())
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

        objectBasicType >>> (map[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformArrayMappableOptionalObjectsFromJSON() {

        let JsonString = JsonKeys.transformArrayMappableObject
        let JsonStringNotValid = JsonKeys.transformArrayMappableObjectNotValid
        let JsonStringEmpty = JsonKeys.transformArrayMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: [ValidTransformMappableObjectModel]? = nil

        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertEqual(objectBasicType?[0].x, Int(Constants.maxInt))

        // Negative
        objectBasicType <~ (mapNotValid[CodingKeys.notValidValue], ValidModelTransform())
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapValid[CodingKeys.noSuchKey], ValidModelTransform())
        XCTAssertNil(objectBasicType)

        mapValid.JSON[CodingKeys.nilValue] = nil
        objectBasicType <~ (mapValid[CodingKeys.nilValue], ValidModelTransform())
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapEmpty[CodingKeys.emptyValue], ValidModelTransform())
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

        objectBasicType <~ (map[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformArrayMappableImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = JsonKeys.transformArrayMappableObject
        let JsonStringNotValid = JsonKeys.transformArrayMappableObjectNotValid
        let JsonStringEmpty = JsonKeys.transformArrayMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: [ValidTransformMappableObjectModel]! = []

        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertEqual(objectBasicType[0].x, Int(Constants.maxInt))

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[CodingKeys.notValidValue], ValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.noSuchKey], ValidModelTransform())
        }

        mapValid.JSON[CodingKeys.nilValue] = nil
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.nilValue], ValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapEmpty[CodingKeys.emptyValue], ValidModelTransform())
        }
    }
}

// ----------------------------------------------------------------------------
