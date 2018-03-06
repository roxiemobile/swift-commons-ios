// ----------------------------------------------------------------------------
//
//  SwiftCommons.Data.UnitTests.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import SwiftCommonsConcurrent
import XCTest

// ----------------------------------------------------------------------------

class SwiftCommonsData_UnitTests: XCTestCase
{
    
    private func guardNegativeException (
        action: @escaping () -> ()
        ) -> Void {
        var exception: NSException? = nil
        objcTry {
            action()
        }.objcCatch { e in
          exception = e
        }.objcFinally {
          XCTAssertNotNil(exception)
        }
    }


    func testBasicIntegerToJSON() {
        
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        /// SignedInteger Positive results
        var int8Value: Int8 = 2
        int8Value <~ map["int8"]
        XCTAssertNotNil(map.JSON["int8"])
        
        let int16Value: Int16 = 30
        int16Value >>> map["int16"]
        XCTAssertNotNil(map.JSON["int16"])
        
        let int32Value: Int32 = -40
        int32Value >>> map["int32"]
        XCTAssertNotNil(map.JSON["int32"])
        
        let int64Value: Int64 = 23123
        int64Value >>> map["int64"]
        XCTAssertNotNil(map.JSON["int64"])
        
        let intValue: Int = 222
        intValue >>> map["int"]
        XCTAssertNotNil(map.JSON["int"])
        
        
        /// UnsignedInteger Positive results
        let uInt8Value: UInt8 = 2
        uInt8Value >>> map["uInt8"]
        XCTAssertNotNil(map.JSON["uInt8"])
        
        let uInt16Value: UInt16 = 30
        uInt16Value >>> map["uInt16"]
        XCTAssertNotNil(map.JSON["uInt16"])
        
        let uInt32Value: UInt32 = 40
        uInt32Value >>> map["uInt32"]
        XCTAssertNotNil(map.JSON["uInt32"])
        
        let uInt64Value: UInt64 = 23123
        uInt64Value >>> map["uInt64"]
        XCTAssertNotNil(map.JSON["uInt64"])
        
        let uIntValue: UInt = 222
        uIntValue >>> map["uInt"]
        XCTAssertNotNil(map.JSON["uInt"])
        
        // Negative
        let someDateTime: Date = Date(timeIntervalSinceReferenceDate: -123456789.0)
        guardNegativeException { someDateTime >>> map["notIntValue"] }
        
    }
    
    func testOptionalIntegerToJSON() {
        
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        /// SignedInteger Positive results
        let int8Value: Int8? = 2
        int8Value >>> map["int8"]
        XCTAssertNotNil(map.JSON["int8"])
        
        let int16Value: Int16? = 30
        int16Value >>> map["int16"]
        XCTAssertNotNil(map.JSON["int16"])
        
        let int32Value: Int32? = -40
        int32Value >>> map["int32"]
        XCTAssertNotNil(map.JSON["int32"])
        
        let int64Value: Int64? = 23123
        int64Value >>> map["int64"]
        XCTAssertNotNil(map.JSON["int64"])
        
        let intValue: Int? = 222
        intValue >>> map["int"]
        XCTAssertNotNil(map.JSON["int"])
        
        
        /// UnsignedInteger Positive results
        let uInt8Value: UInt8? = 2
        uInt8Value >>> map["uInt8"]
        XCTAssertNotNil(map.JSON["uInt8"])
        
        let uInt16Value: UInt16? = 30
        uInt16Value >>> map["uInt16"]
        XCTAssertNotNil(map.JSON["uInt16"])
        
        let uInt32Value: UInt32? = 40
        uInt32Value >>> map["uInt32"]
        XCTAssertNotNil(map.JSON["uInt32"])
        
        let uInt64Value: UInt64? = 23123
        uInt64Value >>> map["uInt64"]
        XCTAssertNotNil(map.JSON["uInt64"])
        
        let uIntValue: UInt? = 222
        uIntValue >>> map["uInt"]
        XCTAssertNotNil(map.JSON["uInt"])
        
        // Negative
        let someDateTime: Date? = Date(timeIntervalSinceReferenceDate: -123456789.0)
        guardNegativeException { someDateTime >>> map["notIntValue"] }
    }
    
    func testImplicitlyUnwrappedOptionalIntegerToJSON() {
        
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        /// SignedInteger Positive results
        let int8Value: Int8! = 2
        int8Value >>> map["int8"]
        XCTAssertNotNil(map.JSON["int8"])
        
        let int16Value: Int16! = 30
        int16Value >>> map["int16"]
        XCTAssertNotNil(map.JSON["int16"])
        
        let int32Value: Int32! = -40
        int32Value >>> map["int32"]
        XCTAssertNotNil(map.JSON["int32"])
        
        let int64Value: Int64! = 23123
        int64Value >>> map["int64"]
        XCTAssertNotNil(map.JSON["int64"])
        
        let intValue: Int! = 222
        intValue >>> map["int"]
        XCTAssertNotNil(map.JSON["int"])
        
        
        /// UnsignedInteger Positive results
        let uInt8Value: UInt8! = 2
        uInt8Value >>> map["uInt8"]
        XCTAssertNotNil(map.JSON["uInt8"])
        
        let uInt16Value: UInt16! = 30
        uInt16Value >>> map["uInt16"]
        XCTAssertNotNil(map.JSON["uInt16"])
        
        let uInt32Value: UInt32! = 40
        uInt32Value >>> map["uInt32"]
        XCTAssertNotNil(map.JSON["uInt32"])
        
        let uInt64Value: UInt64! = 23123
        uInt64Value >>> map["uInt64"]
        XCTAssertNotNil(map.JSON["uInt64"])
        
        let uIntValue: UInt! = 222
        uIntValue >>> map["uInt"]
        XCTAssertNotNil(map.JSON["uInt"])
        
        // Negative
        let someDateTime: Date! = Date(timeIntervalSinceReferenceDate: -123456789.0)
        guardNegativeException { someDateTime >>> map["notIntValue"] }
    }
    
    func testMappingIntegerFromJSON() {
        let JSONString  = ["int8" : 2,
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
        
        let value8: Int8 = Int8(JSONString["int8"]!)
        var int8Value: Int8 = 0
        int8Value <~ map["int8"]
        XCTAssertEqual(int8Value, value8)
        // Negative
        guardNegativeException { int8Value <~ map2["notInt"] }
        guardNegativeException { int8Value <~ map["NoSuchKey"] }
        guardNegativeException { int8Value <~ map["noValue"] }
        
        let value16: Int16 = Int16(JSONString["int16"]!)
        var int16Value: Int16 = 0
        int16Value <~ map["int16"]
        XCTAssertEqual(int16Value, value16)
        // Negative
        guardNegativeException { int16Value <~ map2["notInt"] }
        guardNegativeException { int16Value <~ map["NoSuchKey"] }
        guardNegativeException { int16Value <~ map["noValue"] }
        
        let value32: Int32 = Int32(JSONString["int32"]!)
        var int32Value: Int32 = 0
        int32Value <~ map["int32"]
        XCTAssertEqual(int32Value, value32)
        // Negative
        guardNegativeException { int32Value <~ map2["notInt"] }
        guardNegativeException { int32Value <~ map["NoSuchKey"] }
        guardNegativeException { int32Value <~ map["noValue"] }
        
        let value64: Int64 = Int64(JSONString["int64"]!)
        var int64Value: Int64 = 0
        int64Value <~ map["int64"]
        XCTAssertEqual(int64Value, value64)
        // Negative
        guardNegativeException { int64Value <~ map2["notInt"] }
        guardNegativeException { int64Value <~ map["NoSuchKey"] }
        guardNegativeException { int64Value <~ map["noValue"] }
        
        let value: Int = Int(JSONString["int"]!)
        var intValue: Int = 0
        intValue <~ map["int"]
        XCTAssertEqual(intValue, value)
        // Negative
        guardNegativeException { intValue <~ map2["notInt"] }
        guardNegativeException { intValue <~ map["NoSuchKey"] }
        guardNegativeException { intValue <~ map["noValue"] }
        
        let valueU8: UInt8 = UInt8(JSONString["uInt8"]!)
        var uInt8Value: UInt8 = 0
        uInt8Value <~ map["uInt8"]
        XCTAssertEqual(uInt8Value, valueU8)
        // Negative
        guardNegativeException { uInt8Value <~ map2["notInt"] }
        guardNegativeException { uInt8Value <~ map["NoSuchKey"] }
        guardNegativeException { uInt8Value <~ map["noValue"] }
        
        let valueU16: UInt16 = UInt16(JSONString["uInt16"]!)
        var uInt16Value: UInt16 = 0
        uInt16Value <~ map["uInt16"]
        XCTAssertEqual(uInt16Value, valueU16)
        // Negative
        guardNegativeException { uInt16Value <~ map2["notInt"] }
        guardNegativeException { uInt16Value <~ map["NoSuchKey"] }
        guardNegativeException { uInt16Value <~ map["noValue"] }
        
        let valueU32: UInt32 = UInt32(JSONString["uInt32"]!)
        var uInt32Value: UInt32 = 0
        uInt32Value <~ map["uInt32"]
        XCTAssertEqual(uInt32Value, valueU32)
        // Negative
        guardNegativeException { uInt32Value <~ map2["notInt"] }
        guardNegativeException { uInt32Value <~ map["NoSuchKey"] }
        guardNegativeException { uInt32Value <~ map["noValue"] }
        
        let valueU64: UInt64 = UInt64(JSONString["uInt64"]!)
        var uInt64Value: UInt64 = 0
        uInt64Value <~ map["uInt64"]
        XCTAssertEqual(uInt64Value, valueU64)
        // Negative
        guardNegativeException { uInt64Value <~ map2["notInt"] }
        guardNegativeException { uInt64Value <~ map["NoSuchKey"] }
        guardNegativeException { uInt64Value <~ map["noValue"] }
        
        let uValue: UInt = UInt(JSONString["uInt"]!)
        var uIntValue: UInt = 0
        uIntValue <~ map["uInt"]
        XCTAssertEqual(uIntValue, uValue)
        // Negative
        guardNegativeException { uIntValue <~ map2["notInt"] }
        guardNegativeException { uIntValue <~ map["NoSuchKey"] }
        guardNegativeException { uIntValue <~ map["noValue"] }
    }
    
    func testMappingOptionalIntegerFromJSON() {
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

        let value8: Int8? = Int8(JSONString["int8"]!)
        var int8Value: Int8? = 0
        int8Value <~ map["int8"]
        XCTAssertEqual(int8Value, value8)
        // Negative
        int8Value <~ map["NoSuchKey"]
        XCTAssertEqual(int8Value, nil)
        int8Value <~ map["noValue"]
        XCTAssertEqual(int8Value, nil)
        guardNegativeException { int8Value <~ map2["notInt"] }
        
        let value16: Int16? = Int16(JSONString["int16"]!)
        var int16Value: Int16? = 0
        int16Value <~ map["int16"]
        XCTAssertEqual(int16Value, value16)
        // Negative
        int16Value <~ map["NoSuchKey"]
        XCTAssertEqual(int8Value, nil)
        int16Value <~ map["noValue"]
        XCTAssertEqual(int16Value, nil)
        guardNegativeException { int16Value <~ map2["notInt"] }
        
        let value32: Int32? = Int32(JSONString["int32"]!)
        var int32Value: Int32? = 0
        int32Value <~ map["int32"]
        XCTAssertEqual(int32Value, value32)
        // Negative
        int32Value <~ map["NoSuchKey"]
        XCTAssertEqual(int32Value, nil)
        int32Value <~ map["noValue"]
        XCTAssertEqual(int32Value, nil)
        guardNegativeException { int32Value <~ map2["notInt"] }
        
        let value64: Int64? = Int64(JSONString["int64"]!)
        var int64Value: Int64? = 0
        int64Value <~ map["int64"]
        XCTAssertEqual(int64Value, value64)
        // Negative
        int64Value <~ map["NoSuchKey"]
        XCTAssertEqual(int64Value, nil)
        int64Value <~ map["noValue"]
        XCTAssertEqual(int64Value, nil)
        guardNegativeException { int64Value <~ map2["notInt"] }
        
        let value: Int? = Int(JSONString["int"]!)
        var intValue: Int? = 0
        intValue <~ map["int"]
        XCTAssertEqual(intValue, value)
        // Negative
        intValue <~ map["NoSuchKey"]
        XCTAssertEqual(intValue, nil)
        intValue <~ map["noValue"]
        XCTAssertEqual(intValue, nil)
        guardNegativeException { intValue <~ map2["notInt"] }
        
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
    
    func testMappingImplicityUnwrappedIntegerFromJSON() {
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
        
        let value8: Int8! = Int8(JSONString["int8"]!)
        var int8Value: Int8! = 0
        int8Value <~ map["int8"]
        XCTAssertEqual(int8Value, value8)
        // Negative
        guardNegativeException { int8Value <~ map2["notInt"] }
        guardNegativeException { int8Value <~ map["NoSuchKey"] }
        guardNegativeException { int8Value <~ map["noValue"] }
        
        let value16: Int16! = Int16(JSONString["int16"]!)
        var int16Value: Int16! = 0
        int16Value <~ map["int16"]
        XCTAssertEqual(int16Value, value16)
        // Negative
        guardNegativeException { int16Value <~ map2["notInt"] }
        guardNegativeException { int16Value <~ map["NoSuchKey"] }
        guardNegativeException { int16Value <~ map["noValue"] }
        
        let value32: Int32! = Int32(JSONString["int32"]!)
        var int32Value: Int32! = 0
        int32Value <~ map["int32"]
        XCTAssertEqual(int32Value, value32)
        // Negative
        guardNegativeException { int32Value <~ map2["notInt"] }
        guardNegativeException { int32Value <~ map["NoSuchKey"] }
        guardNegativeException { int32Value <~ map["noValue"] }
        
        let value64: Int64! = Int64(JSONString["int64"]!)
        var int64Value: Int64! = 0
        int64Value <~ map["int64"]
        XCTAssertEqual(int64Value, value64)
        // Negative
        guardNegativeException { int64Value <~ map2["notInt"] }
        guardNegativeException { int64Value <~ map["NoSuchKey"] }
        guardNegativeException { int64Value <~ map["noValue"] }
        
        let value: Int! = Int(JSONString["int"]!)
        var intValue: Int! = 0
        intValue <~ map["int"]
        XCTAssertEqual(intValue, value)
        // Negative
        guardNegativeException { intValue <~ map2["notInt"] }
        guardNegativeException { intValue <~ map["NoSuchKey"] }
        guardNegativeException { intValue <~ map["noValue"] }
        
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
}
// ----------------------------------------------------------------------------
