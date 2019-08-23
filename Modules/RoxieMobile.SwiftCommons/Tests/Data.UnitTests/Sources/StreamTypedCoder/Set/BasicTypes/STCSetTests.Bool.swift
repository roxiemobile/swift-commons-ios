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

extension STCSetTests
{
// MARK: - Tests

    func testBoolean() {

        let _bValue: Set<Bool> = [true]

        // Positive
        assertNoThrow { [weak self] in
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_bValue)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _bResult = Set<Bool>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                self?.transform(set: &_bResult, from: value)
            }
            XCTAssertEqual(_bValue, _bResult)
        }
    }
}

// ----------------------------------------------------------------------------
