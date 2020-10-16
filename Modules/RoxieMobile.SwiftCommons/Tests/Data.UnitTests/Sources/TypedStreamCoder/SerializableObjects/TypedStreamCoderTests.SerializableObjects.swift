// ----------------------------------------------------------------------------
//
//  TypedStreamCoderTests.SerializableObjects.swift
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

    func testSerializableObject_Boolean() {

        assertNoThrow {
            let object: STCBoolModel = STCBoolModel.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testSerializableObject_SignedInteger() {

        assertNoThrow {
            let object: STCSignedInteger8Model = STCSignedInteger8Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: STCSignedInteger16Model = STCSignedInteger16Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: STCSignedInteger32Model = STCSignedInteger32Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: STCSignedInteger64Model = STCSignedInteger64Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: STCSignedIntegerModel = STCSignedIntegerModel.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testSerializableObject_UnsignedInteger() {

        assertNoThrow {
            let object: STCUnsignedInteger8Model = STCUnsignedInteger8Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: STCUnsignedInteger16Model = STCUnsignedInteger16Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: STCUnsignedInteger32Model = STCUnsignedInteger32Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: STCUnsignedInteger64Model = STCUnsignedInteger64Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: STCUnsignedIntegerModel = STCUnsignedIntegerModel.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testSerializableObject_Float() {

        assertNoThrow {
            let object: STCFloat32Model = STCFloat32Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: STCFloat64Model = STCFloat64Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: STCFloatModel = STCFloatModel.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testSerializableObject_Double() {

        assertNoThrow {
            let object: STCDoubleModel = STCDoubleModel.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testSerializableObject_String() {

        assertNoThrow {
            let object: STCStringModel = STCStringModel.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }
}

// ----------------------------------------------------------------------------
