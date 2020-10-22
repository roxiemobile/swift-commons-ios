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

extension TypedStreamCoderTests {
// MARK: - Tests

    func testSerializableObject_Boolean() {

        assertNoThrow {
            let object: BoolModel = BoolModel.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testSerializableObject_SignedInteger() {

        assertNoThrow {
            let object: SignedInteger8Model = SignedInteger8Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: SignedInteger16Model = SignedInteger16Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: SignedInteger32Model = SignedInteger32Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: SignedInteger64Model = SignedInteger64Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: SignedIntegerModel = SignedIntegerModel.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testSerializableObject_UnsignedInteger() {

        assertNoThrow {
            let object: UnsignedInteger8Model = UnsignedInteger8Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: UnsignedInteger16Model = UnsignedInteger16Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: UnsignedInteger32Model = UnsignedInteger32Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: UnsignedInteger64Model = UnsignedInteger64Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: UnsignedIntegerModel = UnsignedIntegerModel.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testSerializableObject_Float() {

        assertNoThrow {
            let object: Float32Model = Float32Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: Float64Model = Float64Model.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: FloatModel = FloatModel.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testSerializableObject_Double() {

        assertNoThrow {
            let object: DoubleModel = DoubleModel.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testSerializableObject_String() {

        assertNoThrow {
            let object: StringModel = StringModel.shared
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }
}
