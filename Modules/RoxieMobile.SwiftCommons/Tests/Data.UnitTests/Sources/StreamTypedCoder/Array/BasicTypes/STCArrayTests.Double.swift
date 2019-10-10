// ----------------------------------------------------------------------------
//
//  STCDouble.swift
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

    func testDouble() {

        let _dValue: [Double]? = [Constants.doubleValue]

        // Positive
        assertNoThrow {

//            // Encode
//            let mdata = NSMutableData()
//            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_dValue)
//            XCTAssertNotEqual(mdata, NSMutableData())
//
//            // Decode
//            var _dResult: [Double]?
//            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [Double] {
//                _dResult = value
//            }
//            XCTAssertEqual(_dValue, _dResult)
        }
    }

    func testDouble_TSC() {

        let _dValue: [Double]! = [Constants.doubleValue]

        // Positive
        assertNoThrow {
            let policy: CodingFailurePolicy = .raiseException

            // Encode
            let mdata = NSMutableData()
            TypedStreamEncoder(forWritingInto: mdata, failurePolicy: policy).encode(_dValue)
            XCTAssertNotEqual(mdata, NSMutableData())

            // Decode
            var _dResult: [Double]?
            if let value = TypedStreamDecoder(forReadingFrom: mdata as Data, failurePolicy: policy).decodeObject() as? [Double] {
                _dResult = value
            }
            XCTAssertEqual(_dValue, _dResult)
        }
    }
}
// ----------------------------------------------------------------------------
