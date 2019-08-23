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

    func testSerializableModel_Float() {

        let _f32Object: [STCFloat32Model]? = [STCFloat32Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_f32Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _f32Result: [STCFloat32Model]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [STCFloat32Model] {
                _f32Result = value
            }
            XCTAssertEqual(_f32Object, _f32Result)
        }

        // --

        let _f64Object: [STCFloat64Model]? = [STCFloat64Model.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_f64Object)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _f64Result: [STCFloat64Model]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [STCFloat64Model] {
                _f64Result = value
            }
            XCTAssertEqual(_f64Object, _f64Result)
        }

        // --

        let _fObject: [STCFloatModel]? = [STCFloatModel.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_fObject)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _fResult: [STCFloatModel]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [STCFloatModel] {
                _fResult = value
            }
            XCTAssertEqual(_fObject, _fResult)
        }
    }
}

// ----------------------------------------------------------------------------
