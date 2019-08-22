// ----------------------------------------------------------------------------
//
//  STCFloat.swift
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

    func testFloat() {

        let _fValue: [Float] = [0.4]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_fValue)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _fResult: [Float]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [Float] {
                _fResult = value
            }
            XCTAssertEqual(_fValue, (_fResult)!)
        }

        // --

        let _f32Value: [Float32] = [0.4]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_f32Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _f32Result: [Float32]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [Float32] {
                _f32Result = value
            }
            XCTAssertEqual(_f32Value, (_f32Result)!)
        }

        // --

        let _f64Value: [Float64] = [0.4]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_f64Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _f64Result: [Float64]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [Float64] {
                _f64Result = value
            }
            XCTAssertEqual(_f64Value, (_f64Result)!)
        }
    }
}

// ----------------------------------------------------------------------------
