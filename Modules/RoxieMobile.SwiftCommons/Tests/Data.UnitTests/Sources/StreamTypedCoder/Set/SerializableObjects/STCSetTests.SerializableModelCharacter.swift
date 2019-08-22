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

    func testSerializableModel_Character() {

        let _cObject: Set<STCCharacterModel> = [STCCharacterModel.shared]

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_cObject)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _cResult: Set<STCCharacterModel>?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? Set<STCCharacterModel> {
                _cResult = value
            }
            XCTAssertEqual(_cObject, (_cResult)!)
        }
    }
}

// ----------------------------------------------------------------------------
