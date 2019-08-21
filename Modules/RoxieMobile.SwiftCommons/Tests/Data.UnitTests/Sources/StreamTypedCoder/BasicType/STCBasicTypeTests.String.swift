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

extension STCBasicTypeTests
{
// MARK: - Tests

    func testString_Encoder() {
        let _object: String = "quality"

        let data = NSMutableData()
        StreamTypedEncoder(forWritingWith: data).encodeRootObject(_object)

        XCTAssertNotEqual(data, NSMutableData())
    }

    func testString_Decoder() {
        let _object: String = "quality" // ["Object": [MixedModel.shared]]

        let data = NSMutableData()
        StreamTypedEncoder(forWritingWith: data).encodeRootObject(_object)

        var _object2: String?
        if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? String {
            _object2 = value
        }

        XCTAssertNotNil(_object2)
    }
}

// ----------------------------------------------------------------------------
