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

extension STCSerializableObjectTests
{
// MARK: - Tests

    func testSerializableModel_String() {

        let _sObject: STCStringModel? = STCStringModel.shared

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_sObject)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _sResult: STCStringModel?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? STCStringModel {
                _sResult = value
            }
            XCTAssertEqual(_sObject, _sResult)
        }
    }
}

// ----------------------------------------------------------------------------
