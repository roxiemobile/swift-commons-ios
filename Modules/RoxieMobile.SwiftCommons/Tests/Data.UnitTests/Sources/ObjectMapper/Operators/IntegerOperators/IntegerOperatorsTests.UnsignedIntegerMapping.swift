// ----------------------------------------------------------------------------
//
//  IntegerOperatorsTests.UnsignedIntegerMapping.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
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

        let JsonString = Constants.uintValues
        let JsonStringNotValid = Constants.intValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        mapValid.JSON[JsonKeys.nilValue] = nil

        // --

        let valueU8: UInt8 = UInt8(JsonString[JsonKeys.uint8]!)
        var uInt8Value: UInt8 = 0

        uInt8Value <~ mapValid[JsonKeys.uint8]

        // Positive
        XCTAssertEqual(uInt8Value, valueU8)

        // Negative
        guardNegativeException {
            uInt8Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            uInt8Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            uInt8Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let valueU16: UInt16 = UInt16(JsonString[JsonKeys.uint16]!)
        var uInt16Value: UInt16 = 0

        uInt16Value <~ mapValid[JsonKeys.uint16]

        // Positive
        XCTAssertEqual(uInt16Value, valueU16)

        // Negative
        guardNegativeException {
            uInt16Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            uInt16Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            uInt16Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let valueU32: UInt32 = UInt32(JsonString[JsonKeys.uint32]!)
        var uInt32Value: UInt32 = 0

        uInt32Value <~ mapValid[JsonKeys.uint32]

        // Positive
        XCTAssertEqual(uInt32Value, valueU32)

        // Negative
        guardNegativeException {
            uInt32Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            uInt32Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            uInt32Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let valueU64: UInt64 = UInt64(JsonString[JsonKeys.uint64]!)
        var uInt64Value: UInt64 = 0

        uInt64Value <~ mapValid[JsonKeys.uint64]

        // Positive
        XCTAssertEqual(uInt64Value, valueU64)

        // Negative
        guardNegativeException {
            uInt64Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            uInt64Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            uInt64Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let uValue: UInt = UInt(JsonString[JsonKeys.uint]!)
        var uIntValue: UInt = 0

        uIntValue <~ mapValid[JsonKeys.uint]

        // Positive
        XCTAssertEqual(uIntValue, uValue)

        // Negative
        guardNegativeException {
            uIntValue <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            uIntValue <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            uIntValue <~ mapValid[JsonKeys.nilValue]
        }
    }

    func testUnsignetIntegerMappingToJSON() {
        let map = Map(mappingType: .toJSON, JSON: [:])

        var uInt8Value: UInt8 = UInt8(Constants.maxUInt)
        var uInt16Value: UInt16 = UInt16(Constants.minUInt)
        var uInt32Value: UInt32 = UInt32(Constants.maxUInt)
        var uInt64Value: UInt64 = UInt64(Constants.minUInt)
        var uIntValue: UInt = UInt(Constants.maxUInt)

        // Positive
        uInt8Value <~ map[JsonKeys.uint8]
        XCTAssertNotNil(map.JSON[JsonKeys.uint8])

        uInt16Value <~ map[JsonKeys.uint16]
        XCTAssertNotNil(map.JSON[JsonKeys.uint16])

        uInt32Value <~ map[JsonKeys.uint32]
        XCTAssertNotNil(map.JSON[JsonKeys.uint32])

        uInt64Value <~ map[JsonKeys.uint64]
        XCTAssertNotNil(map.JSON[JsonKeys.uint64])

        uIntValue <~ map[JsonKeys.uint]
        XCTAssertNotNil(map.JSON[JsonKeys.uint])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue <~ map[JsonKeys.notValidValue]
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

        let JsonString = Constants.uintValues
        let JsonStringNotValid = Constants.intValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        mapValid.JSON[JsonKeys.nilValue] = nil

        // --

        let valueU8: UInt8? = UInt8(JsonString[JsonKeys.uint8]!)
        var uInt8Value: UInt8? = 0

        uInt8Value <~ mapValid[JsonKeys.uint8]

        // Positive
        XCTAssertEqual(uInt8Value, valueU8)

        // Negative
        uInt8Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertEqual(uInt8Value, nil)

        uInt8Value <~ mapValid[JsonKeys.nilValue]
        XCTAssertEqual(uInt8Value, nil)

        guardNegativeException {
            uInt8Value <~ mapNotValid[JsonKeys.notValidValue]
        }

        // --

        let valueU16: UInt16? = UInt16(JsonString[JsonKeys.uint16]!)
        var uInt16Value: UInt16? = 0

        uInt16Value <~ mapValid[JsonKeys.uint16]

        // Positive
        XCTAssertEqual(uInt16Value, valueU16)

        // Negative
        uInt16Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertEqual(uInt16Value, nil)

        uInt16Value <~ mapValid[JsonKeys.nilValue]
        XCTAssertEqual(uInt16Value, nil)

        guardNegativeException {
            uInt16Value <~ mapNotValid[JsonKeys.notValidValue]
        }

        // --

        let valueU32: UInt32? = UInt32(JsonString[JsonKeys.uint32]!)
        var uInt32Value: UInt32? = 0

        uInt32Value <~ mapValid[JsonKeys.uint32]

        // Positive
        XCTAssertEqual(uInt32Value, valueU32)

        // Negative
        uInt32Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertEqual(uInt32Value, nil)

        uInt32Value <~ mapValid[JsonKeys.nilValue]
        XCTAssertEqual(uInt32Value, nil)

        guardNegativeException {
            uInt32Value <~ mapNotValid[JsonKeys.notValidValue]
        }

        // --

        let valueU64: UInt64? = UInt64(JsonString[JsonKeys.uint64]!)
        var uInt64Value: UInt64? = 0

        uInt64Value <~ mapValid[JsonKeys.uint64]

        // Positive
        XCTAssertEqual(uInt64Value, valueU64)

        // Negative
        uInt64Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertEqual(uInt64Value, nil)

        uInt64Value <~ mapValid[JsonKeys.nilValue]
        XCTAssertEqual(uInt64Value, nil)

        guardNegativeException {
            uInt64Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        //        guardNegativeException {
        //            uInt64Value <~ map["negUInt"]
        //        } Error in ObjectMapper

        // --

        let uValue: UInt? = UInt(JsonString[JsonKeys.uint]!)
        var uIntValue: UInt? = 0

        uIntValue <~ mapValid[JsonKeys.uint]

        // Positive
        XCTAssertEqual(uIntValue, uValue)

        // Negative
        uIntValue <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertEqual(uIntValue, nil)

        uIntValue <~ mapValid[JsonKeys.nilValue]
        XCTAssertEqual(uIntValue, nil)

        guardNegativeException {
            uIntValue <~ mapNotValid[JsonKeys.notValidValue]
        }
    }

    func testOptionalUnsignetIntegerMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var uInt8Value: UInt8? = UInt8(Constants.maxUInt)
        var uInt16Value: UInt16? = UInt16(Constants.maxUInt)
        var uInt32Value: UInt32? = UInt32(Constants.maxUInt)
        var uInt64Value: UInt64? = UInt64(Constants.maxUInt)
        var uIntValue: UInt? = UInt(Constants.maxUInt)

        // Positive
        uInt8Value <~ map[JsonKeys.uint8]
        XCTAssertNotNil(map.JSON[JsonKeys.uint8])

        uInt16Value <~ map[JsonKeys.uint16]
        XCTAssertNotNil(map.JSON[JsonKeys.uint16])

        uInt32Value <~ map[JsonKeys.uint32]
        XCTAssertNotNil(map.JSON[JsonKeys.uint32])

        uInt64Value <~ map[JsonKeys.uint64]
        XCTAssertNotNil(map.JSON[JsonKeys.uint64])

        uIntValue <~ map[JsonKeys.uint]
        XCTAssertNotNil(map.JSON[JsonKeys.uint])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue <~ map[JsonKeys.notValidValue]
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

        let JsonString = Constants.uintValues
        let JsonStringNotValid = Constants.intValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        mapValid.JSON[JsonKeys.nilValue] = nil

        // --

        let valueU8: UInt8! = UInt8(JsonString[JsonKeys.uint8]!)
        var uInt8Value: UInt8! = 0

        uInt8Value <~ mapValid[JsonKeys.uint8]

        // Positive
        XCTAssertEqual(uInt8Value, valueU8)

        // Negative
        guardNegativeException {
            uInt8Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            uInt8Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            uInt8Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let valueU16: UInt16! = UInt16(JsonString[JsonKeys.uint16]!)
        var uInt16Value: UInt16! = 0

        uInt16Value <~ mapValid[JsonKeys.uint16]

        // Positive
        XCTAssertEqual(uInt16Value, valueU16)

        // Negative
        guardNegativeException {
            uInt16Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            uInt16Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            uInt16Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let valueU32: UInt32! = UInt32(JsonString[JsonKeys.uint32]!)
        var uInt32Value: UInt32! = 0

        uInt32Value <~ mapValid[JsonKeys.uint32]

        // Positive
        XCTAssertEqual(uInt32Value, valueU32)

        // Negative
        guardNegativeException {
            uInt32Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            uInt32Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            uInt32Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let valueU64: UInt64! = UInt64(JsonString[JsonKeys.uint64]!)
        var uInt64Value: UInt64! = 0

        uInt64Value <~ mapValid[JsonKeys.uint64]

        // Positive
        XCTAssertEqual(uInt64Value, valueU64)

        // Negative
        guardNegativeException {
            uInt64Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            uInt64Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            uInt64Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let uValue: UInt! = UInt(JsonString[JsonKeys.uint]!)
        var uIntValue: UInt! = 0

        uIntValue <~ mapValid[JsonKeys.uint]

        // Positive
        XCTAssertEqual(uIntValue, uValue)

        // Negative
        guardNegativeException {
            uIntValue <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            uIntValue <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            uIntValue <~ mapValid[JsonKeys.nilValue]
        }
    }

    func testImplicityUnwrappedOptionalUnsignedIntegerMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var uInt8Value: UInt8! = UInt8(Constants.minUInt)
        var uInt16Value: UInt16! = UInt16(Constants.minUInt)
        var uInt32Value: UInt32! = UInt32(Constants.minUInt)
        var uInt64Value: UInt64! = UInt64(Constants.minUInt)
        var uIntValue: UInt! = UInt(Constants.minUInt)

        // Positive
        uInt8Value <~ map[JsonKeys.uint8]
        XCTAssertNotNil(map.JSON[JsonKeys.uint8])

        uInt16Value <~ map[JsonKeys.uint16]
        XCTAssertNotNil(map.JSON[JsonKeys.uint16])

        uInt32Value <~ map[JsonKeys.uint32]
        XCTAssertNotNil(map.JSON[JsonKeys.uint32])

        uInt64Value <~ map[JsonKeys.uint64]
        XCTAssertNotNil(map.JSON[JsonKeys.uint64])

        uIntValue <~ map[JsonKeys.uint]
        XCTAssertNotNil(map.JSON[JsonKeys.uint])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue <~ map[JsonKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
