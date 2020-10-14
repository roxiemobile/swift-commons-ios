// ----------------------------------------------------------------------------
//
//  MessagePackCoderTest.BasicTypes.swift
//
//  @author     Aleksandr Serov <serov-ae@roxiemobile.com> 
//  @copyright  Copyright (c) 2020, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import SwiftCommonsLang
import XCTest

// ----------------------------------------------------------------------------

extension MessagePackCoderTest
{
    //MARK:- Tests
    
    func testBasicType_Boolean() {
        
        assertNoThrow {
            let value: Bool = true
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
        
    }
    
    func testBasicType_SignedInteger() {
        
        assertNoThrow {
            let value: Int8 = Int8.min
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
        assertNoThrow {
            let value: Int16 = Int16.min
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
        assertNoThrow {
            let value: Int32 = Int32.min
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
        assertNoThrow {
            let value: Int64 = Int64.min
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
        assertNoThrow {
            let value: Int = Int.min
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
        
    }
    
    func testBasicType_UnsignedInteger() {
        
        assertNoThrow {
            let value: UInt8 = UInt8.max
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
        assertNoThrow {
            let value: UInt16 = UInt16.max
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
        assertNoThrow {
            let value: UInt32 = UInt32.max
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
        assertNoThrow {
            let value: UInt64 = UInt64.max
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
        assertNoThrow {
            let value: UInt = UInt.max
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
        
    }
    
    
    func testBasicType_Float() {
        
        assertNoThrow {
            let value: Float32 = Constants.float32Value
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
        
        assertNoThrow {
            let value: Float64 = Constants.float64Value
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
        
        assertNoThrow {
            let value: Float = Constants.floatValue
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
    }
    
    func testBasicType_Double() {
        
        assertNoThrow {
            let value: Double = Constants.doubleValue
            XCTAssertEqual(value, self.cloneSimpleObject(value))
        }
    }
    
    func testBasicType_String() {
        assertNoThrow {
            let value: String = Constants.stringValue
            XCTAssertEqual(value, self.cloneSimpleObject(value))
            
        }
    }
}

// ----------------------------------------------------------------------------
