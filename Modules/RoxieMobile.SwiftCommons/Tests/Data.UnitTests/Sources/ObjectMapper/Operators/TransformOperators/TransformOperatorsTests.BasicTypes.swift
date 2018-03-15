// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.BasicTypes.swift
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

        objectBasicType >>> (map[JsonKeys.int], StringToIntegerTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformBasicTypesObjectFromJSON() {

        let JsonString = Constants.transformBasicTypes
        let JsonStringNotValid = Constants.transformInvalidBasicTypes

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var objectBasicType: Int = 0

        objectBasicType <~ (mapValid[JsonKeys.int], StringToIntegerTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType, Int.min)

        // Negative
        assertExceptionNotNil {
            objectBasicType <~ (mapNotValid[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        }
        assertExceptionNotNil {
            objectBasicType <~ (mapValid[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
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

        objectBasicType >>> (map[JsonKeys.int], StringToIntegerTransform.shared)

        /// Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        /// Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformBasicTypesOptionalObjectFromJSON() {

        let JsonString = Constants.transformBasicTypes
        let JsonStringNotValid = Constants.transformInvalidBasicTypes

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var objectBasicType: Int? = 0

        objectBasicType <~ (mapValid[JsonKeys.int], StringToIntegerTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType, Int.min)

        // Negative
        assertExceptionNotNil {
            objectBasicType <~ (mapNotValid[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        }
        objectBasicType <~ (mapValid[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
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

        objectBasicType <~ (map[JsonKeys.int], StringToIntegerTransform.shared)

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testTransformBasicTypesImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = Constants.transformBasicTypes
        let JsonStringNotValid = Constants.transformInvalidBasicTypes

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        var objectBasicType: Int! = 0

        objectBasicType <~ (mapValid[JsonKeys.int], StringToIntegerTransform.shared)

        // Positive
        XCTAssertEqual(objectBasicType, Int.min)

        // Negative
        assertExceptionNotNil {
            objectBasicType <~ (mapNotValid[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        }
        assertExceptionNotNil {
            objectBasicType <~ (mapValid[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
    }
}

// ----------------------------------------------------------------------------
