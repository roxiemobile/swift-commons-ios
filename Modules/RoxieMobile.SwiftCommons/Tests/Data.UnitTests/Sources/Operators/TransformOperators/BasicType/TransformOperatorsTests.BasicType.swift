// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.BasicType.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
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

        /// Positive
        let objectBasicType: Int = 0
        objectBasicType >>> (map[CodingKeys.int], IntTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        /// Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformBasicTypesObjectFromJSON() {
        let JSONString = JSONKeys.forTransformBasicTypes
        let JSONStringNotValid = JSONKeys.forTransformBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)

        var objectBasicType: Int = 0
        objectBasicType <~ (mapValid[CodingKeys.int], IntTransform())
        XCTAssertEqual(objectBasicType, Int(Constants.intMin))

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

        /// Positive
        let objectBasicType: Int? = 0
        objectBasicType >>> (map[CodingKeys.int], IntTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        /// Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformBasicTypesOptionalObjectFromJSON() {
        let JSONString = JSONKeys.forTransformBasicTypes
        let JSONStringNotValid = JSONKeys.forTransformBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)

        var objectBasicType: Int? = 0
        objectBasicType <~ (mapValid[CodingKeys.int], IntTransform())
        XCTAssertEqual(objectBasicType, Int(Constants.intMin))

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

        /// Positive
        var objectBasicType: Int! = 0
        objectBasicType <~ (map[CodingKeys.int], IntTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        /// Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformBasicTypesImplicitlyUnwrappedOptionalObjectFromJSON() {
        let JSONString = JSONKeys.forTransformBasicTypes
        let JSONStringNotValid = JSONKeys.forTransformBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)

        var objectBasicType: Int! = 0
        objectBasicType <~ (mapValid[CodingKeys.int], IntTransform())
        XCTAssertEqual(objectBasicType, Int(Constants.intMin))

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
