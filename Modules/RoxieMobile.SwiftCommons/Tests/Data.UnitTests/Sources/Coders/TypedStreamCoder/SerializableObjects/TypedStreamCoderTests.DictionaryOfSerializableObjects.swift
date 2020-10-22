// ----------------------------------------------------------------------------
//
//  TypedStreamCoderTests.DictionaryOfSerializableObjects.swift
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

    func testDictionaryOf_SerializableObject_Boolean() {

        assertNoThrow {
            let object: [String: BoolModel] = [JsonKeys.object: BoolModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_SerializableObject_SignedInteger() {

        assertNoThrow {
            let object: [String: SignedInteger8Model] = [JsonKeys.object: SignedInteger8Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: SignedInteger16Model] = [JsonKeys.object: SignedInteger16Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: SignedInteger32Model] = [JsonKeys.object: SignedInteger32Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: SignedInteger64Model] = [JsonKeys.object: SignedInteger64Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: SignedIntegerModel] = [JsonKeys.object: SignedIntegerModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_SerializableObject_UnsignedInteger() {

        assertNoThrow {
            let object: [String: UnsignedInteger8Model] = [JsonKeys.object: UnsignedInteger8Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: UnsignedInteger16Model] = [JsonKeys.object: UnsignedInteger16Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: UnsignedInteger32Model] = [JsonKeys.object: UnsignedInteger32Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: UnsignedInteger64Model] = [JsonKeys.object: UnsignedInteger64Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: UnsignedIntegerModel] = [JsonKeys.object: UnsignedIntegerModel.shared]
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

// ----------------------------------------------------------------------------
