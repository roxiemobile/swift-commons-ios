// ----------------------------------------------------------------------------
//
//  IntegerOperators.OptionalUnsignedIntegerMapping.swift
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

    func testOptionalUnsignedIntegerMappingFromJSON() {

        let JSONString  = [
            CodingKeys.uint : Constants.uintMax,
            CodingKeys.uint8 : Constants.uintMin,
            CodingKeys.uint16 : Constants.uintMax,
            CodingKeys.uint32 : Constants.uintMin,
            CodingKeys.uint64 : Constants.uintMax
        ]

        let map = Map(mappingType: .fromJSON, JSON: JSONString)
        let map2 = Map(mappingType: .fromJSON, JSON: [CodingKeys.notValidValue : Constants.notValidValue] )
        map.JSON[CodingKeys.nilValue] = nil

        let valueU8: UInt8? = UInt8(JSONString[CodingKeys.uint8]!)
        var uInt8Value: UInt8? = 0
        uInt8Value <~ map[CodingKeys.uint8]
        XCTAssertEqual(uInt8Value, valueU8)
        // Negative
        uInt8Value <~ map[CodingKeys.noSuchKey]
        XCTAssertEqual(uInt8Value, nil)
        uInt8Value <~ map[CodingKeys.nilValue]
        XCTAssertEqual(uInt8Value, nil)
        guardNegativeException { uInt8Value <~ map2[CodingKeys.notValidValue] }

        let valueU16: UInt16? = UInt16(JSONString[CodingKeys.uint16]!)
        var uInt16Value: UInt16? = 0
        uInt16Value <~ map[CodingKeys.uint16]
        XCTAssertEqual(uInt16Value, valueU16)
        // Negative
        uInt16Value <~ map[CodingKeys.noSuchKey]
        XCTAssertEqual(uInt16Value, nil)
        uInt16Value <~ map[CodingKeys.nilValue]
        XCTAssertEqual(uInt16Value, nil)
        guardNegativeException { uInt16Value <~ map2[CodingKeys.notValidValue] }

        let valueU32: UInt32? = UInt32(JSONString[CodingKeys.uint32]!)
        var uInt32Value: UInt32? = 0
        uInt32Value <~ map[CodingKeys.uint32]
        XCTAssertEqual(uInt32Value, valueU32)
        // Negative
        uInt32Value <~ map[CodingKeys.noSuchKey]
        XCTAssertEqual(uInt32Value, nil)
        uInt32Value <~ map[CodingKeys.nilValue]
        XCTAssertEqual(uInt32Value, nil)
        guardNegativeException { uInt32Value <~ map2[CodingKeys.notValidValue] }

        let valueU64: UInt64? = UInt64(JSONString[CodingKeys.uint64]!)
        var uInt64Value: UInt64? = 0
        uInt64Value <~ map[CodingKeys.uint64]
        XCTAssertEqual(uInt64Value, valueU64)
        // Negative
        uInt64Value <~ map[CodingKeys.noSuchKey]
        XCTAssertEqual(uInt64Value, nil)
        uInt64Value <~ map[CodingKeys.nilValue]
        XCTAssertEqual(uInt64Value, nil)
        guardNegativeException { uInt64Value <~ map2[CodingKeys.notValidValue] }
        //        guardNegativeException { uInt64Value <~ map["negUInt"] } Error in ObjectMapper

        let uValue: UInt? = UInt(JSONString[CodingKeys.uint]!)
        var uIntValue: UInt? = 0
        uIntValue <~ map[CodingKeys.uint]
        XCTAssertEqual(uIntValue, uValue)
        // Negative
        uIntValue <~ map[CodingKeys.noSuchKey]
        XCTAssertEqual(uIntValue, nil)
        uIntValue <~ map[CodingKeys.nilValue]
        XCTAssertEqual(uIntValue, nil)
        guardNegativeException { uIntValue <~ map2[CodingKeys.notValidValue] }

    }

    func testOptionalUnsignetIntegerMappingToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        /// UnsignedInteger Positive results
        var uInt8Value: UInt8? = UInt8(Constants.uintMax)
        uInt8Value <~ map[CodingKeys.uint8]
        XCTAssertNotNil(map.JSON[CodingKeys.uint8])

        var uInt16Value: UInt16? = UInt16(Constants.uintMax)
        uInt16Value <~ map[CodingKeys.uint16]
        XCTAssertNotNil(map.JSON[CodingKeys.uint16])

        var uInt32Value: UInt32? = UInt32(Constants.uintMax)
        uInt32Value <~ map[CodingKeys.uint32]
        XCTAssertNotNil(map.JSON[CodingKeys.uint32])

        var uInt64Value: UInt64? = UInt64(Constants.uintMax)
        uInt64Value <~ map[CodingKeys.uint64]
        XCTAssertNotNil(map.JSON[CodingKeys.uint64])

        var uIntValue: UInt? = UInt(Constants.uintMax)
        uIntValue <~ map[CodingKeys.uint]
        XCTAssertNotNil(map.JSON[CodingKeys.uint])

        // Negative
        guardNegativeException { Constants.dateValue <~ map[CodingKeys.notValidValue] }
    }

}

// ----------------------------------------------------------------------------
