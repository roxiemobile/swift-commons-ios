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

extension STCArrayTests
{
// MARK: - Tests

    func testUnsignedIntegers() {

        let _uI8Value: [UInt8] = [UInt8.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI8Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI8Result: [UInt8]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [UInt8] {
                _uI8Result = value
            }
            XCTAssertEqual(_uI8Value, (_uI8Result)!)
        }

        // --

        let _uI16Value: [UInt16] = [UInt16.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI16Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI16Result: [UInt16]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [UInt16] {
                _uI16Result = value
            }
            XCTAssertEqual(_uI16Value, (_uI16Result)!)
        }

        // --

        let _uI32Value: [UInt32] = [UInt32.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI32Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI32Result: [UInt32]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [UInt32] {
                _uI32Result = value
            }
            XCTAssertEqual(_uI32Value, (_uI32Result)!)
        }

        // --

        let _uI64Value: [UInt64] = [UInt64.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI64Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI64Result: [UInt64]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [UInt64] {
                _uI64Result = value
            }
            XCTAssertEqual(_uI64Value, (_uI64Result)!)
        }

        // --

        let _uIValue: [UInt] = [UInt.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uIValue)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uIResult: [UInt]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [UInt] {
                _uIResult = value
            }
            XCTAssertEqual(_uIValue, (_uIResult)!)
        }
    }

    func testSignedIntegers() {

        let _i8Value: [Int8] = [Int8.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i8Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i8Result: [Int8]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [Int8] {
                _i8Result = value
            }
            XCTAssertEqual(_i8Value, (_i8Result)!)
        }

        // --

        let _i16Value: [Int16] = [Int16.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i16Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i16Result: [Int16]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [Int16] {
                _i16Result = value
            }
            XCTAssertEqual(_i16Value, (_i16Result)!)
        }

        // --

        let _i32Value: [Int32] = [Int32.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i32Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i32Result: [Int32]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [Int32] {
                _i32Result = value
            }
            XCTAssertEqual(_i32Value, (_i32Result)!)
        }

        // --

        let _i64Value: [Int64] = [Int64.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i64Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i64Result: [Int64]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [Int64] {
                _i64Result = value
            }
            XCTAssertEqual(_i64Value, (_i64Result)!)
        }

        // --

        let _iValue: [Int] = [Int.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_iValue)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _iResult: [Int]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [Int] {
                _iResult = value
            }
            XCTAssertEqual(_iValue, (_iResult)!)
        }
    }
}

// ----------------------------------------------------------------------------
