// ----------------------------------------------------------------------------
//
//  STCString.swift
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

    func testSerializableModel_String() {

        let _sObject: STCStringModel? = STCStringModel.shared

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_sObject)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _sResult: STCStringModel?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? STCStringModel {
//                _sResult = value
//            }
//            XCTAssertEqual(_sObject, _sResult)
        }
    }

    func testSerializableModel_String_TSC() {

        let _sObject: STCStringModel! = STCStringModel.shared

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_sObject)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _sResult: STCStringModel?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? STCStringModel {
                _sResult = value
            }
            XCTAssertEqual(_sObject, _sResult)
        }
    }
}

// ----------------------------------------------------------------------------
