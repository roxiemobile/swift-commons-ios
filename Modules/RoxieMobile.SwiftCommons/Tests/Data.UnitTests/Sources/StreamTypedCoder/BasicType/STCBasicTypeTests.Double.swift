// ----------------------------------------------------------------------------
//
//  STCDouble.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsObjC
import XCTest

// ----------------------------------------------------------------------------

extension STCBasicTypeTests
{
// MARK: - Tests

    func testDouble() {

        let _dValue: Double? = Constants.doubleValue

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_dValue)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _dResult: Double?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? Double {
                _dResult = value
            }
            XCTAssertEqual(_dValue, _dResult)
        }
    }
}
// ----------------------------------------------------------------------------
