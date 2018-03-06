// ----------------------------------------------------------------------------
//
//  IntegerOperators.OptionalSignedIntegerMapping.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------

extension IntegerOperators
{
// MARK: - Tests

    func testOptionalSignedIntegerMappingFromJSON() {
        let JSONString = JSONKeys.forIntValues
        let JSONStringNotValid = JSONKeys.forIntValuesNotValid
        
        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        mapValid.JSON[CodingKeys.nilValue] = nil

        let value8: Int8? = Int8(JSONString[CodingKeys.int8]!)
        var int8Value: Int8? = 0
        int8Value <~ mapValid[CodingKeys.int8]
        XCTAssertEqual(int8Value, value8)
        // Negative
        int8Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(int8Value, nil)
        int8Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(int8Value, nil)
        guardNegativeException {
            int8Value <~ mapNotValid[CodingKeys.notValidValue]
        }

        let value16: Int16? = Int16(JSONString[CodingKeys.int16]!)
        var int16Value: Int16? = 0
        int16Value <~ mapValid[CodingKeys.int16]
        XCTAssertEqual(int16Value, value16)
        // Negative
        int16Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(int8Value, nil)
        int16Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(int16Value, nil)
        guardNegativeException {
            int16Value <~ mapNotValid[CodingKeys.notValidValue]
        }

        let value32: Int32? = Int32(JSONString[CodingKeys.int32]!)
        var int32Value: Int32? = 0
        int32Value <~ mapValid[CodingKeys.int32]
        XCTAssertEqual(int32Value, value32)
        // Negative
        int32Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(int32Value, nil)
        int32Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(int32Value, nil)
        guardNegativeException {
            int32Value <~ mapNotValid[CodingKeys.notValidValue]
        }

        let value64: Int64? = Int64(JSONString[CodingKeys.int64]!)
        var int64Value: Int64? = 0
        int64Value <~ mapValid[CodingKeys.int64]
        XCTAssertEqual(int64Value, value64)
        // Negative
        int64Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(int64Value, nil)
        int64Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(int64Value, nil)
        guardNegativeException {
            int64Value <~ mapNotValid[CodingKeys.notValidValue]
        }

        let value: Int? = Int(JSONString[CodingKeys.int]!)
        var intValue: Int? = 0
        intValue <~ mapValid[CodingKeys.int]
        XCTAssertEqual(intValue, value)
        // Negative
        intValue <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(intValue, nil)
        intValue <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(intValue, nil)
        guardNegativeException {
            intValue <~ mapNotValid[CodingKeys.notValidValue]
        }
    }

    func testOptionalSignetIntegerMappingToJSON() {
        var map = Map(mappingType: .toJSON, JSON: [:])

        /// Positive
        var int8Value: Int8? = Int8(Constants.intMax)
        int8Value <~ map[CodingKeys.int8]
        XCTAssertNotNil(map.JSON[CodingKeys.int8])

        var int16Value: Int16? = Int16(Constants.intMin)
        int16Value <~ map[CodingKeys.int16]
        XCTAssertNotNil(map.JSON[CodingKeys.int16])

        var int32Value: Int32? = Int32(Constants.intMax)
        int32Value <~ map[CodingKeys.int32]
        XCTAssertNotNil(map.JSON[CodingKeys.int32])

        var int64Value: Int64? = Int64(Constants.intMin)
        int64Value <~ map[CodingKeys.int64]
        XCTAssertNotNil(map.JSON[CodingKeys.int64])

        var intValue: Int? = Int(Constants.intMax)
        intValue <~ map[CodingKeys.int]
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        // Negative
        guardNegativeException {
            Constants.dateValue <~ map[CodingKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
