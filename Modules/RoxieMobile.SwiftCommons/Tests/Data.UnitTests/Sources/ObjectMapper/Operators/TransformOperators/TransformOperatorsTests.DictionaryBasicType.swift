// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.DictionaryBasicType.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Dictionary of Basic type with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformDictionaryBasicTypesObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var objectBasicType: Int = 0
        var dictionaryObjectBasicType = [JsonKeys.int: objectBasicType]

        dictionaryObjectBasicType >>> (map[JsonKeys.int], IntTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformDictionaryBasicTypesObjectFromJSON() {

        let JsonString = Constants.transformDictionaryBasicTypes
        let JsonStringNotValid = Constants.transformDictionaryBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var dictionaryObjectBasicType: [String: Int] = [:]

        dictionaryObjectBasicType <~ (mapValid[JsonKeys.validObject], IntTransform.shared)

        // Positive
        XCTAssertEqual(dictionaryObjectBasicType[JsonKeys.validObject], Int(Constants.minInt))

        // Negative
        guardNegativeException {
            dictionaryObjectBasicType <~ (mapNotValid[JsonKeys.notValidValue], IntTransform.shared)
        }
        guardNegativeException {
            dictionaryObjectBasicType <~ (mapValid[JsonKeys.noSuchKey], IntTransform.shared)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional dictionary of Basic type with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformDictionaryOptionalBasicTypesToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var objectBasicType: Int = 0
        var dictionaryObjectBasicType: [String: Int]? = [JsonKeys.int: objectBasicType]

        dictionaryObjectBasicType >>> (map[JsonKeys.int], IntTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformDictionaryOptionalBasicTypesFromJSON() {

        let JsonString = Constants.transformDictionaryBasicTypes
        let JsonStringNotValid = Constants.transformDictionaryBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var dictionaryObjectBasicType: [String: Int]? = [:]

        dictionaryObjectBasicType <~ (mapValid[JsonKeys.validObject], IntTransform.shared)

        // Positive
        XCTAssertEqual(dictionaryObjectBasicType?[JsonKeys.validObject]!, Int(Constants.minInt))

        // Negative
        dictionaryObjectBasicType <~ (mapNotValid[JsonKeys.notValidValue], IntTransform.shared)
        XCTAssertNil(dictionaryObjectBasicType)

        dictionaryObjectBasicType <~ (mapValid[JsonKeys.noSuchKey], IntTransform.shared)
        XCTAssertNil(dictionaryObjectBasicType)
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional dictionary of Basic type with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformDictionaryImplicitlyUnwrappedOptionalBasicTypesObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var objectBasicType: Int = 0
        var dictionaryObjectBasicType: [String: Int]! = [JsonKeys.int: objectBasicType]

        dictionaryObjectBasicType <~ (map[JsonKeys.int], IntTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformDictionaryImplicitlyUnwrappedOptionalBasicTypesObjectFromJSON() {

        let JsonString = Constants.transformDictionaryBasicTypes
        let JsonStringNotValid = Constants.transformDictionaryBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var dictionaryObjectBasicType: [String: Int]! = [:]

        dictionaryObjectBasicType <~ (mapValid[JsonKeys.validObject], IntTransform.shared)

        // Positive
        XCTAssertEqual(dictionaryObjectBasicType[JsonKeys.validObject], Int(Constants.minInt))

        // Negative
        guardNegativeException {
            dictionaryObjectBasicType <~ (mapNotValid[JsonKeys.notValidValue], IntTransform.shared)
        }
        guardNegativeException {
            dictionaryObjectBasicType <~ (mapValid[JsonKeys.noSuchKey], IntTransform.shared)
        }
    }
}

// ----------------------------------------------------------------------------
