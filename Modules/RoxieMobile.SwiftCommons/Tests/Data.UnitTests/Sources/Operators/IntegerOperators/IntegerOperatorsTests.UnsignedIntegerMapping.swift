// ----------------------------------------------------------------------------
//
//  IntegerOperatorsTests.UnsignedIntegerMapping.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - UnsignedInteger mapping
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
// MARK: - Tests

    func testUnsignedIntegerMappingFromJSON() {
        let JSONString = JSONKeys.forUIntValues
        let JSONStringNotValid = JSONKeys.forIntValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        mapValid.JSON[CodingKeys.nilValue] = nil

        let valueU8: UInt8 = UInt8(JSONString[CodingKeys.uint8]!)
        var uInt8Value: UInt8 = 0
        uInt8Value <~ mapValid[CodingKeys.uint8]
        XCTAssertEqual(uInt8Value, valueU8)
        // Negative
        guardNegativeException {
            uInt8Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt8Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt8Value <~ mapValid[CodingKeys.nilValue]
        }

        let valueU16: UInt16 = UInt16(JSONString[CodingKeys.uint16]!)
        var uInt16Value: UInt16 = 0
        uInt16Value <~ mapValid[CodingKeys.uint16]
        XCTAssertEqual(uInt16Value, valueU16)
        // Negative
        guardNegativeException {
            uInt16Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt16Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt16Value <~ mapValid[CodingKeys.nilValue]
        }

        let valueU32: UInt32 = UInt32(JSONString[CodingKeys.uint32]!)
        var uInt32Value: UInt32 = 0
        uInt32Value <~ mapValid[CodingKeys.uint32]
        XCTAssertEqual(uInt32Value, valueU32)
        // Negative
        guardNegativeException {
            uInt32Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt32Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt32Value <~ mapValid[CodingKeys.nilValue]
        }

        let valueU64: UInt64 = UInt64(JSONString[CodingKeys.uint64]!)
        var uInt64Value: UInt64 = 0
        uInt64Value <~ mapValid[CodingKeys.uint64]
        XCTAssertEqual(uInt64Value, valueU64)
        // Negative
        guardNegativeException {
            uInt64Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt64Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt64Value <~ mapValid[CodingKeys.nilValue]
        }

        let uValue: UInt = UInt(JSONString[CodingKeys.uint]!)
        var uIntValue: UInt = 0
        uIntValue <~ mapValid[CodingKeys.uint]
        XCTAssertEqual(uIntValue, uValue)
        // Negative
        guardNegativeException {
            uIntValue <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uIntValue <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uIntValue <~ mapValid[CodingKeys.nilValue]
        }
    }

    func testUnsignetIntegerMappingToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        /// Positive
        var uInt8Value: UInt8 = UInt8(Constants.uintMax)
        uInt8Value <~ map[CodingKeys.uint8]
        XCTAssertNotNil(map.JSON[CodingKeys.uint8])

        var uInt16Value: UInt16 = UInt16(Constants.uintMin)
        uInt16Value <~ map[CodingKeys.uint16]
        XCTAssertNotNil(map.JSON[CodingKeys.uint16])

        var uInt32Value: UInt32 = UInt32(Constants.uintMax)
        uInt32Value <~ map[CodingKeys.uint32]
        XCTAssertNotNil(map.JSON[CodingKeys.uint32])

        var uInt64Value: UInt64 = UInt64(Constants.uintMin)
        uInt64Value <~ map[CodingKeys.uint64]
        XCTAssertNotNil(map.JSON[CodingKeys.uint64])

        var uIntValue: UInt = UInt(Constants.uintMax)
        uIntValue <~ map[CodingKeys.uint]
        XCTAssertNotNil(map.JSON[CodingKeys.uint])

        // Negative
        guardNegativeException {
            Constants.dateValue <~ map[CodingKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional UnsignedInteger mapping
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
    // MARK: - Tests

    func testOptionalUnsignedIntegerMappingFromJSON() {

        let JSONString = JSONKeys.forUIntValues
        let JSONStringNotValid = JSONKeys.forIntValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        mapValid.JSON[CodingKeys.nilValue] = nil

        let valueU8: UInt8? = UInt8(JSONString[CodingKeys.uint8]!)
        var uInt8Value: UInt8? = 0
        uInt8Value <~ mapValid[CodingKeys.uint8]
        XCTAssertEqual(uInt8Value, valueU8)
        // Negative
        uInt8Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(uInt8Value, nil)
        uInt8Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(uInt8Value, nil)
        guardNegativeException {
            uInt8Value <~ mapNotValid[CodingKeys.notValidValue]
        }

        let valueU16: UInt16? = UInt16(JSONString[CodingKeys.uint16]!)
        var uInt16Value: UInt16? = 0
        uInt16Value <~ mapValid[CodingKeys.uint16]
        XCTAssertEqual(uInt16Value, valueU16)
        // Negative
        uInt16Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(uInt16Value, nil)
        uInt16Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(uInt16Value, nil)
        guardNegativeException {
            uInt16Value <~ mapNotValid[CodingKeys.notValidValue]
        }

        let valueU32: UInt32? = UInt32(JSONString[CodingKeys.uint32]!)
        var uInt32Value: UInt32? = 0
        uInt32Value <~ mapValid[CodingKeys.uint32]
        XCTAssertEqual(uInt32Value, valueU32)
        // Negative
        uInt32Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(uInt32Value, nil)
        uInt32Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(uInt32Value, nil)
        guardNegativeException {
            uInt32Value <~ mapNotValid[CodingKeys.notValidValue]
        }

        let valueU64: UInt64? = UInt64(JSONString[CodingKeys.uint64]!)
        var uInt64Value: UInt64? = 0
        uInt64Value <~ mapValid[CodingKeys.uint64]
        XCTAssertEqual(uInt64Value, valueU64)
        // Negative
        uInt64Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(uInt64Value, nil)
        uInt64Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(uInt64Value, nil)
        guardNegativeException {
            uInt64Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        //        guardNegativeException {
        //            uInt64Value <~ map["negUInt"]
        //        } Error in ObjectMapper

        let uValue: UInt? = UInt(JSONString[CodingKeys.uint]!)
        var uIntValue: UInt? = 0
        uIntValue <~ mapValid[CodingKeys.uint]
        XCTAssertEqual(uIntValue, uValue)
        // Negative
        uIntValue <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(uIntValue, nil)
        uIntValue <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(uIntValue, nil)
        guardNegativeException {
            uIntValue <~ mapNotValid[CodingKeys.notValidValue]
        }
    }

    func testOptionalUnsignetIntegerMappingToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        /// Positive
        var uInt8Value: UInt8? = UInt8(Constants.uintMax)
        uInt8Value <~ map[CodingKeys.uint8]
        XCTAssertNotNil(map.JSON[CodingKeys.uint8])

        var uInt16Value: UInt16? = UInt16(Constants.uintMax)
        uInt16Value <~ map[CodingKeys.uint16]
        XCTAssertNotNil(map.JSON[CodingKeys.uint16])

        var uInt32Value: UInt32? = UInt32(Constants.uintMax)
        uInt32Value <~ map[CodingKeys.uint32]
        XCTAssertNotNil(map.JSON[CodingKeys.uint32])

        var uInt64Value: UInt64? = UInt64(Constants.uintMax)
        uInt64Value <~ map[CodingKeys.uint64]
        XCTAssertNotNil(map.JSON[CodingKeys.uint64])

        var uIntValue: UInt? = UInt(Constants.uintMax)
        uIntValue <~ map[CodingKeys.uint]
        XCTAssertNotNil(map.JSON[CodingKeys.uint])

        // Negative
        guardNegativeException {
            Constants.dateValue <~ map[CodingKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - ImplicitlyUnwrappedOptional UnsignedInteger mapping
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
    // MARK: - Tests

    func testImplicityUnwrappedOptionalUnsignedIntegerMappingFromJSON() {

        let JSONString = JSONKeys.forUIntValues
        let JSONStringNotValid = JSONKeys.forIntValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        mapValid.JSON[CodingKeys.nilValue] = nil

        let valueU8: UInt8! = UInt8(JSONString[CodingKeys.uint8]!)
        var uInt8Value: UInt8! = 0
        uInt8Value <~ mapValid[CodingKeys.uint8]
        XCTAssertEqual(uInt8Value, valueU8)
        // Negative
        guardNegativeException {
            uInt8Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt8Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt8Value <~ mapValid[CodingKeys.nilValue]
        }

        let valueU16: UInt16! = UInt16(JSONString[CodingKeys.uint16]!)
        var uInt16Value: UInt16! = 0
        uInt16Value <~ mapValid[CodingKeys.uint16]
        XCTAssertEqual(uInt16Value, valueU16)
        // Negative
        guardNegativeException {
            uInt16Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt16Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt16Value <~ mapValid[CodingKeys.nilValue]
        }

        let valueU32: UInt32! = UInt32(JSONString[CodingKeys.uint32]!)
        var uInt32Value: UInt32! = 0
        uInt32Value <~ mapValid[CodingKeys.uint32]
        XCTAssertEqual(uInt32Value, valueU32)
        // Negative
        guardNegativeException {
            uInt32Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt32Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt32Value <~ mapValid[CodingKeys.nilValue]
        }

        let valueU64: UInt64! = UInt64(JSONString[CodingKeys.uint64]!)
        var uInt64Value: UInt64! = 0
        uInt64Value <~ mapValid[CodingKeys.uint64]
        XCTAssertEqual(uInt64Value, valueU64)
        // Negative
        guardNegativeException {
            uInt64Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uInt64Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uInt64Value <~ mapValid[CodingKeys.nilValue]
        }

        let uValue: UInt! = UInt(JSONString[CodingKeys.uint]!)
        var uIntValue: UInt! = 0
        uIntValue <~ mapValid[CodingKeys.uint]
        XCTAssertEqual(uIntValue, uValue)
        // Negative
        guardNegativeException {
            uIntValue <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            uIntValue <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            uIntValue <~ mapValid[CodingKeys.nilValue]
        }
    }

    func testImplicityUnwrappedOptionalUnsignedIntegerMappingToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        /// Positive
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
        guardNegativeException {
            Constants.dateValue <~ map[CodingKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
