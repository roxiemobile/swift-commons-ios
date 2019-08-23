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

extension STCSetTests
{
// MARK: - Tests

    func testFloat() {

        weak var weakSelf = self

        let _fValue: Set<Float> = [0.4]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_fValue)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _fResult = Set<Float>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_fResult, from: value)
            }
            XCTAssertEqual(_fValue, _fResult)
        }

        // --

        let _f32Value: Set<Float32> = [0.4]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_f32Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _f32Result = Set<Float32>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_f32Result, from: value)
            }
            XCTAssertEqual(_f32Value, _f32Result)
        }

        // --

        let _f64Value: Set<Float64> = [0.4]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_f64Value)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _f64Result = Set<Float64>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                weakSelf?.transform(set: &_f64Result, from: value)
            }
            XCTAssertEqual(_f64Value, _f64Result)
        }
    }
}

// ----------------------------------------------------------------------------
