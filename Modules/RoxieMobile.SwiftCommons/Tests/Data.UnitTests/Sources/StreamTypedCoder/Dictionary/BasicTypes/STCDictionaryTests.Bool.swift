// ----------------------------------------------------------------------------
//
//  STCBool.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsObjC
import XCTest

// ----------------------------------------------------------------------------

extension STCDictionaryTests
{
// MARK: - Tests

    func testBoolean() {

        let _bValue: [String: Bool]? = [JsonKeys.value: true]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_bValue)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _bResult: [String: Bool]?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String: Bool] {
                _bResult = value
            }
            XCTAssertEqual(_bValue, _bResult)
        }
    }
}

// ----------------------------------------------------------------------------
