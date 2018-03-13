// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.ArrayBasicType.swift
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

        arrayObjectBasicType >>> (map[CodingKeys.int], IntTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        /// Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformArrayBasicTypesObjectFromJSON() {

        let JsonString = JsonKeys.transformArrayBasicTypes
        let JsonStringNotValid = JsonKeys.transformArrayBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var arrayObjectBasicType: [Int] = []

        arrayObjectBasicType <~ (mapValid[CodingKeys.int], IntTransform())

        // Positive
        XCTAssertEqual(arrayObjectBasicType.first, Int(Constants.minInt))

        // Negative
        guardNegativeException {
            arrayObjectBasicType <~ (mapNotValid[CodingKeys.notValidValue], IntTransform())
        }
        guardNegativeException {
            arrayObjectBasicType <~ (mapValid[CodingKeys.noSuchKey], IntTransform())
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

        arrayObjectBasicType >>> (map[CodingKeys.int], IntTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformArrayOptionalBasicTypesFromJSON() {

        let JsonString = JsonKeys.transformArrayBasicTypes
        let JsonStringNotValid = JsonKeys.transformArrayBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var arrayObjectBasicType: [Int]? = []

        arrayObjectBasicType <~ (mapValid[CodingKeys.int], IntTransform())

        // Positive
        XCTAssertEqual(arrayObjectBasicType?.first!, Int(Constants.minInt))

        // Negative
        guardNegativeException {
            arrayObjectBasicType <~ (mapNotValid[CodingKeys.notValidValue], IntTransform())
        }
        arrayObjectBasicType <~ (mapValid[CodingKeys.noSuchKey], IntTransform())
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

        arrayObjectBasicType <~ (map[CodingKeys.int], IntTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        /// Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformArrayImplicitlyUnwrappedOptionalBasicTypesObjectFromJSON() {

        let JsonString = JsonKeys.transformArrayBasicTypes
        let JsonStringNotValid = JsonKeys.transformArrayBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var arrayObjectBasicType: [Int]! = []

        arrayObjectBasicType <~ (mapValid[CodingKeys.int], IntTransform())

        // Positive
        XCTAssertEqual(arrayObjectBasicType.first, Int(Constants.minInt))

        // Negative
        guardNegativeException {
            arrayObjectBasicType <~ (mapNotValid[CodingKeys.notValidValue], IntTransform())
        }
        guardNegativeException {
            arrayObjectBasicType <~ (mapValid[CodingKeys.noSuchKey], IntTransform())
        }
    }
}

// ----------------------------------------------------------------------------

