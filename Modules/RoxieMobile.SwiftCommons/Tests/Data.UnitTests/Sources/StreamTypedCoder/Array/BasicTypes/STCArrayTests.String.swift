// ----------------------------------------------------------------------------
//
//  STCString.swift
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

    func testString() {

        let _sValue: [String]? = [Constants.stringValue]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_sValue)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _sResult: [String]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String] {
                _sResult = value
            }
            XCTAssertEqual(_sValue, _sResult)
        }
    }
}

// ----------------------------------------------------------------------------
