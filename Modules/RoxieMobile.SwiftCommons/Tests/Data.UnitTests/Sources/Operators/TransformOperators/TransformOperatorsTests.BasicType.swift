// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.BasicType.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Object of Basic type with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformBasicTypesObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let objectBasicType: Int = 0

        objectBasicType >>> (map[CodingKeys.int], IntTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformBasicTypesObjectFromJSON() {

        let JsonString = JsonKeys.transformBasicTypes
        let JsonStringNotValid = JsonKeys.transformBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var objectBasicType: Int = 0

        objectBasicType <~ (mapValid[CodingKeys.int], IntTransform())

        // Positive
        XCTAssertEqual(objectBasicType, Int(Constants.minInt))

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[CodingKeys.notValidValue], IntTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.noSuchKey], IntTransform())
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional object of basic type with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformBasicTypesOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let objectBasicType: Int? = 0

        objectBasicType >>> (map[CodingKeys.int], IntTransform())

        /// Positive
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        /// Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformBasicTypesOptionalObjectFromJSON() {

        let JsonString = JsonKeys.transformBasicTypes
        let JsonStringNotValid = JsonKeys.transformBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var objectBasicType: Int? = 0

        objectBasicType <~ (mapValid[CodingKeys.int], IntTransform())

        // Positive
        XCTAssertEqual(objectBasicType, Int(Constants.minInt))

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[CodingKeys.notValidValue], IntTransform())
        }
        objectBasicType <~ (mapValid[CodingKeys.noSuchKey], IntTransform())
        XCTAssertNil(objectBasicType)
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional object of basic type with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testTransformBasicTypesImplicitlyUnwrappedOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        var objectBasicType: Int! = 0

        objectBasicType <~ (map[CodingKeys.int], IntTransform())

        // Positive
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformBasicTypesImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = JsonKeys.transformBasicTypes
        let JsonStringNotValid = JsonKeys.transformBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var objectBasicType: Int! = 0

        objectBasicType <~ (mapValid[CodingKeys.int], IntTransform())

        // Positive
        XCTAssertEqual(objectBasicType, Int(Constants.minInt))

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[CodingKeys.notValidValue], IntTransform())
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[CodingKeys.noSuchKey], IntTransform())
        }
    }
}

// ----------------------------------------------------------------------------
