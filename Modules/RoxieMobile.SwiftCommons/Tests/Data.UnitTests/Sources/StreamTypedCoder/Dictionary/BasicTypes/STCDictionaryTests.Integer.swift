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

    func testUnsignedIntegers() {

        let _uI8Value: [String: UInt8] = [JsonKeys.value: UInt8.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI8Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI8Result: [String: UInt8]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: UInt8] {
                _uI8Result = value
            }
            XCTAssertEqual(_uI8Value, (_uI8Result)!)
        }

        // --

        let _uI16Value: [String: UInt16] = [JsonKeys.value: UInt16.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI16Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI16Result: [String: UInt16]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: UInt16] {
                _uI16Result = value
            }
            XCTAssertEqual(_uI16Value, (_uI16Result)!)
        }

        // --

        let _uI32Value: [String: UInt32] = [JsonKeys.value: UInt32.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI32Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI32Result: [String: UInt32]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: UInt32] {
                _uI32Result = value
            }
            XCTAssertEqual(_uI32Value, (_uI32Result)!)
        }

        // --

        let _uI64Value: [String: UInt64] = [JsonKeys.value: UInt64.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI64Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI64Result: [String: UInt64]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: UInt64] {
                _uI64Result = value
            }
            XCTAssertEqual(_uI64Value, (_uI64Result)!)
        }

        // --

        let _uIValue: [String: UInt] = [JsonKeys.value: UInt.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uIValue)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uIResult: [String: UInt]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: UInt] {
                _uIResult = value
            }
            XCTAssertEqual(_uIValue, (_uIResult)!)
        }
    }

    func testSignedIntegers() {

        let _i8Value: [String: Int8] = [JsonKeys.value: Int8.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i8Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i8Result: [String: Int8]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: Int8] {
                _i8Result = value
            }
            XCTAssertEqual(_i8Value, (_i8Result)!)
        }

        // --

        let _i16Value: [String: Int16] = [JsonKeys.value: Int16.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i16Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i16Result: [String: Int16]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: Int16] {
                _i16Result = value
            }
            XCTAssertEqual(_i16Value, (_i16Result)!)
        }

        // --

        let _i32Value: [String: Int32] = [JsonKeys.value: Int32.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i32Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i32Result: [String: Int32]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: Int32] {
                _i32Result = value
            }
            XCTAssertEqual(_i32Value, (_i32Result)!)
        }

        // --

        let _i64Value: [String: Int64] = [JsonKeys.value: Int64.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i64Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i64Result: [String: Int64]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: Int64] {
                _i64Result = value
            }
            XCTAssertEqual(_i64Value, (_i64Result)!)
        }

        // --

        let _iValue: [String: Int] = [JsonKeys.value: Int.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_iValue)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _iResult: [String: Int]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: Int] {
                _iResult = value
            }
            XCTAssertEqual(_iValue, (_iResult)!)
        }
    }
}

// ----------------------------------------------------------------------------
