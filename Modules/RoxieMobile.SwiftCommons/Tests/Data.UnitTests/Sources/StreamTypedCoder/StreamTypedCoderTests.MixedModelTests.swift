// ----------------------------------------------------------------------------
//
//  StreamTypedCoderTestsMixedModelTests.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsObjC
import XCTest

// ----------------------------------------------------------------------------

class StreamTypedCoderTestsMixedModelTests: StreamTypeCoderTests
{
// MARK: - Tests

    func testMixedModel() {
        let _mixObject: STCMixedModel? = STCMixedModel.shared

        // Positive
        assertNoThrow {
            // Encode
            let data = NSMutableData()
            StreamTypedEncoder(forWritingWith: data).encodeRootObject(_mixObject)
            XCTAssertNotEqual(data, NSMutableData())

            // Decode
            var _mixResult: STCMixedModel?
            if let value = StreamTypedDecoder(forReadingWith: data as Data)?.decodeObject() as? STCMixedModel {
                _mixResult = value
            }
            XCTAssertEqual(_mixObject, _mixResult)
        }
    }
}