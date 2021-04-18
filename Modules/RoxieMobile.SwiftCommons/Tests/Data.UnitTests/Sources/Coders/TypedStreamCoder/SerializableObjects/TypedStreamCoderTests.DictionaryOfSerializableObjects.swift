// ----------------------------------------------------------------------------
//
//  TypedStreamCoderTests.DictionaryOfSerializableObjects.swift
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

    func testDictionaryOf_SerializableObject_Boolean() {

        assertNoThrow {
            let object: [String: BoolModel] = [JsonKeys.object: BoolModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_SerializableObject_SignedInteger() {

        assertNoThrow {
            let object: [String: Int8Model] = [JsonKeys.object: Int8Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: Int16Model] = [JsonKeys.object: Int16Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: Int32Model] = [JsonKeys.object: Int32Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: Int64Model] = [JsonKeys.object: Int64Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: IntModel] = [JsonKeys.object: IntModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_SerializableObject_UnsignedInteger() {

        assertNoThrow {
            let object: [String: UInt8Model] = [JsonKeys.object: UInt8Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: UInt16Model] = [JsonKeys.object: UInt16Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: UInt32Model] = [JsonKeys.object: UInt32Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: UInt64Model] = [JsonKeys.object: UInt64Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: UIntModel] = [JsonKeys.object: UIntModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_SerializableObject_Float() {

        assertNoThrow {
            let object: [String: Float32Model] = [JsonKeys.object: Float32Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: Float64Model] = [JsonKeys.object: Float64Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: FloatModel] = [JsonKeys.object: FloatModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_SerializableObject_Double() {

        assertNoThrow {
            let object: [String: DoubleModel] = [JsonKeys.object: DoubleModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_SerializableObject_String() {

        assertNoThrow {
            let object: [String: StringModel] = [JsonKeys.object: StringModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }
}
