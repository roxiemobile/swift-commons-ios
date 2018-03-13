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
        var dictionaryObjectBasicType = [CodingKeys.int: objectBasicType]

        dictionaryObjectBasicType >>> (map[CodingKeys.int], IntTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformDictionaryBasicTypesObjectFromJSON() {

        let JsonString = JsonKeys.transformDictionaryBasicTypes
        let JsonStringNotValid = JsonKeys.transformDictionaryBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var dictionaryObjectBasicType: [String: Int] = [:]

        dictionaryObjectBasicType <~ (mapValid[CodingKeys.validObject], IntTransform())

        // Positive
        XCTAssertEqual(dictionaryObjectBasicType[CodingKeys.validObject], Int(Constants.minInt))

        // Negative
        guardNegativeException {
            dictionaryObjectBasicType <~ (mapNotValid[CodingKeys.notValidValue], IntTransform())
        }
        guardNegativeException {
            dictionaryObjectBasicType <~ (mapValid[CodingKeys.noSuchKey], IntTransform())
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
        var dictionaryObjectBasicType: [String: Int]? = [CodingKeys.int: objectBasicType]

        dictionaryObjectBasicType >>> (map[CodingKeys.int], IntTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformDictionaryOptionalBasicTypesFromJSON() {

        let JsonString = JsonKeys.transformDictionaryBasicTypes
        let JsonStringNotValid = JsonKeys.transformDictionaryBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var dictionaryObjectBasicType: [String: Int]? = [:]

        dictionaryObjectBasicType <~ (mapValid[CodingKeys.validObject], IntTransform())

        // Positive
        XCTAssertEqual(dictionaryObjectBasicType?[CodingKeys.validObject]!, Int(Constants.minInt))

        // Negative
        dictionaryObjectBasicType <~ (mapNotValid[CodingKeys.notValidValue], IntTransform())
        XCTAssertNil(dictionaryObjectBasicType)

        dictionaryObjectBasicType <~ (mapValid[CodingKeys.noSuchKey], IntTransform())
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
        var dictionaryObjectBasicType: [String: Int]! = [CodingKeys.int: objectBasicType]

        dictionaryObjectBasicType <~ (map[CodingKeys.int], IntTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformDictionaryImplicitlyUnwrappedOptionalBasicTypesObjectFromJSON() {

        let JsonString = JsonKeys.transformDictionaryBasicTypes
        let JsonStringNotValid = JsonKeys.transformDictionaryBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var dictionaryObjectBasicType: [String: Int]! = [:]

        dictionaryObjectBasicType <~ (mapValid[CodingKeys.validObject], IntTransform())

        // Positive
        XCTAssertEqual(dictionaryObjectBasicType[CodingKeys.validObject], Int(Constants.minInt))

        // Negative
        guardNegativeException {
            dictionaryObjectBasicType <~ (mapNotValid[CodingKeys.notValidValue], IntTransform())
        }
        guardNegativeException {
            dictionaryObjectBasicType <~ (mapValid[CodingKeys.noSuchKey], IntTransform())
        }
    }
}

// ----------------------------------------------------------------------------
