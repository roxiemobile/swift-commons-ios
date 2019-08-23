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

    func testUnsignedIntegers() {

        weak var weakSelf = self

        let _uI8Value: Set<UInt8> = [UInt8.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI8Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI8Result = Set<UInt8>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_uI8Result, from: value)
            }
            XCTAssertEqual(_uI8Value, _uI8Result)
        }

        // --

        let _uI16Value: Set<UInt16> = [UInt16.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI16Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI16Result = Set<UInt16>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_uI16Result, from: value)
            }
            XCTAssertEqual(_uI16Value, _uI16Result)
        }

        // --

        let _uI32Value: Set<UInt32> = [UInt32.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI32Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI32Result = Set<UInt32>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_uI32Result, from: value)
            }
            XCTAssertEqual(_uI32Value, _uI32Result)
        }

        // --

        let _uI64Value: Set<UInt64> = [UInt64.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI64Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uI64Result = Set<UInt64>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_uI64Result, from: value)
            }
            XCTAssertEqual(_uI64Value, _uI64Result)
        }

        // --

        let _uIValue: Set<UInt> = [UInt.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uIValue)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _uIResult = Set<UInt>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_uIResult, from: value)
            }
            XCTAssertEqual(_uIValue, _uIResult)
        }
    }

    func testSignedIntegers() {

        weak var weakSelf = self

        let _i8Value: Set<Int8> = [Int8.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i8Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i8Result = Set<Int8>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_i8Result, from: value)
            }
            XCTAssertEqual(_i8Value, _i8Result)
        }

        // --

        let _i16Value: Set<Int16> = [Int16.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i16Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i16Result = Set<Int16>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_i16Result, from: value)
            }
            XCTAssertEqual(_i16Value, _i16Result)
        }

        // --

        let _i32Value: Set<Int32> = [Int32.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i32Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i32Result = Set<Int32>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_i32Result, from: value)
            }
            XCTAssertEqual(_i32Value, _i32Result)
        }

        // --

        let _i64Value: Set<Int64> = [Int64.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i64Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _i64Result = Set<Int64>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_i64Result, from: value)
            }
            XCTAssertEqual(_i64Value, _i64Result)
        }

        // --

        let _iValue: Set<Int> = [Int.max]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_iValue)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _iResult = Set<Int>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_iResult, from: value)
            }
            XCTAssertEqual(_iValue, _iResult)
        }
    }
}

// ----------------------------------------------------------------------------
