// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.DictionaryMappable.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Dictionary of Mappable objects <String, T: Mappable> with a transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
    // MARK: - Tests

    func testTransformDictionaryMappableObjectsToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        // Positive
        let objectBasicType: [String: ValidTransformMappableObjectModel] = [CodingKeys.validObject: ValidTransformMappableObjectModel()]
        objectBasicType >>> (map[CodingKeys.validObject], ValidModelTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformDictionaryMappableObjectsFromJSON() {
        let JSONString = JSONKeys.forTransformDictionaryMappableObject
        let JSONStringNotValid = JSONKeys.forTransformDictionaryMappableObjectNotValid
        let JSONStringEmpty = JSONKeys.forTransformDictionaryMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var objectBasicType: [String: ValidTransformMappableObjectModel] = [:]
        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())
        XCTAssertEqual(objectBasicType[CodingKeys.validObject]?.x, Int(Constants.intMax))

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
// MARK: - Optional Dictionary of Mappable object <String, T: Mappable> with a transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
    // MARK: - Tests

    func testTransformDictionaryMappableOptionalObjectsToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        // Positive
        let objectBasicType: [String: ValidTransformMappableObjectModel]? = [CodingKeys.validObject: ValidTransformMappableObjectModel()]
        objectBasicType >>> (map[CodingKeys.validObject], ValidModelTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformDictionaryMappableOptionalObjectsFromJSON() {
        let JSONString = JSONKeys.forTransformDictionaryMappableObject
        let JSONStringNotValid = JSONKeys.forTransformDictionaryMappableObjectNotValid
        let JSONStringEmpty = JSONKeys.forTransformDictionaryMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var objectBasicType: [String: ValidTransformMappableObjectModel]? = nil
        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())
        XCTAssertNotNil(objectBasicType)


        // Negative
        objectBasicType <~ (mapNotValid[CodingKeys.notValidValue], ValidModelTransform())
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapValid[CodingKeys.noSuchKey], ValidModelTransform())
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapValid[CodingKeys.nilValue], ValidModelTransform())
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapEmpty[CodingKeys.emptyValue], ValidModelTransform())
        XCTAssertNil(objectBasicType)
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable> with a transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
    // MARK: - Tests

    func testTransformDictionaryMappableImplicitlyUnwrappedOptionalObjectToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        // Positive
        var objectBasicType: [String: ValidTransformMappableObjectModel]! = [CodingKeys.validObject: ValidTransformMappableObjectModel()]
        objectBasicType <~ (map[CodingKeys.validObject], ValidModelTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformDictionaryMappableImplicitlyUnwrappedOptionalObjectFromJSON() {
        let JSONString = JSONKeys.forTransformDictionaryMappableObject
        let JSONStringNotValid = JSONKeys.forTransformDictionaryMappableObjectNotValid
        let JSONStringEmpty = JSONKeys.forTransformDictionaryMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var objectBasicType: [String: ValidTransformMappableObjectModel]! = [:]
        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())
        XCTAssertEqual(objectBasicType[CodingKeys.validObject]?.x, Int(Constants.intMax))

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

