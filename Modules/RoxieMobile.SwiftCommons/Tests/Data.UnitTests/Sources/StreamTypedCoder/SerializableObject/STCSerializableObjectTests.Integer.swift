// ----------------------------------------------------------------------------
//
//  STCInteger.swift
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

extension STCSerializableObjectTests
{
// MARK: - Tests

    func testSerializableModel_UnsignetIntegers() {

        let _uI8Object: STCUnsignedInteger8Model? = STCUnsignedInteger8Model.shared

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI8Object)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _uI8Result: STCUnsignedInteger8Model?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? STCUnsignedInteger8Model {
//                _uI8Result = value
//            }
//            XCTAssertEqual(_uI8Object, _uI8Result)
        }

        // --

        let _uI16Object: STCUnsignedInteger16Model? = STCUnsignedInteger16Model.shared

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI16Object)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _uI16Result: STCUnsignedInteger16Model?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? STCUnsignedInteger16Model {
//                _uI16Result = value
//            }
//            XCTAssertEqual(_uI16Object, _uI16Result)
        }

        // --

        let _uI32Object: STCUnsignedInteger32Model? = STCUnsignedInteger32Model.shared

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI32Object)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _uI32Result: STCUnsignedInteger32Model?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? STCUnsignedInteger32Model {
//                _uI32Result = value
//            }
//            XCTAssertEqual(_uI32Object, _uI32Result)
        }

        // --

        let _uI64Object: STCUnsignedInteger64Model? = STCUnsignedInteger64Model.shared

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uI64Object)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _uI64Result: STCUnsignedInteger64Model?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? STCUnsignedInteger64Model {
//                _uI64Result = value
//            }
//            XCTAssertEqual(_uI64Object, _uI64Result)
        }

        // --

        let _uIObject: STCUnsignedIntegerModel? = STCUnsignedIntegerModel.shared

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_uIObject)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _uIResult: STCUnsignedIntegerModel?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? STCUnsignedIntegerModel {
//                _uIResult = value
//            }
//            XCTAssertEqual(_uIObject, _uIResult)
        }
    }

    func testSerializableModel_SignetIntegers() {

        let _i8Object: STCSignedInteger8Model? = STCSignedInteger8Model.shared

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i8Object)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _i8Result: STCSignedInteger8Model?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? STCSignedInteger8Model {
//                _i8Result = value
//            }
//            XCTAssertEqual(_i8Object, _i8Result)
        }

        // --

        let _i16Object: STCSignedInteger16Model? = STCSignedInteger16Model.shared

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i16Object)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _i16Result: STCSignedInteger16Model?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? STCSignedInteger16Model {
//                _i16Result = value
//            }
//            XCTAssertEqual(_i16Object, _i16Result)
        }

        // --

        let _i32Object: STCSignedInteger32Model? = STCSignedInteger32Model.shared

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i32Object)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _i32Result: STCSignedInteger32Model?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? STCSignedInteger32Model {
//                _i32Result = value
//            }
//            XCTAssertEqual(_i32Object, _i32Result)
        }

        // --

        let _i64Object: STCSignedInteger64Model? = STCSignedInteger64Model.shared

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_i64Object)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _i64Result: STCSignedInteger64Model?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? STCSignedInteger64Model {
//                _i64Result = value
//            }
//            XCTAssertEqual(_i64Object, _i64Result)
        }

        // --

        let _iObject: STCSignedIntegerModel? = STCSignedIntegerModel.shared

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_iObject)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _iResult: STCSignedIntegerModel?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? STCSignedIntegerModel {
//                _iResult = value
//            }
//            XCTAssertEqual(_iObject, _iResult)
        }
    }

    func testSerializableModel_UnsignetIntegers_TSC() {

        let _uI8Object: STCUnsignedInteger8Model! = STCUnsignedInteger8Model.shared

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_uI8Object)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _uI8Result: STCUnsignedInteger8Model?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? STCUnsignedInteger8Model {
                _uI8Result = value
            }
            XCTAssertEqual(_uI8Object, _uI8Result)
        }

        // --

        let _uI16Object: STCUnsignedInteger16Model! = STCUnsignedInteger16Model.shared

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_uI16Object)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _uI16Result: STCUnsignedInteger16Model?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? STCUnsignedInteger16Model {
                _uI16Result = value
            }
            XCTAssertEqual(_uI16Object, _uI16Result)
        }

        // --

        let _uI32Object: STCUnsignedInteger32Model! = STCUnsignedInteger32Model.shared

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_uI32Object)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _uI32Result: STCUnsignedInteger32Model?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? STCUnsignedInteger32Model {
                _uI32Result = value
            }
            XCTAssertEqual(_uI32Object, _uI32Result)
        }

        // --

        let _uI64Object: STCUnsignedInteger64Model! = STCUnsignedInteger64Model.shared

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_uI64Object)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _uI64Result: STCUnsignedInteger64Model?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? STCUnsignedInteger64Model {
                _uI64Result = value
            }
            XCTAssertEqual(_uI64Object, _uI64Result)
        }

        // --

        let _uIObject: STCUnsignedIntegerModel! = STCUnsignedIntegerModel.shared

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_uIObject)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _uIResult: STCUnsignedIntegerModel?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? STCUnsignedIntegerModel {
                _uIResult = value
            }
            XCTAssertEqual(_uIObject, _uIResult)
        }
    }

    func testSerializableModel_SignetIntegers_TSC() {

        let _i8Object: STCSignedInteger8Model! = STCSignedInteger8Model.shared

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_i8Object)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _i8Result: STCSignedInteger8Model?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? STCSignedInteger8Model {
                _i8Result = value
            }
            XCTAssertEqual(_i8Object, _i8Result)
        }

        // --

        let _i16Object: STCSignedInteger16Model! = STCSignedInteger16Model.shared

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_i16Object)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _i16Result: STCSignedInteger16Model?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? STCSignedInteger16Model {
                _i16Result = value
            }
            XCTAssertEqual(_i16Object, _i16Result)
        }

        // --

        let _i32Object: STCSignedInteger32Model! = STCSignedInteger32Model.shared

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_i32Object)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _i32Result: STCSignedInteger32Model?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? STCSignedInteger32Model {
                _i32Result = value
            }
            XCTAssertEqual(_i32Object, _i32Result)
        }

        // --

        let _i64Object: STCSignedInteger64Model! = STCSignedInteger64Model.shared

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_i64Object)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _i64Result: STCSignedInteger64Model?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? STCSignedInteger64Model {
                _i64Result = value
            }
            XCTAssertEqual(_i64Object, _i64Result)
        }

        // --

        let _iObject: STCSignedIntegerModel! = STCSignedIntegerModel.shared

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_iObject)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _iResult: STCSignedIntegerModel?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? STCSignedIntegerModel {
                _iResult = value
            }
            XCTAssertEqual(_iObject, _iResult)
        }
    }
}

// ----------------------------------------------------------------------------
