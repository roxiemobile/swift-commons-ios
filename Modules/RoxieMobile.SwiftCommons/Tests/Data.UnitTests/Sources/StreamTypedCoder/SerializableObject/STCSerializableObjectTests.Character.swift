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

extension STCSerializableObjectTests
{
// MARK: - Tests

    func testSerializableModel_Character() {

        let _cObject: STCCharacterModel? = STCCharacterModel.shared

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_cObject)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _cResult: STCCharacterModel?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? STCCharacterModel {
                _cResult = value
            }
            XCTAssertEqual(_cObject, _cResult)
        }
    }
}

// ----------------------------------------------------------------------------
