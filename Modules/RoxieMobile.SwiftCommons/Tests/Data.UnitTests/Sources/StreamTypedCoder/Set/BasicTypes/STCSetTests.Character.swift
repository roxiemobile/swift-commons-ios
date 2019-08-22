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

extension STCSetTests
{
// MARK: - Tests

    func testCharacter() {
        
        let _cValue: Set<Character> = ["q"]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_cValue)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _cResult: Set<Character>?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? Set<Character> {
                _cResult = value
            }
            XCTAssertEqual(_cValue, (_cResult)!)
        }
    }
}

// ----------------------------------------------------------------------------
