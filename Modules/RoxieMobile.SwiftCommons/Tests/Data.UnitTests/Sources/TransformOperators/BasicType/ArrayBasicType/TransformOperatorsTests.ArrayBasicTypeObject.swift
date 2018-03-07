// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.ArrayBasicTypeObject.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
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

    func testArrayBasicTypesObjectToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        /// Positive
        var objectBasicType: Int = 0
        var arrayObjectBasicType = [objectBasicType]
        arrayObjectBasicType >>> (map[CodingKeys.int], IntTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        /// Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testArrayBasicTypesObjectFromJSON() {
        let JSONString = JSONKeys.forTransformArrayBasicTypes
        let JSONStringNotValid = JSONKeys.forTransformArrayBasicTypesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)

        var arrayObjectBasicType: [Int] = []
        arrayObjectBasicType <~ (mapValid[CodingKeys.int], IntTransform())
        print(arrayObjectBasicType)
        XCTAssertEqual(arrayObjectBasicType.first, Int(Constants.intMin))

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

