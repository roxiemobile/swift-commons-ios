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

extension TypedStreamCoderTests
{
// MARK: - Tests

    func testDictionaryOf_SerializableObject_Boolean() {

        assertNoThrow {
            let object: [String: STCBoolModel] = [JsonKeys.object: STCBoolModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_SerializableObject_SignedInteger() {

        assertNoThrow {
            let object: [String: STCSignedInteger8Model] = [JsonKeys.object: STCSignedInteger8Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: STCSignedInteger16Model] = [JsonKeys.object: STCSignedInteger16Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: STCSignedInteger32Model] = [JsonKeys.object: STCSignedInteger32Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: STCSignedInteger64Model] = [JsonKeys.object: STCSignedInteger64Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: STCSignedIntegerModel] = [JsonKeys.object: STCSignedIntegerModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_SerializableObject_UnsignedInteger() {

        assertNoThrow {
            let object: [String: STCUnsignedInteger8Model] = [JsonKeys.object: STCUnsignedInteger8Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: STCUnsignedInteger16Model] = [JsonKeys.object: STCUnsignedInteger16Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: STCUnsignedInteger32Model] = [JsonKeys.object: STCUnsignedInteger32Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: STCUnsignedInteger64Model] = [JsonKeys.object: STCUnsignedInteger64Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: STCUnsignedIntegerModel] = [JsonKeys.object: STCUnsignedIntegerModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_SerializableObject_Float() {

        assertNoThrow {
            let object: [String: STCFloat32Model] = [JsonKeys.object: STCFloat32Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: STCFloat64Model] = [JsonKeys.object: STCFloat64Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [String: STCFloatModel] = [JsonKeys.object: STCFloatModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_SerializableObject_Double() {

        assertNoThrow {
            let object: [String: STCDoubleModel] = [JsonKeys.object: STCDoubleModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testDictionaryOf_SerializableObject_String() {

        assertNoThrow {
            let object: [String: STCStringModel] = [JsonKeys.object: STCStringModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }
}

// ----------------------------------------------------------------------------
