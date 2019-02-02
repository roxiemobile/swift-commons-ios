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

        let _uint8Value: UInt8 = 0

        // Positive
        assertNoThrow {
            var ui8v = _uint8Value
            ui8v <~ map[JsonKeys.uint8]
            XCTAssertEqual(ui8v, UInt8(Int8.max))
        }

        // Negative
        assertThrowsException {
            var ui8v = _uint8Value
            ui8v <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var ui8v = _uint8Value
            ui8v <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            var ui8v = _uint8Value
            ui8v <~ map[JsonKeys.nilValue]
        }

        // --

        let _uint16Value: UInt16 = 0

        // Positive
        assertNoThrow {
            var ui16v = _uint16Value
            ui16v <~ map[JsonKeys.uint16]
            XCTAssertEqual(ui16v, UInt16(Int16.max))
        }

        // Negative
        assertThrowsException {
            var ui16v = _uint16Value
            ui16v <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var ui16v = _uint16Value
            ui16v <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            var ui16v = _uint16Value
            ui16v <~ map[JsonKeys.nilValue]
        }

        // --

        let _uint32Value: UInt32 = 0

        // Positive
        assertNoThrow {
            var ui32v = _uint32Value
            ui32v <~ map[JsonKeys.uint32]
            XCTAssertEqual(ui32v, UInt32(Int32.max))
        }

        // Negative
        assertThrowsException {
            var ui32v = _uint32Value
            ui32v <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var ui32v = _uint32Value
            ui32v <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            var ui32v = _uint32Value
            ui32v <~ map[JsonKeys.nilValue]
        }

        // --

        let _uint64Value: UInt64 = 0

        // Positive
        assertNoThrow {
            var ui64v = _uint64Value
            ui64v <~ map[JsonKeys.uint64]
            XCTAssertEqual(ui64v, UInt64(Int64.max))
        }

        // Negative
        assertThrowsException {
            var ui64v = _uint64Value
            ui64v <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var ui64v = _uint64Value
            ui64v <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            var ui64v = _uint64Value
            ui64v <~ map[JsonKeys.nilValue]
        }

        // --

        let _uintValue: UInt = 0

        // Positive
        assertNoThrow {
            var uival = _uintValue
            uival <~ map[JsonKeys.uint]
            XCTAssertEqual(uival, UInt(Int.max))
        }

        // Negative
        assertThrowsException {
            var uival = _uintValue
            uival <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var uival = _uintValue
            uival <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            var uival = _uintValue
            uival <~ map[JsonKeys.nilValue]
        }
    }

    func testUnsignedIntegers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _uint8Value = UInt8(Int8.max)
        let _uint16Value = UInt16(Int16.max)
        let _uint32Value = UInt32(Int32.max)
        let _uint64Value = UInt64(Int64.max)
        let _uintValue = UInt(Int.max)

        // Positive
        assertNoThrow {
            var ui8v = _uint8Value
            ui8v <~ map[JsonKeys.uint8]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint8).value)
        }
        assertNoThrow {
            var ui16v = _uint16Value
            ui16v <~ map[JsonKeys.uint16]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint16).value)
        }
        assertNoThrow {
            var ui32v = _uint32Value
            ui32v <~ map[JsonKeys.uint32]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint32).value)
        }
        assertNoThrow {
            var ui64v = _uint64Value
            ui64v <~ map[JsonKeys.uint64]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint64).value)
        }
        assertNoThrow {
            var uival = _uintValue
            uival <~ map[JsonKeys.uint]
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

        let _uint8Value: UInt8? = nil

        // Positive
        assertNoThrow {
            var ui8v = _uint8Value
            ui8v <~ map[JsonKeys.uint8]
            XCTAssertEqual(ui8v, UInt8(Int8.max))
        }
        assertNoThrow {
            var ui8v = _uint8Value
            ui8v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(ui8v)
        }
        assertNoThrow {
            var ui8v = _uint8Value
            ui8v <~ map[JsonKeys.nilValue]
            XCTAssertNil(ui8v)
        }

        // Negative
        assertThrowsException {
            var ui8v = _uint8Value
            ui8v <~ map[JsonKeys.invalidValue]
        }

        // --

        let _uint16Value: UInt16? = nil

        // Positive
        assertNoThrow {
            var ui16v = _uint16Value
            ui16v <~ map[JsonKeys.uint16]
            XCTAssertEqual(ui16v, UInt16(Int16.max))
        }
        assertNoThrow {
            var ui16v = _uint16Value
            ui16v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(ui16v)
        }
        assertNoThrow {
            var ui16v = _uint16Value
            ui16v <~ map[JsonKeys.nilValue]
            XCTAssertNil(ui16v)
        }

        // Negative
        assertThrowsException {
            var ui16v = _uint16Value
            ui16v <~ map[JsonKeys.invalidValue]
        }

        // --

        let _uint32Value: UInt32? = nil

        // Positive
        assertNoThrow {
            var ui32v = _uint32Value
            ui32v <~ map[JsonKeys.uint32]
            XCTAssertEqual(ui32v, UInt32(Int32.max))
        }
        assertNoThrow {
            var ui32v = _uint32Value
            ui32v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(ui32v)
        }
        assertNoThrow {
            var ui32v = _uint32Value
            ui32v <~ map[JsonKeys.nilValue]
            XCTAssertNil(ui32v)
        }

        // Negative
        assertThrowsException {
            var ui32v = _uint32Value
            ui32v <~ map[JsonKeys.invalidValue]
        }

        // --

        let _uint64Value: UInt64? = nil

        // Positive
        assertNoThrow {
            var ui64v = _uint64Value
            ui64v <~ map[JsonKeys.uint64]
            XCTAssertEqual(ui64v, UInt64(Int64.max))
        }
        assertNoThrow {
            var ui64v = _uint64Value
            ui64v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(ui64v)
        }
        assertNoThrow {
            var ui64v = _uint64Value
            ui64v <~ map[JsonKeys.nilValue]
            XCTAssertNil(ui64v)
        }

        // Negative
        assertThrowsException {
            var ui64v = _uint64Value
            ui64v <~ map[JsonKeys.invalidValue]
        }

// FIXME: Error in ObjectMapper
//        guardNegativeException {
//            uInt64Value <~ map["negUInt"]
//        }

        // --

        let _uintValue: UInt? = nil

        // Positive
        assertNoThrow {
            var uival = _uintValue
            uival <~ map[JsonKeys.uint]
            XCTAssertEqual(uival, UInt(Int.max))
        }
        assertNoThrow {
            var uival = _uintValue
            uival <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(uival)
        }
        assertNoThrow {
            var uival = _uintValue
            uival <~ map[JsonKeys.nilValue]
            XCTAssertNil(uival)
        }

        // Negative
        assertThrowsException {
            var uival = _uintValue
            uival <~ map[JsonKeys.invalidValue]
        }
    }

    func testOptionalUnsignedIntegers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _uint8Value: UInt8? = UInt8(Int8.max)
        let _uint16Value: UInt16? = UInt16(Int16.max)
        let _uint32Value: UInt32? = UInt32(Int32.max)
        let _uint64Value: UInt64? = UInt64(Int64.max)
        let _uintValue: UInt? = UInt(Int.max)
        let _nilValue: UInt? = nil

        // Positive
        assertNoThrow {
            var ui8v = _uint8Value
            ui8v <~ map[JsonKeys.uint8]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint8).value)
        }
        assertNoThrow {
            var ui16v = _uint16Value
            ui16v <~ map[JsonKeys.uint16]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint16).value)
        }
        assertNoThrow {
            var ui32v = _uint32Value
            ui32v <~ map[JsonKeys.uint32]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint32).value)
        }
        assertNoThrow {
            var ui64v = _uint64Value
            ui64v <~ map[JsonKeys.uint64]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint64).value)
        }
        assertNoThrow {
            var uival = _uintValue
            uival <~ map[JsonKeys.uint]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint).value)
        }
        assertNoThrow {
            var uival = _nilValue
            uival <~ map[JsonKeys.nilValue]
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

        let _uint8Value: UInt8! = 0

        // Positive
        assertNoThrow {
            var ui8v: UInt8! = _uint8Value
            ui8v <~ map[JsonKeys.uint8]
            XCTAssertEqual(ui8v, UInt8(Int8.max))
        }
        assertNoThrow {
            var ui8v: UInt8! = _uint8Value
            ui8v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(ui8v)
        }
        assertNoThrow {
            var ui8v: UInt8! = _uint8Value
            ui8v <~ map[JsonKeys.nilValue]
            XCTAssertNil(ui8v)
        }

        // Negative
        assertThrowsException {
            var ui8v: UInt8! = _uint8Value
            ui8v <~ map[JsonKeys.invalidValue]
        }

        // --

        let _uint16Value: UInt16! = 0

        // Positive
        assertNoThrow {
            var ui16v: UInt16! = _uint16Value
            ui16v <~ map[JsonKeys.uint16]
            XCTAssertEqual(ui16v, UInt16(Int16.max))
        }
        assertNoThrow {
            var ui16v: UInt16! = _uint16Value
            ui16v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(ui16v)
        }
        assertNoThrow {
            var ui16v: UInt16! = _uint16Value
            ui16v <~ map[JsonKeys.nilValue]
            XCTAssertNil(ui16v)
        }

        // Negative
        assertThrowsException {
            var ui16v: UInt16! = _uint16Value
            ui16v <~ map[JsonKeys.invalidValue]
        }

        // --

        let _uint32Value: UInt32! = 0

        // Positive
        assertNoThrow {
            var ui32v: UInt32! = _uint32Value
            ui32v <~ map[JsonKeys.uint32]
            XCTAssertEqual(ui32v, UInt32(Int32.max))
        }
        assertNoThrow {
            var ui32v: UInt32! = _uint32Value
            ui32v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(ui32v)
        }
        assertNoThrow {
            var ui32v: UInt32! = _uint32Value
            ui32v <~ map[JsonKeys.nilValue]
            XCTAssertNil(ui32v)
        }

        // Negative
        assertThrowsException {
            var ui32v: UInt32! = _uint32Value
            ui32v <~ map[JsonKeys.invalidValue]
        }

        // --

        let _uint64Value: UInt64! = 0

        // Positive
        assertNoThrow {
            var ui64v: UInt64! = _uint64Value
            ui64v <~ map[JsonKeys.uint64]
            XCTAssertEqual(ui64v, UInt64(Int64.max))
        }
        assertNoThrow {
            var ui64v: UInt64! = _uint64Value
            ui64v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(ui64v)
        }
        assertNoThrow {
            var ui64v: UInt64! = _uint64Value
            ui64v <~ map[JsonKeys.nilValue]
            XCTAssertNil(ui64v)
        }

        // Negative
        assertThrowsException {
            var ui64v: UInt64! = _uint64Value
            ui64v <~ map[JsonKeys.invalidValue]
        }

// FIXME: Error in ObjectMapper
//        guardNegativeException {
//            uInt64Value <~ map["negUInt"]
//        }

        // --

        let _uintValue: UInt! = 0

        // Positive
        assertNoThrow {
            var uival: UInt! = _uintValue
            uival <~ map[JsonKeys.uint]
            XCTAssertEqual(uival, UInt(Int.max))
        }
        assertNoThrow {
            var uival: UInt! = _uintValue
            uival <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(uival)
        }
        assertNoThrow {
            var uival: UInt! = _uintValue
            uival <~ map[JsonKeys.nilValue]
            XCTAssertNil(uival)
        }

        // Negative
        assertThrowsException {
            var uival: UInt! = _uintValue
            uival <~ map[JsonKeys.invalidValue]
        }
    }

    func testImplicitlyUnwrappedOptionalUnsignedIntegers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _uint8Value: UInt8! = UInt8(Int8.max)
        let _uint16Value: UInt16! = UInt16(Int16.max)
        let _uint32Value: UInt32! = UInt32(Int32.max)
        let _uint64Value: UInt64! = UInt64(Int64.max)
        let _uintValue: UInt! = UInt(Int.max)

        // Positive
        assertNoThrow {
            var ui8v: UInt8! = _uint8Value
            ui8v <~ map[JsonKeys.uint8]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint8).value)
        }
        assertNoThrow {
            var ui16v: UInt16! = _uint16Value
            ui16v <~ map[JsonKeys.uint16]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint16).value)
        }
        assertNoThrow {
            var ui32v: UInt32! = _uint32Value
            ui32v <~ map[JsonKeys.uint32]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint32).value)
        }
        assertNoThrow {
            var ui64v: UInt64! = _uint64Value
            ui64v <~ map[JsonKeys.uint64]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint64).value)
        }
        assertNoThrow {
            var uival: UInt! = _uintValue
            uival <~ map[JsonKeys.uint]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.uint).value)
        }
    }
}

// ----------------------------------------------------------------------------
