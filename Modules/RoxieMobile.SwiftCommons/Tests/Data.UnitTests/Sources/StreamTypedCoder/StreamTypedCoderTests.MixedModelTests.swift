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

    func testMixedModel_ToStringJSON() {
        let _mixObject: STCMixedModel? = STCMixedModel.shared

        // Positive
        assertNoThrow {
            // Encode
            let jsonString = _mixObject?.toJSONString()

            // Decode
            var _mixResult: STCMixedModel?
            if let string = jsonString {
                _mixResult = try? STCMixedModel(from: string)
            }
            XCTAssertEqual(_mixObject, _mixResult)
        }
    }

    func testSpeed_MixedModel() {
        let _mixObject: STCMixedModel? = STCMixedModel.shared

        // Positive
        assertNoThrow {
            var i = 0
            while i < 1000 {
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
                i += 1
            }
        }
    }

    func testSpeed_MixedModel_ToStringJSON() {
        let _mixObject: STCMixedModel? = STCMixedModel.shared

        // Positive
        assertNoThrow {
            var i = 0
            while i < 1000 {
                // Encode
                let jsonString = _mixObject?.toJSONString()

                // Decode
                var _mixResult: STCMixedModel?
                if let string = jsonString {
                    _mixResult = try? STCMixedModel(from: string)
                }

                XCTAssertEqual(_mixObject, _mixResult)
                i += 1
            }
        }
    }
}
