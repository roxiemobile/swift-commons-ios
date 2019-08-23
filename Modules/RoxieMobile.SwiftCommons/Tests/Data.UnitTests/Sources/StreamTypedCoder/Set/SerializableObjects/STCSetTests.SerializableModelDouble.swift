// ----------------------------------------------------------------------------
//
//  STCDouble.swift
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

    func testSerializableModel_Double() {

        let _dObject: Set<STCDoubleModel> = [STCDoubleModel.shared]

        // Positive
        assertNoThrow { [weak self] in
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_dObject)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _dResult = Set<STCDoubleModel>()
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? NSSet {
                self?.transform(set: &_dResult, from: value)
            }
            XCTAssertEqual(_dObject, _dResult)
        }
    }
}

// ----------------------------------------------------------------------------
