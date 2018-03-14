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

        arrayObjectBasicType >>> (map[JsonKeys.int], IntTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        /// Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformArrayBasicTypesObjectFromJSON() {

        let JsonString = Constants.transformArrayBasicTypes
        let JsonStringNotValid = Constants.transformArrayBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var arrayObjectBasicType: [Int] = []

        arrayObjectBasicType <~ (mapValid[JsonKeys.int], IntTransform.shared)

        // Positive
        XCTAssertEqual(arrayObjectBasicType.first, Int(Constants.minInt))

        // Negative
        guardNegativeException {
            arrayObjectBasicType <~ (mapNotValid[JsonKeys.notValidValue], IntTransform.shared)
        }
        guardNegativeException {
            arrayObjectBasicType <~ (mapValid[JsonKeys.noSuchKey], IntTransform.shared)
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

        arrayObjectBasicType >>> (map[JsonKeys.int], IntTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformArrayOptionalBasicTypesFromJSON() {

        let JsonString = Constants.transformArrayBasicTypes
        let JsonStringNotValid = Constants.transformArrayBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var arrayObjectBasicType: [Int]? = []

        arrayObjectBasicType <~ (mapValid[JsonKeys.int], IntTransform.shared)

        // Positive
        XCTAssertEqual(arrayObjectBasicType?.first!, Int(Constants.minInt))

        // Negative
        guardNegativeException {
            arrayObjectBasicType <~ (mapNotValid[JsonKeys.notValidValue], IntTransform.shared)
        }
        arrayObjectBasicType <~ (mapValid[JsonKeys.noSuchKey], IntTransform.shared)
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

        arrayObjectBasicType <~ (map[JsonKeys.int], IntTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        /// Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformArrayImplicitlyUnwrappedOptionalBasicTypesObjectFromJSON() {

        let JsonString = Constants.transformArrayBasicTypes
        let JsonStringNotValid = Constants.transformArrayBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var arrayObjectBasicType: [Int]! = []

        arrayObjectBasicType <~ (mapValid[JsonKeys.int], IntTransform.shared)

        // Positive
        XCTAssertEqual(arrayObjectBasicType.first, Int(Constants.minInt))

        // Negative
        guardNegativeException {
            arrayObjectBasicType <~ (mapNotValid[JsonKeys.notValidValue], IntTransform.shared)
        }
        guardNegativeException {
            arrayObjectBasicType <~ (mapValid[JsonKeys.noSuchKey], IntTransform.shared)
        }
    }
}

// ----------------------------------------------------------------------------

