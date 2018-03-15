// ----------------------------------------------------------------------------
//
//  IntegerOperatorsTests.UnsignedIntegers.swift
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

        let mapValid = Map(mappingType: .fromJSON, JSON: Constants.uintValues)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: Constants.invalidIntValues)

        mapNotValid.JSON[JsonKeys.nilValue] = NSNull()

        // --

        let uint8Const: UInt8 = UInt8(Constants.uintValues[JsonKeys.uint8]!)
        var uint8Value: UInt8 = 0

        // Positive
        uint8Value <~ mapValid[JsonKeys.uint8]
        XCTAssertEqual(uint8Value, uint8Const)

        // Negative
        assertExceptionNotNil {
            uint8Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            uint8Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            uint8Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let uint16Const: UInt16 = UInt16(Constants.uintValues[JsonKeys.uint16]!)
        var uint16Value: UInt16 = 0

        // Positive
        uint16Value <~ mapValid[JsonKeys.uint16]
        XCTAssertEqual(uint16Value, uint16Const)

        // Negative
        assertExceptionNotNil {
            uint16Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            uint16Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            uint16Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let uint32Const: UInt32 = UInt32(Constants.uintValues[JsonKeys.uint32]!)
        var uint32Value: UInt32 = 0

        // Positive
        uint32Value <~ mapValid[JsonKeys.uint32]
        XCTAssertEqual(uint32Value, uint32Const)

        // Negative
        assertExceptionNotNil {
            uint32Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            uint32Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            uint32Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let uint64Const: UInt64 = UInt64(Constants.uintValues[JsonKeys.uint64]!)
        var uint64Value: UInt64 = 0

        // Positive
        uint64Value <~ mapValid[JsonKeys.uint64]
        XCTAssertEqual(uint64Value, uint64Const)

        // Negative
        assertExceptionNotNil {
            uint64Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            uint64Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            uint64Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let uintConst: UInt = UInt(Constants.uintValues[JsonKeys.uint]!)
        var uintValue: UInt = 0

        // Positive
        uintValue <~ mapValid[JsonKeys.uint]
        XCTAssertEqual(uintValue, uintConst)

        // Negative
        assertExceptionNotNil {
            uintValue <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            uintValue <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            uintValue <~ mapNotValid[JsonKeys.nilValue]
        }
    }

    func testUnsignedIntegerMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var uint8Value = UInt8(Int8.max)
        var uint16Value = UInt16(Int16.max)
        var uint32Value = UInt32(Int32.max)
        var uint64Value = UInt64(Int64.max)
        var uintValue = UInt(Int.max)

        // Positive
        uint8Value <~ map[JsonKeys.uint8]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint8).value)

        uint16Value <~ map[JsonKeys.uint16]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint16).value)

        uint32Value <~ map[JsonKeys.uint32]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint32).value)

        uint64Value <~ map[JsonKeys.uint64]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint64).value)

        uintValue <~ map[JsonKeys.uint]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint).value)
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional UnsignedInteger mapping
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
    // MARK: - Tests

    func testOptionalUnsignedIntegerMappingFromJSON() {

        let mapValid = Map(mappingType: .fromJSON, JSON: Constants.uintValues)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: Constants.invalidIntValues)

        mapNotValid.JSON[JsonKeys.nilValue] = NSNull()

        // --

        let unit8Const: UInt8? = UInt8(Constants.uintValues[JsonKeys.uint8]!)
        var uint8Value: UInt8? = 0

        // Positive
        uint8Value <~ mapValid[JsonKeys.uint8]
        XCTAssertEqual(uint8Value, unit8Const)

        uint8Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertNil(uint8Value)

        uint8Value <~ mapValid[JsonKeys.nilValue]
        XCTAssertNil(uint8Value)

        // Negative
        assertExceptionNotNil {
            uint8Value <~ mapNotValid[JsonKeys.invalidValue]
        }

        // --

        let uint16Const: UInt16? = UInt16(Constants.uintValues[JsonKeys.uint16]!)
        var uint16Value: UInt16? = 0

        // Positive
        uint16Value <~ mapValid[JsonKeys.uint16]
        XCTAssertEqual(uint16Value, uint16Const)

        uint16Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertNil(uint16Value)

        uint16Value <~ mapValid[JsonKeys.nilValue]
        XCTAssertNil(uint16Value)

        // Negative
        assertExceptionNotNil {
            uint16Value <~ mapNotValid[JsonKeys.invalidValue]
        }

        // --

        let uint32Const: UInt32? = UInt32(Constants.uintValues[JsonKeys.uint32]!)
        var uint32Value: UInt32? = 0

        // Positive
        uint32Value <~ mapValid[JsonKeys.uint32]
        XCTAssertEqual(uint32Value, uint32Const)

        uint32Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertNil(uint32Value)

        uint32Value <~ mapValid[JsonKeys.nilValue]
        XCTAssertNil(uint32Value)

        // Negative
        assertExceptionNotNil {
            uint32Value <~ mapNotValid[JsonKeys.invalidValue]
        }

        // --

        let uint64Const: UInt64? = UInt64(Constants.uintValues[JsonKeys.uint64]!)
        var uint64Value: UInt64? = 0

        // Positive
        uint64Value <~ mapValid[JsonKeys.uint64]
        XCTAssertEqual(uint64Value, uint64Const)

        uint64Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertNil(uint64Value)

        uint64Value <~ mapValid[JsonKeys.nilValue]
        XCTAssertNil(uint64Value)

        // Negative
        assertExceptionNotNil {
            uint64Value <~ mapNotValid[JsonKeys.invalidValue]
        }

// FIXME: Error in ObjectMapper
//        guardNegativeException {
//            uInt64Value <~ map["negUInt"]
//        }

        // --

        let uintConst: UInt? = UInt(Constants.uintValues[JsonKeys.uint]!)
        var uintValue: UInt? = 0

        // Positive
        uintValue <~ mapValid[JsonKeys.uint]
        XCTAssertEqual(uintValue, uintConst)

        uintValue <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertNil(uintValue)

        uintValue <~ mapValid[JsonKeys.nilValue]
        XCTAssertNil(uintValue)

        // Negative
        assertExceptionNotNil {
            uintValue <~ mapNotValid[JsonKeys.invalidValue]
        }
    }

    func testOptionalUnsignedIntegerMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var uint8Value: UInt8? = UInt8(Int8.max)
        var uint16Value: UInt16? = UInt16(Int16.max)
        var uint32Value: UInt32? = UInt32(Int32.max)
        var uint64Value: UInt64? = UInt64(Int64.max)
        var uintValue: UInt? = UInt(Int.max)

        // Positive
        uint8Value <~ map[JsonKeys.uint8]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint8).value)

        uint16Value <~ map[JsonKeys.uint16]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint16).value)

        uint32Value <~ map[JsonKeys.uint32]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint32).value)

        uint64Value <~ map[JsonKeys.uint64]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint64).value)

        uintValue <~ map[JsonKeys.uint]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint).value)
    }
}

// ----------------------------------------------------------------------------
// MARK: - ImplicitlyUnwrappedOptional UnsignedInteger mapping
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
    // MARK: - Tests

    func testImplicitlyUnwrappedOptionalUnsignedIntegerMappingFromJSON() {

        let mapValid = Map(mappingType: .fromJSON, JSON: Constants.uintValues)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: Constants.invalidIntValues)

        mapNotValid.JSON[JsonKeys.nilValue] = NSNull()

        // --

        let uint8Const: UInt8! = UInt8(Constants.uintValues[JsonKeys.uint8]!)
        var uint8Value: UInt8! = 0

        // Positive
        uint8Value <~ mapValid[JsonKeys.uint8]
        XCTAssertEqual(uint8Value, uint8Const)

        // Negative
        assertExceptionNotNil {
            uint8Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            uint8Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            uint8Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let uint16Const: UInt16! = UInt16(Constants.uintValues[JsonKeys.uint16]!)
        var uint16Value: UInt16! = 0

        // Positive
        uint16Value <~ mapValid[JsonKeys.uint16]
        XCTAssertEqual(uint16Value, uint16Const)

        // Negative
        assertExceptionNotNil {
            uint16Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            uint16Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            uint16Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let uint32Const: UInt32! = UInt32(Constants.uintValues[JsonKeys.uint32]!)
        var uint32Value: UInt32! = 0

        // Positive
        uint32Value <~ mapValid[JsonKeys.uint32]
        XCTAssertEqual(uint32Value, uint32Const)

        // Negative
        assertExceptionNotNil {
            uint32Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            uint32Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            uint32Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let uint64Const: UInt64! = UInt64(Constants.uintValues[JsonKeys.uint64]!)
        var uint64Value: UInt64! = 0

        // Positive
        uint64Value <~ mapValid[JsonKeys.uint64]
        XCTAssertEqual(uint64Value, uint64Const)

        // Negative
        assertExceptionNotNil {
            uint64Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            uint64Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            uint64Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let uintConst: UInt! = UInt(Constants.uintValues[JsonKeys.uint]!)
        var uintValue: UInt! = 0

        // Positive
        uintValue <~ mapValid[JsonKeys.uint]
        XCTAssertEqual(uintValue, uintConst)

        // Negative
        assertExceptionNotNil {
            uintValue <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            uintValue <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            uintValue <~ mapNotValid[JsonKeys.nilValue]
        }
    }

    func testImplicitlyUnwrappedOptionalUnsignedIntegerMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var uint8Value: UInt8! = UInt8(Int8.max)
        var uint16Value: UInt16! = UInt16(Int16.max)
        var uint32Value: UInt32! = UInt32(Int32.max)
        var uint64Value: UInt64! = UInt64(Int64.max)
        var uintValue: UInt! = UInt(Int.max)

        // Positive
        uint8Value <~ map[JsonKeys.uint8]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint8).value)

        uint16Value <~ map[JsonKeys.uint16]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint16).value)

        uint32Value <~ map[JsonKeys.uint32]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint32).value)

        uint64Value <~ map[JsonKeys.uint64]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint64).value)

        uintValue <~ map[JsonKeys.uint]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint).value)
    }
}

// ----------------------------------------------------------------------------
