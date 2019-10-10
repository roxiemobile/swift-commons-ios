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

extension STCBasicTypeTests
{
// MARK: - Tests

    func testBoolean() {

        let _bValue: Bool? = true

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_bValue)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _bResult: Bool?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? Bool {
//                _bResult = value
//            }
//            XCTAssertEqual(_bValue, _bResult)
        }
    }

    func testBoolean_TSC() {

        let _bValue: Bool! = true

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_bValue)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _bResult: Bool?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? Bool {
                _bResult = value
            }
            XCTAssertEqual(_bValue, _bResult)
        }
    }
}

// ----------------------------------------------------------------------------
