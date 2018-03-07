// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.DictionaryImplicitlyUnwrappedOptionalBasicTypeObject.swift
//
//  @aut//  @author//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
    // MARK: - Tests

    func testDictionaryImplicitlyUnwrappedOptionalBasicTypesObjectToJSON() {
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

    func testDictionaryImplicitlyUnwrappedOptionalBasicTypesObjectFromJSON() {
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

