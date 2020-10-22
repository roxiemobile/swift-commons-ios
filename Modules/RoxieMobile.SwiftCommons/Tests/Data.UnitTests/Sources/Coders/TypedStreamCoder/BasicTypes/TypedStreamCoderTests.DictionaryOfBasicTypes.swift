// ----------------------------------------------------------------------------
//
//  TypedStreamCoderTests.DictionaryOfBasicTypes.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import SwiftCommonsLang
import XCTest

// ----------------------------------------------------------------------------

extension TypedStreamCoderTests {

// MARK: - Tests

    func testDictionaryOf_BasicType_Boolean() {

        assertNoThrow {
            let object: [String: Bool] = [JsonKeys.value: true]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_BasicType_SignedInteger() {

        assertNoThrow {
            let object: [String: Int8] = [JsonKeys.value: Int8.min]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: Int16] = [JsonKeys.value: Int16.min]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: Int32] = [JsonKeys.value: Int32.min]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: Int64] = [JsonKeys.value: Int64.min]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: Int] = [JsonKeys.value: Int.min]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_BasicType_UnsignedInteger() {

        assertNoThrow {
            let object: [String: UInt8] = [JsonKeys.value: UInt8.max]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: UInt16] = [JsonKeys.value: UInt16.max]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: UInt32] = [JsonKeys.value: UInt32.max]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: UInt64] = [JsonKeys.value: UInt64.max]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: UInt] = [JsonKeys.value: UInt.max]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_BasicType_Float() {

        assertNoThrow {
            let object: [String: Float32] = [JsonKeys.value: Constants.float32Value]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: Float64] = [JsonKeys.value: Constants.float64Value]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: Float] = [JsonKeys.value: Constants.floatValue]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_BasicType_Double() {

        assertNoThrow {
            let object: [String: Double] = [JsonKeys.value: Constants.doubleValue]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_BasicType_String() {

        assertNoThrow {
            let object: [String: String] = [JsonKeys.value: Constants.stringValue]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }
}
