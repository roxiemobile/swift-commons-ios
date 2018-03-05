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

        let JSONString = ["int8" : 2,
                          "int16" : 4,
                          "int32" : 15,
                          "int64" : 233,
                          "int" : 78,
                          "uInt8" : 2,
                          "uInt16" : 4,
                          "uInt32" : 15,
                          "uInt64" : 233,
                          "uInt" : 78,
                          /*"negUInt" : -1 //Error in ObjectMapper*/]
        let map = Map(mappingType: .fromJSON, JSON: JSONString)
        let map2 = Map(mappingType: .fromJSON, JSON: ["notInt" : "notInt"] )
        map.JSON["noValue"] = nil

        let valueU8: UInt8? = UInt8(JSONString["uInt8"]!)
        var uInt8Value: UInt8? = 0
        uInt8Value <~ map["uInt8"]
        XCTAssertEqual(uInt8Value, valueU8)
        // Negative
        uInt8Value <~ map["NoSuchKey"]
        XCTAssertEqual(uInt8Value, nil)
        uInt8Value <~ map["noValue"]
        XCTAssertEqual(uInt8Value, nil)
        guardNegativeException { uInt8Value <~ map2["notInt"] }

        let valueU16: UInt16? = UInt16(JSONString["uInt16"]!)
        var uInt16Value: UInt16? = 0
        uInt16Value <~ map["uInt16"]
        XCTAssertEqual(uInt16Value, valueU16)
        // Negative
        uInt16Value <~ map["NoSuchKey"]
        XCTAssertEqual(uInt16Value, nil)
        uInt16Value <~ map["noValue"]
        XCTAssertEqual(uInt16Value, nil)
        guardNegativeException { uInt16Value <~ map2["notInt"] }

        let valueU32: UInt32? = UInt32(JSONString["uInt32"]!)
        var uInt32Value: UInt32? = 0
        uInt32Value <~ map["uInt32"]
        XCTAssertEqual(uInt32Value, valueU32)
        // Negative
        uInt32Value <~ map["NoSuchKey"]
        XCTAssertEqual(uInt32Value, nil)
        uInt32Value <~ map["noValue"]
        XCTAssertEqual(uInt32Value, nil)
        guardNegativeException { uInt32Value <~ map2["notInt"] }

        let valueU64: UInt64? = UInt64(JSONString["uInt64"]!)
        var uInt64Value: UInt64? = 0
        uInt64Value <~ map["uInt64"]
        XCTAssertEqual(uInt64Value, valueU64)
        // Negative
        uInt64Value <~ map["NoSuchKey"]
        XCTAssertEqual(uInt64Value, nil)
        uInt64Value <~ map["noValue"]
        XCTAssertEqual(uInt64Value, nil)
        guardNegativeException { uInt64Value <~ map2["notInt"] }
        //        guardNegativeException { uInt64Value <~ map["negUInt"] } Error in ObjectMapper

        let uValue: UInt? = UInt(JSONString["uInt"]!)
        var uIntValue: UInt? = 0
        uIntValue <~ map["uInt"]
        XCTAssertEqual(uIntValue, uValue)
        // Negative
        uIntValue <~ map["NoSuchKey"]
        XCTAssertEqual(uIntValue, nil)
        uIntValue <~ map["noValue"]
        XCTAssertEqual(uIntValue, nil)
        guardNegativeException { uIntValue <~ map2["notInt"] }

    }

    func testOptionalUnsignetIntegerMappingToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        /// UnsignedInteger Positive results
        var uInt8Value: UInt8? = 2
        uInt8Value <~ map["uInt8"]
        XCTAssertNotNil(map.JSON["uInt8"])

        var uInt16Value: UInt16? = 30
        uInt16Value <~ map["uInt16"]
        XCTAssertNotNil(map.JSON["uInt16"])

        var uInt32Value: UInt32? = 40
        uInt32Value <~ map["uInt32"]
        XCTAssertNotNil(map.JSON["uInt32"])

        var uInt64Value: UInt64? = 23123
        uInt64Value <~ map["uInt64"]
        XCTAssertNotNil(map.JSON["uInt64"])

        var uIntValue: UInt? = 222
        uIntValue <~ map["uInt"]
        XCTAssertNotNil(map.JSON["uInt"])

        // Negative
        var someDateTime: Date? = Date(timeIntervalSinceReferenceDate: -123456789.0)
        guardNegativeException { someDateTime <~ map["notIntValue"] }
    }

}

// ----------------------------------------------------------------------------


