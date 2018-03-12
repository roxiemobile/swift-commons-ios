// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.Mappable.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
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

        /// Positive results
        let objectBasicType: ValidTransformMappableObjectModel = ValidTransformMappableObjectModel()
        objectBasicType >>> (map[CodingKeys.validObject], ValidModelTransform())
        print(map.JSON)
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        /// Bool Negative results
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformMappableObjectsFromJSON() {
        let JSONString = JSONKeys.forTransformMappableObject
        let JSONStringNotValid = JSONKeys.forTransformMappableObjectNotValid
        let JSONStringEmpty = JSONKeys.forTransformMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var objectBasicType: ValidTransformMappableObjectModel = ValidTransformMappableObjectModel()
        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())
        XCTAssertEqual(objectBasicType.x, Int(Constants.intMax))

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[CodingKeys.notValidValue], ValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.noSuchKey], ValidModelTransform())
        }
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

        /// Positive results
        let objectBasicType: ValidTransformMappableObjectModel? = ValidTransformMappableObjectModel()
        objectBasicType >>> (map[CodingKeys.validObject], ValidModelTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        /// Bool Negative results
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformMappableOptionalObjectsFromJSON() {
        let JSONString = JSONKeys.forTransformMappableObject
        let JSONStringNotValid = JSONKeys.forTransformMappableObjectNotValid
        let JSONStringEmpty = JSONKeys.forTransformMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var objectBasicType: ValidTransformMappableObjectModel? = ValidTransformMappableObjectModel()
        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())
        XCTAssertEqual(objectBasicType!.x, Int(Constants.intMax))

        // Negative
        objectBasicType <~ (mapNotValid[CodingKeys.notValidValue], ValidModelTransform())
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapValid[CodingKeys.noSuchKey], ValidModelTransform())
        XCTAssertNil(objectBasicType)

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

        /// Positive results
        var objectBasicType: ValidTransformMappableObjectModel! = ValidTransformMappableObjectModel()
        objectBasicType <~ (map[CodingKeys.validObject], ValidModelTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        /// Bool Negative results
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformMappableImplicitlyUnwrappedOptionalObjectFromJSON() {
        let JSONString = JSONKeys.forTransformMappableObject
        let JSONStringNotValid = JSONKeys.forTransformMappableObjectNotValid
        let JSONStringEmpty = JSONKeys.forTransformMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var objectBasicType: ValidTransformMappableObjectModel! = ValidTransformMappableObjectModel()
        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())
        XCTAssertEqual(objectBasicType.x, Int(Constants.intMax))

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[CodingKeys.notValidValue], ValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.noSuchKey], ValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.nilValue], ValidModelTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapEmpty[CodingKeys.emptyValue], ValidModelTransform())
        }
    }
}

// ----------------------------------------------------------------------------
