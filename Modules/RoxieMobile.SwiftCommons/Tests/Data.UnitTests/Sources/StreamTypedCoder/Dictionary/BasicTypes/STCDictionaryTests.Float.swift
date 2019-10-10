// ----------------------------------------------------------------------------
//
//  STCFloat.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
@testable import SwiftCommonsObjC
import XCTest

// ----------------------------------------------------------------------------

extension STCDictionaryTests
{
// MARK: - Tests

    func testFloat() {

        let _fValue: [String: Float]? = [JsonKeys.value: Constants.floatValue]

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_fValue)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _fResult: [String: Float]?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: Float] {
//                _fResult = value
//            }
//            XCTAssertEqual(_fValue, _fResult)
        }

        // --

        let _f32Value: [String: Float32]? = [JsonKeys.value: Constants.float32Value]

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_f32Value)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _f32Result: [String: Float32]?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: Float32] {
//                _f32Result = value
//            }
//            XCTAssertEqual(_f32Value, _f32Result)
        }

        // --

        let _f64Value: [String: Float64]? = [JsonKeys.value: Constants.float64Value]

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_f64Value)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _f64Result: [String: Float64]?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: Float64] {
//                _f64Result = value
//            }
//            XCTAssertEqual(_f64Value, _f64Result)
        }
    }

    func testFloat_TSC() {

        let _fValue: [String: Float]! = [JsonKeys.value: Constants.floatValue]

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_fValue)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _fResult: [String: Float]?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? [String: Float] {
                _fResult = value
            }
            XCTAssertEqual(_fValue, _fResult)
        }

        // --

        let _f32Value: [String: Float32]! = [JsonKeys.value: Constants.float32Value]

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_f32Value)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _f32Result: [String: Float32]?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? [String: Float32] {
                _f32Result = value
            }
            XCTAssertEqual(_f32Value, _f32Result)
        }

        // --

        let _f64Value: [String: Float64]! = [JsonKeys.value: Constants.float64Value]

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_f64Value)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _f64Result: [String: Float64]?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? [String: Float64] {
                _f64Result = value
            }
            XCTAssertEqual(_f64Value, _f64Result)
        }
    }
}

// ----------------------------------------------------------------------------
