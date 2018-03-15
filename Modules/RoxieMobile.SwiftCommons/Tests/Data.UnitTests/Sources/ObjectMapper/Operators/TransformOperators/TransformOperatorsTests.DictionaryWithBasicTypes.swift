// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.DictionaryWithBasicTypes.swift
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

        dictionaryObjectBasicType >>> (map[JsonKeys.int], StringToIntegerTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformDictionaryBasicTypesObjectFromJSON() {

        let JsonString = Constants.transformDictionaryWithBasicTypes
        let JsonStringNotValid = Constants.transformDictionaryWithInvalidBasicTypes

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var dictionaryObjectBasicType: [String: Int] = [:]

        dictionaryObjectBasicType <~ (mapValid[JsonKeys.validObject], StringToIntegerTransform.shared)

        // Positive
        XCTAssertEqual(dictionaryObjectBasicType[JsonKeys.validObject], Int.min)

        // Negative
        assertExceptionNotNil {
            dictionaryObjectBasicType <~ (mapNotValid[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        }
        assertExceptionNotNil {
            dictionaryObjectBasicType <~ (mapValid[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
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

        dictionaryObjectBasicType >>> (map[JsonKeys.int], StringToIntegerTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformDictionaryOptionalBasicTypesFromJSON() {

        let JsonString = Constants.transformDictionaryWithBasicTypes
        let JsonStringNotValid = Constants.transformDictionaryWithInvalidBasicTypes

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var dictionaryObjectBasicType: [String: Int]? = [:]

        dictionaryObjectBasicType <~ (mapValid[JsonKeys.validObject], StringToIntegerTransform.shared)

        // Positive
        XCTAssertEqual(dictionaryObjectBasicType?[JsonKeys.validObject]!, Int.min)

        // Negative
        dictionaryObjectBasicType <~ (mapNotValid[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        XCTAssertNil(dictionaryObjectBasicType)

        dictionaryObjectBasicType <~ (mapValid[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
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

        dictionaryObjectBasicType <~ (map[JsonKeys.int], StringToIntegerTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformDictionaryImplicitlyUnwrappedOptionalBasicTypesObjectFromJSON() {

        let JsonString = Constants.transformDictionaryWithBasicTypes
        let JsonStringNotValid = Constants.transformDictionaryWithInvalidBasicTypes

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var dictionaryObjectBasicType: [String: Int]! = [:]

        dictionaryObjectBasicType <~ (mapValid[JsonKeys.validObject], StringToIntegerTransform.shared)

        // Positive
        XCTAssertEqual(dictionaryObjectBasicType[JsonKeys.validObject], Int.min)

        // Negative
        assertExceptionNotNil {
            dictionaryObjectBasicType <~ (mapNotValid[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        }
        assertExceptionNotNil {
            dictionaryObjectBasicType <~ (mapValid[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
    }
}

// ----------------------------------------------------------------------------
