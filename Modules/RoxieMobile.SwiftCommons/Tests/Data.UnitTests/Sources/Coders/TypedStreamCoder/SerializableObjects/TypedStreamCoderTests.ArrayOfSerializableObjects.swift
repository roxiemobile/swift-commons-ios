// ----------------------------------------------------------------------------
//
//  TypedStreamCoderTests.ArrayOfSerializableObjects.swift
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

    func testArrayOf_SerializableObject_Boolean() {

        assertNoThrow {
            let object: [BoolModel] = [BoolModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testArrayOf_SerializableObject_SignedInteger() {

        assertNoThrow {
            let object: [Int8Model] = [Int8Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [Int16Model] = [Int16Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [Int32Model] = [Int32Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [Int64Model] = [Int64Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [IntModel] = [IntModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testArrayOf_SerializableObject_UnsignedInteger() {

        assertNoThrow {
            let object: [UInt8Model] = [UInt8Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [UInt16Model] = [UInt16Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [UInt32Model] = [UInt32Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [UInt64Model] = [UInt64Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [UIntModel] = [UIntModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testArrayOf_SerializableObject_Float() {

        assertNoThrow {
            let object: [Float32Model] = [Float32Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [Float64Model] = [Float64Model.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
        assertNoThrow {
            let object: [FloatModel] = [FloatModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testArrayOf_SerializableObject_Double() {

        assertNoThrow {
            let object: [DoubleModel] = [DoubleModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }

    func testArrayOf_SerializableObject_String() {

        assertNoThrow {
            let object: [StringModel] = [StringModel.shared]
            XCTAssertEqual(object, self.cloneSimpleObject(object))
        }
    }
}
