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

        objectBasicType >>> (map[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformMappableObjectsFromJSON() {

        let JsonString = JsonKeys.transformMappableObject
        let JsonStringNotValid = JsonKeys.transformMappableObjectNotValid
        let JsonStringEmpty = JsonKeys.transformMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: ValidTransformMappableObjectModel = ValidTransformMappableObjectModel()

        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertEqual(objectBasicType.x, Int(Constants.maxInt))

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
// MARK: - Optional Mappable objects that have transforms
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformMappableOptionalObjectsToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let objectBasicType: ValidTransformMappableObjectModel? = ValidTransformMappableObjectModel()

        objectBasicType >>> (map[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformMappableOptionalObjectsFromJSON() {

        let JsonString = JsonKeys.transformMappableObject
        let JsonStringNotValid = JsonKeys.transformMappableObjectNotValid
        let JsonStringEmpty = JsonKeys.transformMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: ValidTransformMappableObjectModel? = ValidTransformMappableObjectModel()

        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertEqual(objectBasicType!.x, Int(Constants.maxInt))

        // Negative
        objectBasicType <~ (mapNotValid[CodingKeys.notValidValue], ValidModelTransform())
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapValid[CodingKeys.noSuchKey], ValidModelTransform())
        XCTAssertNil(objectBasicType)

        mapValid.JSON[CodingKeys.nilValue] = nil
        objectBasicType <~ (mapValid[CodingKeys.nilValue], ValidModelTransform())
        XCTAssertNil(objectBasicType)

        guardNegativeException {
            objectBasicType <~ (mapEmpty[CodingKeys.emptyValue], ValidModelTransform())
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

        objectBasicType <~ (map[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformMappableImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = JsonKeys.transformMappableObject
        let JsonStringNotValid = JsonKeys.transformMappableObjectNotValid
        let JsonStringEmpty = JsonKeys.transformMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: ValidTransformMappableObjectModel! = ValidTransformMappableObjectModel()

        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertEqual(objectBasicType.x, Int(Constants.maxInt))

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
