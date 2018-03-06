// ----------------------------------------------------------------------------
//
//  IntegerOperators.ImplicityUnwrappedOptionalUnsignedIntegerMapping.swift
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

    func testImplicityUnwrappedOptionalUnsignedIntegerMappingFromJSON() {

        let JSONString  = JSONKeys.forUIntValues
        let notValidJSONString = JSONKeys.forIntValuesNotValid
        
        let map = Map(mappingType: .fromJSON, JSON: JSONString)
        let map2 = Map(mappingType: .fromJSON, JSON: notValidJSONString )
        map.JSON[CodingKeys.nilValue] = nil

        let valueU8: UInt8! = UInt8(JSONString[CodingKeys.uint8]!)
        var uInt8Value: UInt8! = 0
        uInt8Value <~ map[CodingKeys.uint8]
        XCTAssertEqual(uInt8Value, valueU8)
        // Negative
        guardNegativeException { uInt8Value <~ map2[CodingKeys.notValidValue] }
        guardNegativeException { uInt8Value <~ map[CodingKeys.noSuchKey] }
        guardNegativeException { uInt8Value <~ map[CodingKeys.nilValue] }

        let valueU16: UInt16! = UInt16(JSONString[CodingKeys.uint16]!)
        var uInt16Value: UInt16! = 0
        uInt16Value <~ map[CodingKeys.uint16]
        XCTAssertEqual(uInt16Value, valueU16)
        // Negative
        guardNegativeException { uInt16Value <~ map2[CodingKeys.notValidValue] }
        guardNegativeException { uInt16Value <~ map[CodingKeys.noSuchKey] }
        guardNegativeException { uInt16Value <~ map[CodingKeys.nilValue] }

        let valueU32: UInt32! = UInt32(JSONString[CodingKeys.uint32]!)
        var uInt32Value: UInt32! = 0
        uInt32Value <~ map[CodingKeys.uint32]
        XCTAssertEqual(uInt32Value, valueU32)
        // Negative
        guardNegativeException { uInt32Value <~ map2[CodingKeys.notValidValue] }
        guardNegativeException { uInt32Value <~ map[CodingKeys.noSuchKey] }
        guardNegativeException { uInt32Value <~ map[CodingKeys.nilValue] }

        let valueU64: UInt64! = UInt64(JSONString[CodingKeys.uint64]!)
        var uInt64Value: UInt64! = 0
        uInt64Value <~ map[CodingKeys.uint64]
        XCTAssertEqual(uInt64Value, valueU64)
        // Negative
        guardNegativeException { uInt64Value <~ map2[CodingKeys.notValidValue] }
        guardNegativeException { uInt64Value <~ map[CodingKeys.noSuchKey] }
        guardNegativeException { uInt64Value <~ map[CodingKeys.nilValue] }

        let uValue: UInt! = UInt(JSONString[CodingKeys.uint]!)
        var uIntValue: UInt! = 0
        uIntValue <~ map[CodingKeys.uint]
        XCTAssertEqual(uIntValue, uValue)
        // Negative
        guardNegativeException { uIntValue <~ map2[CodingKeys.notValidValue] }
        guardNegativeException { uIntValue <~ map[CodingKeys.noSuchKey] }
        guardNegativeException { uIntValue <~ map[CodingKeys.nilValue] }

    }

    func testImplicityUnwrappedOptionalUnsignedIntegerMappingToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])


        /// UnsignedInteger Positive results
        var uInt8Value: UInt8! = UInt8(Constants.uintMin)
        uInt8Value <~ map[CodingKeys.uint8]
        XCTAssertNotNil(map.JSON[CodingKeys.uint8])

        var uInt16Value: UInt16! = UInt16(Constants.uintMin)
        uInt16Value <~ map[CodingKeys.uint16]
        XCTAssertNotNil(map.JSON[CodingKeys.uint16])

        var uInt32Value: UInt32! = UInt32(Constants.uintMin)
        uInt32Value <~ map[CodingKeys.uint32]
        XCTAssertNotNil(map.JSON[CodingKeys.uint32])

        var uInt64Value: UInt64! = UInt64(Constants.uintMin)
        uInt64Value <~ map[CodingKeys.uint64]
        XCTAssertNotNil(map.JSON[CodingKeys.uint64])

        var uIntValue: UInt! = UInt(Constants.uintMin)
        uIntValue <~ map[CodingKeys.uint]
        XCTAssertNotNil(map.JSON[CodingKeys.uint])

        // Negative
        guardNegativeException { Constants.dateValue <~ map[CodingKeys.notValidValue] }
    }

}

// ----------------------------------------------------------------------------
