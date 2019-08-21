// ----------------------------------------------------------------------------
//
//  STCFloat.swift
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

    func testFloat_Encoder() {
        let _object: Float = 0.4

        
        let data = NSMutableData()
        StreamTypedEncoder(forWritingWith: data).encodeRootObject(_object)
        XCTAssertNotEqual(data, NSMutableData())
    }

    func testFloat_Decoder() {
        let _object: Float = 0.4

        let data = NSMutableData()
        StreamTypedEncoder(forWritingWith: data).encodeRootObject(_object)

        var _object2: Float?
        if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? Float {
            _object2 = value
        }

        XCTAssertNotNil(_object2)
    }
}

// ----------------------------------------------------------------------------
