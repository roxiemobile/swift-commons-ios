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

        objectBasicType >>> (map[JsonKeys.int], IntTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformBasicTypesObjectFromJSON() {

        let JsonString = Constants.transformBasicTypes
        let JsonStringNotValid = Constants.transformBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var objectBasicType: Int = 0

        objectBasicType <~ (mapValid[JsonKeys.int], IntTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType, Int(Constants.minInt))

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[JsonKeys.notValidValue], IntTransform.shared)
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[JsonKeys.noSuchKey], IntTransform.shared)
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

        objectBasicType >>> (map[JsonKeys.int], IntTransform.shared)

        /// Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        /// Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformBasicTypesOptionalObjectFromJSON() {

        let JsonString = Constants.transformBasicTypes
        let JsonStringNotValid = Constants.transformBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var objectBasicType: Int? = 0

        objectBasicType <~ (mapValid[JsonKeys.int], IntTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType, Int(Constants.minInt))

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[JsonKeys.notValidValue], IntTransform.shared)
        }
        objectBasicType <~ (mapValid[JsonKeys.noSuchKey], IntTransform.shared)
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

        objectBasicType <~ (map[JsonKeys.int], IntTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue >>> map[JsonKeys.notValidValue]
        }
    }

    func testTransformBasicTypesImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = Constants.transformBasicTypes
        let JsonStringNotValid = Constants.transformBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var objectBasicType: Int! = 0

        objectBasicType <~ (mapValid[JsonKeys.int], IntTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType, Int(Constants.minInt))

        // Negative
        guardNegativeException {
            objectBasicType <~ (mapNotValid[JsonKeys.notValidValue], IntTransform.shared)
        }
        guardNegativeException {
            objectBasicType <~ (mapValid[JsonKeys.noSuchKey], IntTransform.shared)
        }
    }
}

// ----------------------------------------------------------------------------
