// ----------------------------------------------------------------------------
//
//  TypedStreamCoderTests.ArrayOfBasicTypes.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import SwiftCommonsLang
import XCTest

// ----------------------------------------------------------------------------

extension TypedStreamCoderTests {

// MARK: - Tests

    func testArrayOf_BasicType_Boolean() {

        assertNoThrow {
            let object: [Bool] = [true]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testArrayOf_BasicType_SignedInteger() {

        assertNoThrow {
            let object: [Int8] = [Int8.min]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [Int16] = [Int16.min]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [Int32] = [Int32.min]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [Int64] = [Int64.min]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [Int] = [Int.min]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testArrayOf_BasicType_UnsignedInteger() {

        assertNoThrow {
            let object: [UInt8] = [UInt8.max]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [UInt16] = [UInt16.max]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [UInt32] = [UInt32.max]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [UInt64] = [UInt64.max]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [UInt] = [UInt.max]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testArrayOf_BasicType_Float() {

        assertNoThrow {
            let object: [Float32] = [Float32.pi]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [Float64] = [Float64.pi]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [Float] = [Float.pi]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testArrayOf_BasicType_Double() {

        assertNoThrow {
            let object: [Double] = [Double.pi]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testArrayOf_BasicType_String() {

        assertNoThrow {
            let object: [String] = [Constants.stringValue]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }
}
