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
// MARK: - Unsigned Integers
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
// MARK: - Tests

    func testUnsignedIntegers_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.unsignedIntegerValues)

        // --

        var uint8Value: UInt8 = 0

        // Positive
        assertNoThrow {
            uint8Value <~ map[JsonKeys.uint8]
            XCTAssertEqual(uint8Value, UInt8(Int8.max))
        }

        // Negative
        assertThrowsException {
            uint8Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            uint8Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            uint8Value <~ map[JsonKeys.nilValue]
        }

        // --

        var uint16Value: UInt16 = 0

        // Positive
        assertNoThrow {
            uint16Value <~ map[JsonKeys.uint16]
            XCTAssertEqual(uint16Value, UInt16(Int16.max))
        }

        // Negative
        assertThrowsException {
            uint16Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            uint16Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            uint16Value <~ map[JsonKeys.nilValue]
        }

        // --

        var uint32Value: UInt32 = 0

        // Positive
        assertNoThrow {
            uint32Value <~ map[JsonKeys.uint32]
            XCTAssertEqual(uint32Value, UInt32(Int32.max))
        }

        // Negative
        assertThrowsException {
            uint32Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            uint32Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            uint32Value <~ map[JsonKeys.nilValue]
        }

        // --

        var uint64Value: UInt64 = 0

        // Positive
        assertNoThrow {
            uint64Value <~ map[JsonKeys.uint64]
            XCTAssertEqual(uint64Value, UInt64(Int64.max))
        }

        // Negative
        assertThrowsException {
            uint64Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            uint64Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            uint64Value <~ map[JsonKeys.nilValue]
        }

        // --

        var uintValue: UInt = 0

        // Positive
        assertNoThrow {
            uintValue <~ map[JsonKeys.uint]
            XCTAssertEqual(uintValue, UInt(Int.max))
        }

        // Negative
        assertThrowsException {
            uintValue <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            uintValue <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            uintValue <~ map[JsonKeys.nilValue]
        }
    }

    func testUnsignedIntegers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var uint8Value = UInt8(Int8.max)
        var uint16Value = UInt16(Int16.max)
        var uint32Value = UInt32(Int32.max)
        var uint64Value = UInt64(Int64.max)
        var uintValue = UInt(Int.max)

        // Positive
        assertNoThrow {
            uint8Value <~ map[JsonKeys.uint8]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint8).value)
        }
        assertNoThrow {
            uint16Value <~ map[JsonKeys.uint16]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint16).value)
        }
        assertNoThrow {
            uint32Value <~ map[JsonKeys.uint32]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint32).value)
        }
        assertNoThrow {
            uint64Value <~ map[JsonKeys.uint64]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint64).value)
        }
        assertNoThrow {
            uintValue <~ map[JsonKeys.uint]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional unsigned Integers
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
    // MARK: - Tests

    func testOptionalUnsignedIntegers_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.unsignedIntegerValues)

        // --

        var uint8Value: UInt8? = nil

        // Positive
        assertNoThrow {
            uint8Value <~ map[JsonKeys.uint8]
            XCTAssertEqual(uint8Value, UInt8(Int8.max))
        }
        assertNoThrow {
            uint8Value <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(uint8Value)
        }
        assertNoThrow {
            uint8Value <~ map[JsonKeys.nilValue]
            XCTAssertNil(uint8Value)
        }

        // Negative
        assertThrowsException {
            uint8Value <~ map[JsonKeys.invalidValue]
        }

        // --

        var uint16Value: UInt16? = nil

        // Positive
        assertNoThrow {
            uint16Value <~ map[JsonKeys.uint16]
            XCTAssertEqual(uint16Value, UInt16(Int16.max))
        }
        assertNoThrow {
            uint16Value <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(uint16Value)
        }
        assertNoThrow {
            uint16Value <~ map[JsonKeys.nilValue]
            XCTAssertNil(uint16Value)
        }

        // Negative
        assertThrowsException {
            uint16Value <~ map[JsonKeys.invalidValue]
        }

        // --

        var uint32Value: UInt32? = nil

        // Positive
        assertNoThrow {
            uint32Value <~ map[JsonKeys.uint32]
            XCTAssertEqual(uint32Value, UInt32(Int32.max))
        }
        assertNoThrow {
            uint32Value <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(uint32Value)
        }
        assertNoThrow {
            uint32Value <~ map[JsonKeys.nilValue]
            XCTAssertNil(uint32Value)
        }

        // Negative
        assertThrowsException {
            uint32Value <~ map[JsonKeys.invalidValue]
        }

        // --

        var uint64Value: UInt64? = nil

        // Positive
        assertNoThrow {
            uint64Value <~ map[JsonKeys.uint64]
            XCTAssertEqual(uint64Value, UInt64(Int64.max))
        }
        assertNoThrow {
            uint64Value <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(uint64Value)
        }
        assertNoThrow {
            uint64Value <~ map[JsonKeys.nilValue]
            XCTAssertNil(uint64Value)
        }

        // Negative
        assertThrowsException {
            uint64Value <~ map[JsonKeys.invalidValue]
        }

// FIXME: Error in ObjectMapper
//        guardNegativeException {
//            uInt64Value <~ map["negUInt"]
//        }

        // --

        var uintValue: UInt? = nil

        // Positive
        assertNoThrow {
            uintValue <~ map[JsonKeys.uint]
            XCTAssertEqual(uintValue, UInt(Int.max))
        }
        assertNoThrow {
            uintValue <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(uintValue)
        }
        assertNoThrow {
            uintValue <~ map[JsonKeys.nilValue]
            XCTAssertNil(uintValue)
        }

        // Negative
        assertThrowsException {
            uintValue <~ map[JsonKeys.invalidValue]
        }
    }

    func testOptionalUnsignedIntegers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var uint8Value: UInt8? = UInt8(Int8.max)
        var uint16Value: UInt16? = UInt16(Int16.max)
        var uint32Value: UInt32? = UInt32(Int32.max)
        var uint64Value: UInt64? = UInt64(Int64.max)
        var uintValue: UInt? = UInt(Int.max)
        var nilValue: UInt? = nil

        // Positive
        assertNoThrow {
            uint8Value <~ map[JsonKeys.uint8]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint8).value)
        }
        assertNoThrow {
            uint16Value <~ map[JsonKeys.uint16]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint16).value)
        }
        assertNoThrow {
            uint32Value <~ map[JsonKeys.uint32]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint32).value)
        }
        assertNoThrow {
            uint64Value <~ map[JsonKeys.uint64]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint64).value)
        }
        assertNoThrow {
            uintValue <~ map[JsonKeys.uint]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint).value)
        }
        assertNoThrow {
            nilValue <~ map[JsonKeys.nilValue]
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilValue).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional unsigned Integers
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
    // MARK: - Tests

    func testImplicitlyUnwrappedOptionalUnsignedIntegers_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.unsignedIntegerValues)

        // --

        var uint8Value: UInt8! = 0

        // Positive
        assertNoThrow {
            uint8Value <~ map[JsonKeys.uint8]
            XCTAssertEqual(uint8Value, UInt8(Int8.max))
        }

        // Negative
        assertThrowsException {
            uint8Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            uint8Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            uint8Value <~ map[JsonKeys.nilValue]
        }

        // --

        var uint16Value: UInt16! = 0

        // Positive
        assertNoThrow {
            uint16Value <~ map[JsonKeys.uint16]
            XCTAssertEqual(uint16Value, UInt16(Int16.max))
        }

        // Negative
        assertThrowsException {
            uint16Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            uint16Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            uint16Value <~ map[JsonKeys.nilValue]
        }

        // --

        var uint32Value: UInt32! = 0

        // Positive
        assertNoThrow {
            uint32Value <~ map[JsonKeys.uint32]
            XCTAssertEqual(uint32Value, UInt32(Int32.max))
        }

        // Negative
        assertThrowsException {
            uint32Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            uint32Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            uint32Value <~ map[JsonKeys.nilValue]
        }

        // --

        var uint64Value: UInt64! = 0

        // Positive
        assertNoThrow {
            uint64Value <~ map[JsonKeys.uint64]
            XCTAssertEqual(uint64Value, UInt64(Int64.max))
        }

        // Negative
        assertThrowsException {
            uint64Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            uint64Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            uint64Value <~ map[JsonKeys.nilValue]
        }

        // --

        var uintValue: UInt! = 0

        // Positive
        assertNoThrow {
            uintValue <~ map[JsonKeys.uint]
            XCTAssertEqual(uintValue, UInt(Int.max))
        }

        // Negative
        assertThrowsException {
            uintValue <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            uintValue <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            uintValue <~ map[JsonKeys.nilValue]
        }
    }

    func testImplicitlyUnwrappedOptionalUnsignedIntegers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var uint8Value: UInt8! = UInt8(Int8.max)
        var uint16Value: UInt16! = UInt16(Int16.max)
        var uint32Value: UInt32! = UInt32(Int32.max)
        var uint64Value: UInt64! = UInt64(Int64.max)
        var uintValue: UInt! = UInt(Int.max)

        // Positive
        assertNoThrow {
            uint8Value <~ map[JsonKeys.uint8]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint8).value)
        }
        assertNoThrow {
            uint16Value <~ map[JsonKeys.uint16]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint16).value)
        }
        assertNoThrow {
            uint32Value <~ map[JsonKeys.uint32]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint32).value)
        }
        assertNoThrow {
            uint64Value <~ map[JsonKeys.uint64]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint64).value)
        }
        assertNoThrow {
            uintValue <~ map[JsonKeys.uint]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint).value)
        }
    }
}

// ----------------------------------------------------------------------------
