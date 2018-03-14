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
        let objectBasicType: [String: ValidTransformMappableObjectModel] = [JsonKeys.validObject: ValidTransformMappableObjectModel()]

        objectBasicType >>> (map[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformDictionaryMappableObjectsFromJSON() {

        let JsonString = Constants.transformDictionaryMappableObject
        let JsonStringNotValid = Constants.transformDictionaryMappableObjectNotValid
        let JsonStringEmpty = Constants.transformDictionaryMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: [String: ValidTransformMappableObjectModel] = [:]

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType[JsonKeys.validObject]?.x, Int(Constants.maxInt))

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
// MARK: - Optional Dictionary of Mappable object <String, T: Mappable> with a transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformDictionaryMappableOptionalObjectsToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let objectBasicType: [String: ValidTransformMappableObjectModel]? = [JsonKeys.validObject: ValidTransformMappableObjectModel()]

        objectBasicType >>> (map[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformDictionaryMappableOptionalObjectsFromJSON() {

        let JsonString = Constants.transformDictionaryMappableObject
        let JsonStringNotValid = Constants.transformDictionaryMappableObjectNotValid
        let JsonStringEmpty = Constants.transformDictionaryMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: [String: ValidTransformMappableObjectModel]? = nil

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(objectBasicType)

        // Negative
        objectBasicType <~ (mapNotValid[JsonKeys.notValidValue], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapValid[JsonKeys.noSuchKey], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        mapValid.JSON[JsonKeys.nilValue] = nil
        objectBasicType <~ (mapValid[JsonKeys.nilValue], ValidModelTransform.shared)
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapEmpty[JsonKeys.emptyValue], ValidModelTransform.shared)
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
        var objectBasicType: [String: ValidTransformMappableObjectModel]! = [JsonKeys.validObject: ValidTransformMappableObjectModel()]

        objectBasicType <~ (map[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformDictionaryMappableImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = Constants.transformDictionaryMappableObject
        let JsonStringNotValid = Constants.transformDictionaryMappableObjectNotValid
        let JsonStringEmpty = Constants.transformDictionaryMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var objectBasicType: [String: ValidTransformMappableObjectModel]! = [:]

        objectBasicType <~ (mapValid[JsonKeys.validObject], ValidModelTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType[JsonKeys.validObject]?.x, Int(Constants.maxInt))

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

