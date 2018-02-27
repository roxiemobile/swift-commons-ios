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
import XCTest

// ----------------------------------------------------------------------------

class SwiftCommonsData_UnitTests: XCTestCase
{
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testBasicInteger() {
        
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        /// SignedInteger Positive results
        let int8Positive: Int8 = 2
        int8Positive>>>map["int8"]
        XCTAssertNotNil(map.JSON["int8"])
        
        let int16Positive: Int16 = 30
        int16Positive>>>map["int16"]
        XCTAssertNotNil(map.JSON["int16"])
        
        let int32Positive: Int32 = -40
        int32Positive>>>map["int32"]
        XCTAssertNotNil(map.JSON["int32"])
        
        let int64Positive: Int64 = 23123
        int64Positive>>>map["int64"]
        XCTAssertNotNil(map.JSON["int64"])
        
        let intPositive: Int = 222
        intPositive>>>map["int"]
        XCTAssertNotNil(map.JSON["int"])
        
        
        /// UnsignedInteger Positive results
        let uInt8Positive: UInt8 = 2
        uInt8Positive>>>map["uInt8"]
        XCTAssertNotNil(map.JSON["uInt8"])
        
        let uInt16Positive: UInt16 = 30
        int16Positive>>>map["uInt16"]
        XCTAssertNotNil(map.JSON["uInt16"])
        
        let uInt32Positive: UInt32 = 40
        int32Positive>>>map["uInt32"]
        XCTAssertNotNil(map.JSON["uInt32"])
        
        let uInt64Positive: UInt64 = 23123
        int64Positive>>>map["uInt64"]
        XCTAssertNotNil(map.JSON["uInt64"])
        
        let uIntPositive: UInt = 222
        uIntPositive>>>map["uInt"]
        XCTAssertNotNil(map.JSON["uInt"])
        
    }
    
    func testOptionalInteger() {
        
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        /// SignedInteger Positive results
        let int8Positive: Int8? = 2
        int8Positive>>>map["int8"]
        XCTAssertNotNil(map.JSON["int8"])
        
        let int16Positive: Int16? = 30
        int16Positive>>>map["int16"]
        XCTAssertNotNil(map.JSON["int16"])
        
        let int32Positive: Int32? = -40
        int32Positive>>>map["int32"]
        XCTAssertNotNil(map.JSON["int32"])
        
        let int64Positive: Int64? = 23123
        int64Positive>>>map["int64"]
        XCTAssertNotNil(map.JSON["int64"])
        
        let intPositive: Int? = 222
        intPositive>>>map["int"]
        XCTAssertNotNil(map.JSON["int"])
        
        
        /// UnsignedInteger Positive results
        let uInt8Positive: UInt8? = 2
        uInt8Positive>>>map["uInt8"]
        XCTAssertNotNil(map.JSON["uInt8"])
        
        let uInt16Positive: UInt16? = 30
        int16Positive>>>map["uInt16"]
        XCTAssertNotNil(map.JSON["uInt16"])
        
        let uInt32Positive: UInt32? = 40
        int32Positive>>>map["uInt32"]
        XCTAssertNotNil(map.JSON["uInt32"])
        
        let uInt64Positive: UInt64? = 23123
        int64Positive>>>map["uInt64"]
        XCTAssertNotNil(map.JSON["uInt64"])
        
        let uIntPositive: UInt? = 222
        uIntPositive>>>map["uInt"]
        XCTAssertNotNil(map.JSON["uInt"])
        
    }
    
    func testImplicitlyUnwrappedOptionalInteger() {
        
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        /// SignedInteger Positive results
        let int8Positive: Int8! = 2
        int8Positive>>>map["int8"]
        XCTAssertNotNil(map.JSON["int8"])
        
        let int16Positive: Int16! = 30
        int16Positive>>>map["int16"]
        XCTAssertNotNil(map.JSON["int16"])
        
        let int32Positive: Int32! = -40
        int32Positive>>>map["int32"]
        XCTAssertNotNil(map.JSON["int32"])
        
        let int64Positive: Int64! = 23123
        int64Positive>>>map["int64"]
        XCTAssertNotNil(map.JSON["int64"])
        
        let intPositive: Int! = 222
        intPositive>>>map["int"]
        XCTAssertNotNil(map.JSON["int"])
        
        
        /// UnsignedInteger Positive results
        let uInt8Positive: UInt8! = 2
        uInt8Positive>>>map["uInt8"]
        XCTAssertNotNil(map.JSON["uInt8"])
        
        let uInt16Positive: UInt16! = 30
        int16Positive>>>map["uInt16"]
        XCTAssertNotNil(map.JSON["uInt16"])
        
        let uInt32Positive: UInt32! = 40
        int32Positive>>>map["uInt32"]
        XCTAssertNotNil(map.JSON["uInt32"])
        
        let uInt64Positive: UInt64! = 23123
        int64Positive>>>map["uInt64"]
        XCTAssertNotNil(map.JSON["uInt64"])
        
        let uIntPositive: UInt! = 222
        uIntPositive>>>map["uInt"]
        XCTAssertNotNil(map.JSON["uInt"])
        
    }
}





fileprivate class TestSignedInt: Mappable {
    var int8: Int8?
    var int16: Int16?
    var int32: Int32?
    var int64: Int64?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        int8     <~ map["int8"]
        int16    <~ map["int16"]
        int32    <~ map["int32"]
        int64    <~ map["int64"]
        
    }
}

fileprivate class TestUnSignedInt: Mappable {
    var uInt8: UInt8?
    var uInt16: UInt16?
    var uInt32: UInt32?
    var uInt64: UInt64?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        uInt8     <~ map["uInt8"]
        uInt16    <~ map["uInt16"]
        uInt32    <~ map["uInt32"]
        uInt64    <~ map["uInt64"]
    }
}
// ----------------------------------------------------------------------------
