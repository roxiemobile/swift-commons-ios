// ----------------------------------------------------------------------------
//
//  STCInteger.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsObjC
import XCTest

// ----------------------------------------------------------------------------

extension STCSetTests
{
// MARK: - Tests

    func testSerializableModel_UnsignetIntegers() {

         weak var weakSelf = self

        let _uI8Object: Set<STCUnsignedInteger8Model> = [STCUnsignedInteger8Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI8Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI8Result = Set<STCUnsignedInteger8Model>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_uI8Result, from: value)
            }
            XCTAssertEqual(_uI8Object, _uI8Result)
        }

        // --

        let _uI16Object: Set<STCUnsignedInteger16Model> = [STCUnsignedInteger16Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI16Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI16Result = Set<STCUnsignedInteger16Model>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_uI16Result, from: value)
            }
            XCTAssertEqual(_uI16Object, _uI16Result)
        }

        // --

        let _uI32Object: Set<STCUnsignedInteger32Model> = [STCUnsignedInteger32Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI32Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI32Result = Set<STCUnsignedInteger32Model>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_uI32Result, from: value)
            }
            XCTAssertEqual(_uI32Object, _uI32Result)
        }

        // --

        let _uI64Object: Set<STCUnsignedInteger64Model> = [STCUnsignedInteger64Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI64Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI64Result = Set<STCUnsignedInteger64Model>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_uI64Result, from: value)
            }
            XCTAssertEqual(_uI64Object, _uI64Result)
        }

        // --

        let _uIObject: Set<STCUnsignedIntegerModel> = [STCUnsignedIntegerModel.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uIObject)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uIResult = Set<STCUnsignedIntegerModel>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_uIResult, from: value)
            }
            XCTAssertEqual(_uIObject, _uIResult)
        }
    }

    func testSerializableModel_SignetIntegers() {

         weak var weakSelf = self

        let _i8Object: Set<STCSignedInteger8Model> = [STCSignedInteger8Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i8Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i8Result = Set<STCSignedInteger8Model>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_i8Result, from: value)
            }
            XCTAssertEqual(_i8Object, _i8Result)
        }

        // --

        let _i16Object: Set<STCSignedInteger16Model> = [STCSignedInteger16Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i16Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i16Result = Set<STCSignedInteger16Model>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_i16Result, from: value)
            }
            XCTAssertEqual(_i16Object, _i16Result)
        }

        // --

        let _i32Object: Set<STCSignedInteger32Model> = [STCSignedInteger32Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i32Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i32Result = Set<STCSignedInteger32Model>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_i32Result, from: value)
            }
            XCTAssertEqual(_i32Object, _i32Result)
        }

        // --

        let _i64Object: Set<STCSignedInteger64Model> = [STCSignedInteger64Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i64Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i64Result = Set<STCSignedInteger64Model>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_i64Result, from: value)
            }
            XCTAssertEqual(_i64Object, _i64Result)
        }

        // --

        let _iObject: Set<STCSignedIntegerModel> = [STCSignedIntegerModel.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_iObject)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _iResult = Set<STCSignedIntegerModel>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_iResult, from: value)
            }
            XCTAssertEqual(_iObject, _iResult)
        }
    }
}

// ----------------------------------------------------------------------------
