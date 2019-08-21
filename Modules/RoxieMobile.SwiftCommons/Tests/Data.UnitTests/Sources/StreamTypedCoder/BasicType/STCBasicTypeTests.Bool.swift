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

extension STCBasicTypeTests
{
// MARK: - Tests

    func testBoolean_Encoder() {
        let _object: Bool? = true

        // Positive
        assertNoThrow {
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_object)
            XCTAssertNotEqual(data, NSMutableData())
        }
    }

    func testBoolean_Decoder() {
        let _object = true
        let data = NSMutableData()
        StreamTypedEncoder(forWritingWith: data).encodeRootObject(_object)

        // Positive
        assertNoThrow {
            var _object2:Bool?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? Bool {
                _object2 = value
            }
            XCTAssertNotNil(_object2)
        }
    }
}

// ----------------------------------------------------------------------------
