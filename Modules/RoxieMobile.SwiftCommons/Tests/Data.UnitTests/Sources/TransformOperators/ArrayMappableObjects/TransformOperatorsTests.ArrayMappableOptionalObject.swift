// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.ArrayMappableOptionalObject.swift
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

    func testArrayMappableOptionalObjectsToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        // Positive
        let objectBasicType: [ValidTransformMappableObjectModel]? = [ValidTransformMappableObjectModel()]
        objectBasicType >>> (map[CodingKeys.validObject], ValidModelTransform())
        XCTAssertNotNil(map.JSON[CodingKeys.validObject])

        // Negative
        guardNegativeException {
            Constants.dateValue >>> map[CodingKeys.notValidValue]
        }
    }

    func testArrayMappableOptionalObjectsFromJSON() {
        let JSONString = JSONKeys.forTransformArrayMappableObject
        let JSONStringNotValid = JSONKeys.forTransformArrayMappableObjectNotValid
        let JSONStringEmpty = JSONKeys.forTransformArrayMappableObjectEmpty

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)
        mapValid.JSON[CodingKeys.nilValue] = nil

        var objectBasicType: [ValidTransformMappableObjectModel]? = nil
        objectBasicType <~ (mapValid[CodingKeys.validObject], ValidModelTransform())
        XCTAssertEqual(objectBasicType?[0].x, Int(Constants.intMax))

        // Negative
        objectBasicType <~ (mapNotValid[CodingKeys.notValidValue], ValidModelTransform())
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapValid[CodingKeys.noSuchKey], ValidModelTransform())
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapValid[CodingKeys.nilValue], ValidModelTransform())
        XCTAssertNil(objectBasicType)

        objectBasicType <~ (mapEmpty[CodingKeys.emptyValue], ValidModelTransform())
        XCTAssertNil(objectBasicType)
    }
}

// ----------------------------------------------------------------------------
