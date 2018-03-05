// ----------------------------------------------------------------------------
//
//  IntegerOperators.ImplicityUnwrappedOptionalUnsignedIntegerMapping.swift
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

    func testImplicityUnwrappedOptionalUnsignedIntegerMappingFromJSON() {

        let JSONString = ["int8" : 2,
                          "int16" : 4,
                          "int32" : 15,
                          "int64" : 233,
                          "int" : 78,
                          "uInt8" : 2,
                          "uInt16" : 4,
                          "uInt32" : 15,
                          "uInt64" : 233,
                          "uInt" : 78]
        let map = Map(mappingType: .fromJSON, JSON: JSONString)
        let map2 = Map(mappingType: .fromJSON, JSON: ["notInt" : "notInt"] )
        map.JSON["noValue"] = nil

        let valueU8: UInt8! = UInt8(JSONString["uInt8"]!)
        var uInt8Value: UInt8! = 0
        uInt8Value <~ map["uInt8"]
        XCTAssertEqual(uInt8Value, valueU8)
        // Negative
        guardNegativeException { uInt8Value <~ map2["notInt"] }
        guardNegativeException { uInt8Value <~ map["NoSuchKey"] }
        guardNegativeException { uInt8Value <~ map["noValue"] }

        let valueU16: UInt16! = UInt16(JSONString["uInt16"]!)
        var uInt16Value: UInt16! = 0
        uInt16Value <~ map["uInt16"]
        XCTAssertEqual(uInt16Value, valueU16)
        // Negative
        guardNegativeException { uInt16Value <~ map2["notInt"] }
        guardNegativeException { uInt16Value <~ map["NoSuchKey"] }
        guardNegativeException { uInt16Value <~ map["noValue"] }

        let valueU32: UInt32! = UInt32(JSONString["uInt32"]!)
        var uInt32Value: UInt32! = 0
        uInt32Value <~ map["uInt32"]
        XCTAssertEqual(uInt32Value, valueU32)
        // Negative
        guardNegativeException { uInt32Value <~ map2["notInt"] }
        guardNegativeException { uInt32Value <~ map["NoSuchKey"] }
        guardNegativeException { uInt32Value <~ map["noValue"] }

        let valueU64: UInt64! = UInt64(JSONString["uInt64"]!)
        var uInt64Value: UInt64! = 0
        uInt64Value <~ map["uInt64"]
        XCTAssertEqual(uInt64Value, valueU64)
        // Negative
        guardNegativeException { uInt64Value <~ map2["notInt"] }
        guardNegativeException { uInt64Value <~ map["NoSuchKey"] }
        guardNegativeException { uInt64Value <~ map["noValue"] }

        let uValue: UInt! = UInt(JSONString["uInt"]!)
        var uIntValue: UInt! = 0
        uIntValue <~ map["uInt"]
        XCTAssertEqual(uIntValue, uValue)
        // Negative
        guardNegativeException { uIntValue <~ map2["notInt"] }
        guardNegativeException { uIntValue <~ map["NoSuchKey"] }
        guardNegativeException { uIntValue <~ map["noValue"] }

    }

    func testImplicityUnwrappedOptionalUnsignedIntegerMappingToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])


        /// UnsignedInteger Positive results
        var uInt8Value: UInt8! = 2
        uInt8Value <~ map["uInt8"]
        XCTAssertNotNil(map.JSON["uInt8"])

        var uInt16Value: UInt16! = 30
        uInt16Value <~ map["uInt16"]
        XCTAssertNotNil(map.JSON["uInt16"])

        var uInt32Value: UInt32! = 40
        uInt32Value <~ map["uInt32"]
        XCTAssertNotNil(map.JSON["uInt32"])

        var uInt64Value: UInt64! = 23123
        uInt64Value <~ map["uInt64"]
        XCTAssertNotNil(map.JSON["uInt64"])

        var uIntValue: UInt! = 222
        uIntValue <~ map["uInt"]
        XCTAssertNotNil(map.JSON["uInt"])

        // Negative
        var someDateTime: Date! = Date(timeIntervalSinceReferenceDate: -123456789.0)
        guardNegativeException { someDateTime <~ map["notIntValue"] }
    }

}

// ----------------------------------------------------------------------------

