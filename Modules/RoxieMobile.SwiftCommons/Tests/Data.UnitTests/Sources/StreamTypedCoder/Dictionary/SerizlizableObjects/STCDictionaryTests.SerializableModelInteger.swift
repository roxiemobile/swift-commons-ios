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

extension STCDictionaryTests
{
// MARK: - Tests

    func testSerializableModel_UnsignetIntegers() {

        let _uI8Object = [JsonKeys.object: STCUnsignedInteger8Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI8Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI8Result: [String: STCUnsignedInteger8Model]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: STCUnsignedInteger8Model] {
                _uI8Result = value
            }
            XCTAssertEqual(_uI8Object, (_uI8Result)!)
        }

        // --

        let _uI16Object = [JsonKeys.object: STCUnsignedInteger16Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI16Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI16Result: [String: STCUnsignedInteger16Model]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: STCUnsignedInteger16Model] {
                _uI16Result = value
            }
            XCTAssertEqual(_uI16Object, (_uI16Result)!)
        }

        // --

        let _uI32Object = [JsonKeys.object: STCUnsignedInteger32Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI32Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI32Result: [String: STCUnsignedInteger32Model]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: STCUnsignedInteger32Model] {
                _uI32Result = value
            }
            XCTAssertEqual(_uI32Object, (_uI32Result)!)
        }

        // --

        let _uI64Object = [JsonKeys.object: STCUnsignedInteger64Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI64Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI64Result: [String: STCUnsignedInteger64Model]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: STCUnsignedInteger64Model] {
                _uI64Result = value
            }
            XCTAssertEqual(_uI64Object, (_uI64Result)!)
        }

        // --

        let _uIObject = [JsonKeys.object: STCUnsignedIntegerModel.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uIObject)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uIResult: [String: STCUnsignedIntegerModel]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: STCUnsignedIntegerModel] {
                _uIResult = value
            }
            XCTAssertEqual(_uIObject, (_uIResult)!)
        }
    }

    func testSerializableModel_SignetIntegers() {

        let _i8Object = [JsonKeys.object: STCSignedInteger8Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i8Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i8Result: [String: STCSignedInteger8Model]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: STCSignedInteger8Model] {
                _i8Result = value
            }
            XCTAssertEqual(_i8Object, (_i8Result)!)
        }

        // --

        let _i16Object = [JsonKeys.object: STCSignedInteger16Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i16Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i16Result: [String: STCSignedInteger16Model]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: STCSignedInteger16Model] {
                _i16Result = value
            }
            XCTAssertEqual(_i16Object, (_i16Result)!)
        }

        // --

        let _i32Object = [JsonKeys.object: STCSignedInteger32Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i32Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i32Result: [String: STCSignedInteger32Model]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: STCSignedInteger32Model] {
                _i32Result = value
            }
            XCTAssertEqual(_i32Object, (_i32Result)!)
        }

        // --

        let _i64Object = [JsonKeys.object: STCSignedInteger64Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i64Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i64Result: [String: STCSignedInteger64Model]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: STCSignedInteger64Model] {
                _i64Result = value
            }
            XCTAssertEqual(_i64Object, (_i64Result)!)
        }

        // --

        let _iObject = [JsonKeys.object: STCSignedIntegerModel.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_iObject)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _iResult: [String: STCSignedIntegerModel]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: STCSignedIntegerModel] {
                _iResult = value
            }
            XCTAssertEqual(_iObject, (_iResult)!)
        }
    }
}

// ----------------------------------------------------------------------------
