// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.DictionaryBasicType.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
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

        /// Positive
        var objectBasicType: Int = 0
        var dictionaryObjectBasicType = [CodingKeys.int: objectBasicType]
        dictionaryObjectBasicType >>> (map[CodingKeys.int], IntTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        /// Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformDictionaryBasicTypesObjectFromJSON() {
        let JSONString = JSONKeys.forTransformDictionaryBasicTypes
        let JSONStringNotValid = JSONKeys.forTransformDictionaryBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)

        var dictionaryObjectBasicType: [String: Int] = [:]
        dictionaryObjectBasicType <~ (mapValid[CodingKeys.validObject], IntTransform())
        print(dictionaryObjectBasicType)
        XCTAssertEqual(dictionaryObjectBasicType[CodingKeys.validObject], Int(Constants.intMin))

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

        /// Positive
        var objectBasicType: Int = 0
        var dictionaryObjectBasicType: [String: Int]? = [CodingKeys.int: objectBasicType]
        dictionaryObjectBasicType >>> (map[CodingKeys.int], IntTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        /// Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformDictionaryOptionalBasicTypesFromJSON() {
        let JSONString = JSONKeys.forTransformDictionaryBasicTypes
        let JSONStringNotValid = JSONKeys.forTransformDictionaryBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)

        var dictionaryObjectBasicType: [String: Int]? = [:]
        dictionaryObjectBasicType <~ (mapValid[CodingKeys.validObject], IntTransform())
        print(dictionaryObjectBasicType)
        XCTAssertEqual(dictionaryObjectBasicType?[CodingKeys.validObject]!, Int(Constants.intMin))

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

        /// Positive
        var objectBasicType: Int = 0
        var dictionaryObjectBasicType: [String: Int]! = [CodingKeys.int: objectBasicType]
        dictionaryObjectBasicType <~ (map[CodingKeys.int], IntTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        /// Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testTransformDictionaryImplicitlyUnwrappedOptionalBasicTypesObjectFromJSON() {
        let JSONString = JSONKeys.forTransformDictionaryBasicTypes
        let JSONStringNotValid = JSONKeys.forTransformDictionaryBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)

        var dictionaryObjectBasicType: [String: Int]! = [:]
        dictionaryObjectBasicType <~ (mapValid[CodingKeys.validObject], IntTransform())
        print(dictionaryObjectBasicType)
        XCTAssertEqual(dictionaryObjectBasicType[CodingKeys.validObject], Int(Constants.intMin))

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
