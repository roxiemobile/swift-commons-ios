// ----------------------------------------------------------------------------
//
//  STCBool.swift
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

    func testSerializableModel_Bool() {

        let _bObject: [String: STCBoolModel]? = [JsonKeys.object: STCBoolModel.shared]

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_bObject)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _bResult: [String: STCBoolModel]?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: STCBoolModel] {
//                _bResult = value
//            }
//            XCTAssertEqual(_bObject, _bResult)
        }
    }

    func testSerializableModel_Bool_TSC() {

        let _bObject: [String: STCBoolModel]! = [JsonKeys.object: STCBoolModel.shared]

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_bObject)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _bResult: [String: STCBoolModel]?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? [String: STCBoolModel] {
                _bResult = value
            }
            XCTAssertEqual(_bObject, _bResult)
        }
    }
}

// ----------------------------------------------------------------------------
