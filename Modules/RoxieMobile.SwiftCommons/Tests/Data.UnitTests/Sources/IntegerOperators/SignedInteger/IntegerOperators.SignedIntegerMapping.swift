// ----------------------------------------------------------------------------
//
//  IntegerOperators.SignedIntegerMapping.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------

extension IntegerOperators
{
// MARK: - Tests

    func testSignedIntegerMappingFromJSON() {
        let JSONString  = [
            CodingKeys.int8 : Constants.intMax,
            CodingKeys.int16 : Constants.intMin,
            CodingKeys.int32 : Constants.intMax,
            CodingKeys.int64 : Constants.intMin,
            CodingKeys.int : Constants.intMax,
        ]

        let map = Map(mappingType: .fromJSON, JSON: JSONString)
        let map2 = Map(mappingType: .fromJSON, JSON: [CodingKeys.notValidValue : Constants.notValidValue] )
        map.JSON[CodingKeys.nilValue] = nil

        let value8: Int8 = Int8(JSONString[CodingKeys.int8]!)
        var int8Value: Int8 = 0
        int8Value <~ map[CodingKeys.int8 ]
        XCTAssertEqual(int8Value, value8)
        // Negative
        guardNegativeException { int8Value <~ map2[CodingKeys.notValidValue] }
        guardNegativeException { int8Value <~ map[CodingKeys.noSuchKey] }
        guardNegativeException { int8Value <~ map[CodingKeys.nilValue] }

        let value16: Int16 = Int16(JSONString[CodingKeys.int16]!)
        var int16Value: Int16 = 0
        int16Value <~ map[CodingKeys.int16]
        XCTAssertEqual(int16Value, value16)
        // Negative
        guardNegativeException { int16Value <~ map2[CodingKeys.notValidValue] }
        guardNegativeException { int16Value <~ map[CodingKeys.noSuchKey] }
        guardNegativeException { int16Value <~ map[CodingKeys.nilValue] }

        let value32: Int32 = Int32(JSONString[CodingKeys.int32]!)
        var int32Value: Int32 = 0
        int32Value <~ map[CodingKeys.int32]
        XCTAssertEqual(int32Value, value32)
        // Negative
        guardNegativeException { int32Value <~ map2[CodingKeys.notValidValue] }
        guardNegativeException { int32Value <~ map[CodingKeys.noSuchKey] }
        guardNegativeException { int32Value <~ map[CodingKeys.nilValue] }

        let value64: Int64 = Int64(JSONString[CodingKeys.int64]!)
        var int64Value: Int64 = 0
        int64Value <~ map[CodingKeys.int64]
        XCTAssertEqual(int64Value, value64)
        // Negative
        guardNegativeException { int64Value <~ map2[CodingKeys.notValidValue] }
        guardNegativeException { int64Value <~ map[CodingKeys.noSuchKey] }
        guardNegativeException { int64Value <~ map[CodingKeys.nilValue] }

        let value: Int = Int(JSONString[CodingKeys.int]!)
        var intValue: Int = 0
        intValue <~ map[CodingKeys.int]
        XCTAssertEqual(intValue, value)
        // Negative
        guardNegativeException { intValue <~ map[CodingKeys.notValidValue] }
        guardNegativeException { intValue <~ map[CodingKeys.noSuchKey] }
        guardNegativeException { intValue <~ map[CodingKeys.nilValue] }

    }

    func testSignetIntegerMappingToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        /// SignedInteger Positive results
        var int8Value: Int8 = Int8(Constants.intMin)
        int8Value <~ map[CodingKeys.int8]
        XCTAssertNotNil(map.JSON[CodingKeys.int8])

        var int16Value: Int16 = Int16(Constants.intMax)
        int16Value <~ map[CodingKeys.int16]
        XCTAssertNotNil(map.JSON[CodingKeys.int16])

        var int32Value: Int32 = Int32(Constants.intMin)
        int32Value <~ map[CodingKeys.int32]
        XCTAssertNotNil(map.JSON[CodingKeys.int32])

        var int64Value: Int64 = Int64(Constants.intMax)
        int64Value <~ map[CodingKeys.int64]
        XCTAssertNotNil(map.JSON[CodingKeys.int64])

        var intValue: Int = Int(Constants.intMin)
        intValue <~ map[CodingKeys.int]
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        // Negative
        guardNegativeException { Constants.dateValue <~ map[CodingKeys.notValidValue] }
    }

}

// ----------------------------------------------------------------------------
