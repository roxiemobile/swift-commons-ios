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

extension STCArrayTests
{
// MARK: - Tests

    func testSerializableModel_Float() {

        let _f32Object: [STCFloat32Model]? = [STCFloat32Model.shared]

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_f32Object)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _f32Result: [STCFloat32Model]?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [STCFloat32Model] {
//                _f32Result = value
//            }
//            XCTAssertEqual(_f32Object, _f32Result)
        }

        // --

        let _f64Object: [STCFloat64Model]? = [STCFloat64Model.shared]

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_f64Object)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _f64Result: [STCFloat64Model]?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [STCFloat64Model] {
//                _f64Result = value
//            }
//            XCTAssertEqual(_f64Object, _f64Result)
        }

        // --

        let _fObject: [STCFloatModel]? = [STCFloatModel.shared]

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_fObject)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _fResult: [STCFloatModel]?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [STCFloatModel] {
//                _fResult = value
//            }
//            XCTAssertEqual(_fObject, _fResult)
        }
    }

    func testSerializableModel_Float_TSC() {

        let _f32Object: [STCFloat32Model]! = [STCFloat32Model.shared]

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_f32Object)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _f32Result: [STCFloat32Model]?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? [STCFloat32Model] {
                _f32Result = value
            }
            XCTAssertEqual(_f32Object, _f32Result)
        }

        // --

        let _f64Object: [STCFloat64Model]! = [STCFloat64Model.shared]

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_f64Object)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _f64Result: [STCFloat64Model]?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? [STCFloat64Model] {
                _f64Result = value
            }
            XCTAssertEqual(_f64Object, _f64Result)
        }

        // --

        let _fObject: [STCFloatModel]! = [STCFloatModel.shared]

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_fObject)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _fResult: [STCFloatModel]?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? [STCFloatModel] {
                _fResult = value
            }
            XCTAssertEqual(_fObject, _fResult)
        }
    }
}

// ----------------------------------------------------------------------------
