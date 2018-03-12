// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.SetMappable.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
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

        // Positive
        let objectBasicType: Set<SetValidTransformMappableObjectModel> = [SetValidTransformMappableObjectModel()]
        objectBasicType >>> (map[CodingKeys.validObject], SetValidModelTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformSetMappableObjectsFromJSON() {
        let JSONString = JSONKeys.forTransformSetMappableObject
        let JSONStringNotValid = JSONKeys.forTransformSetMappableObjectNotValid
        let JSONStringEmpty = JSONKeys.forTransformSetMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var objectBasicType: Set<SetValidTransformMappableObjectModel> = []
        objectBasicType <~ (mapValid[CodingKeys.validObject], SetValidModelTransform())
        XCTAssertNotNil(objectBasicType.first)

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[CodingKeys.validObject], SetValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.noSuchKey], SetValidModelTransform())
        }
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

        // Positive
        let objectBasicType: Set<SetValidTransformMappableObjectModel>? = [SetValidTransformMappableObjectModel()]
        objectBasicType >>> (map[CodingKeys.validObject], SetValidModelTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformSetMappableOptionalObjectsFromJSON() {
        let JSONString = JSONKeys.forTransformSetMappableObject
        let JSONStringNotValid = JSONKeys.forTransformSetMappableObjectNotValid
        let JSONStringEmpty = JSONKeys.forTransformSetMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var objectBasicType: Set<SetValidTransformMappableObjectModel>? = nil
        objectBasicType <~ (mapValid[CodingKeys.validObject], SetValidModelTransform())
        XCTAssertNotNil(objectBasicType?.first)

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[CodingKeys.validObject], SetValidModelTransform())
        }

        objectBasicType <~ (mapValid[CodingKeys.noSuchKey], SetValidModelTransform())
        XCTAssertNil(objectBasicType)

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

        // Positive
        var objectBasicType: Set<SetValidTransformMappableObjectModel>! = [SetValidTransformMappableObjectModel()]
        objectBasicType <~ (map[CodingKeys.validObject], SetValidModelTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformSetMappableImplicitlyUnwrappedOptionalObjectFromJSON() {
        let JSONString = JSONKeys.forTransformSetMappableObject
        let JSONStringNotValid = JSONKeys.forTransformSetMappableObjectNotValid
        let JSONStringEmpty = JSONKeys.forTransformSetMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var objectBasicType: Set<SetValidTransformMappableObjectModel>! = []
        objectBasicType <~ (mapValid[CodingKeys.validObject], SetValidModelTransform())
        XCTAssertNotNil(objectBasicType.first)

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[CodingKeys.validObject], SetValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.noSuchKey], SetValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.nilValue], SetValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapEmpty[CodingKeys.validObject], SetValidModelTransform())
        }
    }
}

// ----------------------------------------------------------------------------
