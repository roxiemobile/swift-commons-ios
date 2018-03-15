// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.ArrayOfBasicTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Array of Basic type with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformArrayBasicTypesObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        var objectBasicType: Int = 0
        var arrayObjectBasicType = [objectBasicType]

        arrayObjectBasicType >>> (map[JsonKeys.int], StringToIntegerTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        /// Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformArrayBasicTypesObjectFromJSON() {

        let JsonString = Constants.transformArrayOfBasicTypes
        let JsonStringNotValid = Constants.transformArrayOfInvalidBasicTypes

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var arrayObjectBasicType: [Int] = []

        arrayObjectBasicType <~ (mapValid[JsonKeys.int], StringToIntegerTransform.shared)

        // Positive
        XCTAssertEqual(arrayObjectBasicType.first, Int.min)

        // Negative
        assertExceptionNotNil {
            arrayObjectBasicType <~ (mapNotValid[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        }
        assertExceptionNotNil {
            arrayObjectBasicType <~ (mapValid[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional array of Basic type with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformArrayOptionalBasicTypesToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        var objectBasicType: Int = 0
        var arrayObjectBasicType: [Int]? = [objectBasicType]

        arrayObjectBasicType >>> (map[JsonKeys.int], StringToIntegerTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformArrayOptionalBasicTypesFromJSON() {

        let JsonString = Constants.transformArrayOfBasicTypes
        let JsonStringNotValid = Constants.transformArrayOfInvalidBasicTypes

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var arrayObjectBasicType: [Int]? = []

        arrayObjectBasicType <~ (mapValid[JsonKeys.int], StringToIntegerTransform.shared)

        // Positive
        XCTAssertEqual(arrayObjectBasicType?.first!, Int.min)

        // Negative
        assertExceptionNotNil {
            arrayObjectBasicType <~ (mapNotValid[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        }
        arrayObjectBasicType <~ (mapValid[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        XCTAssertNil(arrayObjectBasicType)
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional array of Basic type with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformArrayImplicitlyUnwrappedOptionalBasicTypesObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var objectBasicType: Int = 0
        var arrayObjectBasicType: [Int]! = [objectBasicType]

        arrayObjectBasicType <~ (map[JsonKeys.int], StringToIntegerTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        /// Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformArrayImplicitlyUnwrappedOptionalBasicTypesObjectFromJSON() {

        let JsonString = Constants.transformArrayOfBasicTypes
        let JsonStringNotValid = Constants.transformArrayOfInvalidBasicTypes

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var arrayObjectBasicType: [Int]! = []

        arrayObjectBasicType <~ (mapValid[JsonKeys.int], StringToIntegerTransform.shared)

        // Positive
        XCTAssertEqual(arrayObjectBasicType.first, Int.min)

        // Negative
        assertExceptionNotNil {
            arrayObjectBasicType <~ (mapNotValid[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        }
        assertExceptionNotNil {
            arrayObjectBasicType <~ (mapValid[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
    }
}

// ----------------------------------------------------------------------------
