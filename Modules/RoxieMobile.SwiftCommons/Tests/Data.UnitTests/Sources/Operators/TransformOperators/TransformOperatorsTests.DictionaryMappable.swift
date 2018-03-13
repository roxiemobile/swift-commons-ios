// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.DictionaryMappable.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
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
        let objectBasicType: [String: ValidTransformMappableObjectModel] = [CodingKeys.validObject: ValidTransformMappableObjectModel()]

        objectBasicType >>> (map[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformDictionaryMappableObjectsFromJSON() {

        let JsonString = JsonKeys.transformDictionaryMappableObject
        let JsonStringNotValid = JsonKeys.transformDictionaryMappableObjectNotValid
        let JsonStringEmpty = JsonKeys.transformDictionaryMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: [String: ValidTransformMappableObjectModel] = [:]

        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertEqual(objectBasicType[CodingKeys.validObject]?.x, Int(Constants.maxInt))

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
// MARK: - Optional Dictionary of Mappable object <String, T: Mappable> with a transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformDictionaryMappableOptionalObjectsToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let objectBasicType: [String: ValidTransformMappableObjectModel]? = [CodingKeys.validObject: ValidTransformMappableObjectModel()]

        objectBasicType >>> (map[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformDictionaryMappableOptionalObjectsFromJSON() {

        let JsonString = JsonKeys.transformDictionaryMappableObject
        let JsonStringNotValid = JsonKeys.transformDictionaryMappableObjectNotValid
        let JsonStringEmpty = JsonKeys.transformDictionaryMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: [String: ValidTransformMappableObjectModel]? = nil

        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertNotNil(objectBasicType)

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
// MARK: - Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable> with a transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformDictionaryMappableImplicitlyUnwrappedOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        var objectBasicType: [String: ValidTransformMappableObjectModel]! = [CodingKeys.validObject: ValidTransformMappableObjectModel()]

        objectBasicType <~ (map[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformDictionaryMappableImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = JsonKeys.transformDictionaryMappableObject
        let JsonStringNotValid = JsonKeys.transformDictionaryMappableObjectNotValid
        let JsonStringEmpty = JsonKeys.transformDictionaryMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: [String: ValidTransformMappableObjectModel]! = [:]

        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())

        // Positive
        XCTAssertEqual(objectBasicType[CodingKeys.validObject]?.x, Int(Constants.maxInt))

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

