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

extension STCArrayTests
{
// MARK: - Tests

    func testString() {

        let _sValue: [String]? = [Constants.stringValue]

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_sValue)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _sResult: [String]?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String] {
//                _sResult = value
//            }
//            XCTAssertEqual(_sValue, _sResult)
        }
    }

    func testString_TSC() {

        let _sValue: [String]! = [Constants.stringValue]

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_sValue)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _sResult: [String]?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? [String] {
                _sResult = value
            }
            XCTAssertEqual(_sValue, _sResult)
        }
    }
}

// ----------------------------------------------------------------------------
