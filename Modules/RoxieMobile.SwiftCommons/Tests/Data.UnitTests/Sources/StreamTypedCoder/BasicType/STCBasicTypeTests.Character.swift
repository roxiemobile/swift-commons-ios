// ----------------------------------------------------------------------------
//
//  STCCharacter.swift
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

    func testCharacter_Encoder() {
        let _object: Character = "q"

        let data = NSMutableData()
        StreamTypedEncoder(forWritingWith: data).encodeRootObject(_object)

        XCTAssertNotEqual(data, NSMutableData())
    }

    func testCharacter_Decoder() {
        let _object: Character = "q" // ["Object": [MixedModel.shared]]

        let data = NSMutableData()
        StreamTypedEncoder(forWritingWith: data).encodeRootObject(_object)

        var _object2: Character?
        if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? Character {
            _object2 = value
        }

        XCTAssertNotNil(_object2)
    }
}

// ----------------------------------------------------------------------------
