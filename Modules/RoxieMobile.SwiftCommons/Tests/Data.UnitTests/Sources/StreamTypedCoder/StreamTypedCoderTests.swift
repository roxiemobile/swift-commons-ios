// ----------------------------------------------------------------------------
//
//  StreamTypeCoderTests.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsObjC
import XCTest

// ----------------------------------------------------------------------------

class StreamTypeCoderTests: XCTestCase
{
// MARK: - Tests

    func testStreamType_Encoder()
    {
        let _object = ["key1": ["key2":"value"]] // Vector3DModel.shared

        let data = NSMutableData()
        StreamTypedEncoder(forWritingWith: data).encodeRootObject(_object)

        XCTAssertNotEqual(data, NSMutableData())
    }

    func testStreamType_Decoder()
    {
        let _object = ["key1": ["key2":"value"]] // Vector3DModel.shared

        let data = NSMutableData()
        StreamTypedEncoder(forWritingWith: data).encodeRootObject(_object)

        var _object2: [String : [String : String]]?
        if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? [String : [String : String]] {
            _object2 = value
        }

        XCTAssertNotNil(_object2)
    }
}

// ----------------------------------------------------------------------------
