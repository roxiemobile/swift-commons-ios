// ----------------------------------------------------------------------------
//
//  IntegerOperatorsTests.SignedIntegers.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------
// swiftlint:disable file_length
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Signed Integers
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests {

// MARK: - Tests

    func testSignedIntegers_fromJSON() {
        // swiftlint:disable:previous function_body_length

        let map = Map(mappingType: .fromJSON, JSON: Constants.integerValues)

        // --

        let _int8Value: Int8 = 0

        // Positive
        assertNoThrow {
            var i8v = _int8Value
            i8v <~ map[JsonKeys.int8]
            XCTAssertEqual(i8v, Int8.max)
        }

        // Negative
        assertThrowsException {
            var i8v = _int8Value
            i8v <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var i8v = _int8Value
            i8v <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            var i8v = _int8Value
            i8v <~ map[JsonKeys.nilValue]
        }

        // --

        let _int16Value: Int16 = 0

        // Positive
        assertNoThrow {
            var i16v = _int16Value
            i16v <~ map[JsonKeys.int16]
            XCTAssertEqual(i16v, Int16.max)
        }

        // Negative
        assertThrowsException {
            var i16v = _int16Value
            i16v <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var i16v = _int16Value
            i16v <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            var i16v = _int16Value
            i16v <~ map[JsonKeys.nilValue]
        }

        // --

        let _int32Value: Int32 = 0

        // Positive
        assertNoThrow {
            var i32v = _int32Value
            i32v <~ map[JsonKeys.int32]
            XCTAssertEqual(i32v, Int32.max)
        }

        // Negative
        assertThrowsException {
            var i32v = _int32Value
            i32v <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var i32v = _int32Value
            i32v <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            var i32v = _int32Value
            i32v <~ map[JsonKeys.nilValue]
        }

        // --

        let _int64Value: Int64 = 0

        // Positive
        assertNoThrow {
            var i64v = _int64Value
            i64v <~ map[JsonKeys.int64]
            XCTAssertEqual(i64v, Int64.max)
        }

        // Negative
        assertThrowsException {
            var i64v = _int64Value
            i64v <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var i64v = _int64Value
            i64v <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            var i64v = _int64Value
            i64v <~ map[JsonKeys.nilValue]
        }

        // --

        let _intValue: Int = 0

        // Positive
        assertNoThrow {
            var ival = _intValue
            ival <~ map[JsonKeys.int]
            XCTAssertEqual(ival, Int.max)
        }

        // Negative
        assertThrowsException {
            var ival = _intValue
            ival <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var ival = _intValue
            ival <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            var ival = _intValue
            ival <~ map[JsonKeys.nilValue]
        }
    }

    func testSignedIntegers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _int8Value = Int8.max
        let _int16Value = Int16.max
        let _int32Value = Int32.max
        let _int64Value = Int64.max
        let _intValue = Int.max

        // Positive
        assertNoThrow {
            var i8v = _int8Value
            i8v <~ map[JsonKeys.int8]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int8).value)
        }
        assertNoThrow {
            var i16v = _int16Value
            i16v <~ map[JsonKeys.int16]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int16).value)
        }
        assertNoThrow {
            var i32v = _int32Value
            i32v <~ map[JsonKeys.int32]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int32).value)
        }
        assertNoThrow {
            var i64v = _int64Value
            i64v <~ map[JsonKeys.int64]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int64).value)
        }
        assertNoThrow {
            var ival = _intValue
            ival <~ map[JsonKeys.int]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional signed Integers
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests {

// MARK: - Tests

    func testOptionalSignedIntegers_fromJSON() {
        // swiftlint:disable:previous function_body_length

        let map = Map(mappingType: .fromJSON, JSON: Constants.integerValues)

        // --

        let _int8Value: Int8? = nil

        // Positive
        assertNoThrow {
            var i8v = _int8Value
            i8v <~ map[JsonKeys.int8]
            XCTAssertEqual(i8v, Int8.max)
        }
        assertNoThrow {
            var i8v = _int8Value
            i8v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(i8v)
        }
        assertNoThrow {
            var i8v = _int8Value
            i8v <~ map[JsonKeys.nilValue]
            XCTAssertNil(i8v)
        }

        // Negative
        assertThrowsException {
            var i8v = _int8Value
            i8v <~ map[JsonKeys.invalidValue]
        }

        // --

        let _int16Value: Int16? = nil

        // Positive
        assertNoThrow {
            var i16v = _int16Value
            i16v <~ map[JsonKeys.int16]
            XCTAssertEqual(i16v, Int16.max)
        }
        assertNoThrow {
            var i16v = _int16Value
            i16v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(i16v)
        }
        assertNoThrow {
            var i16v = _int16Value
            i16v <~ map[JsonKeys.nilValue]
            XCTAssertNil(i16v)
        }

        // Negative
        assertThrowsException {
            var i16v = _int16Value
            i16v <~ map[JsonKeys.invalidValue]
        }

        // --

        let _int32Value: Int32? = nil

        // Positive
        assertNoThrow {
            var i32v = _int32Value
            i32v <~ map[JsonKeys.int32]
            XCTAssertEqual(i32v, Int32.max)
        }
        assertNoThrow {
            var i32v = _int32Value
            i32v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(i32v)
        }
        assertNoThrow {
            var i32v = _int32Value
            i32v <~ map[JsonKeys.nilValue]
            XCTAssertNil(i32v)
        }

        // Negative
        assertThrowsException {
            var i32v = _int32Value
            i32v <~ map[JsonKeys.invalidValue]
        }

        // --

        let _int64Value: Int64? = nil

        // Positive
        assertNoThrow {
            var i64v = _int64Value
            i64v <~ map[JsonKeys.int64]
            XCTAssertEqual(i64v, Int64.max)
        }
        assertNoThrow {
            var i64v = _int64Value
            i64v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(i64v)
        }
        assertNoThrow {
            var i64v = _int64Value
            i64v <~ map[JsonKeys.nilValue]
            XCTAssertNil(i64v)
        }

        // Negative
        assertThrowsException {
            var i64v = _int64Value
            i64v <~ map[JsonKeys.invalidValue]
        }

        // --

        let _intValue: Int? = nil

        // Positive
        assertNoThrow {
            var ival = _intValue
            ival <~ map[JsonKeys.int]
            XCTAssertEqual(ival, Int.max)
        }
        assertNoThrow {
            var ival = _intValue
            ival <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(ival)
        }
        assertNoThrow {
            var ival = _intValue
            ival <~ map[JsonKeys.nilValue]
            XCTAssertNil(ival)
        }

        // Negative
        assertThrowsException {
            var ival = _intValue
            ival <~ map[JsonKeys.invalidValue]
        }
    }

    func testOptionalSignedIntegers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _int8Value: Int8? = Int8.max
        let _int16Value: Int16? = Int16.max
        let _int32Value: Int32? = Int32.max
        let _int64Value: Int64? = Int64.max
        let _intValue: Int? = Int.max
        let _nilValue: Int? = nil

        // Positive
        assertNoThrow {
            var i8v = _int8Value
            i8v <~ map[JsonKeys.int8]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int8).value)
        }
        assertNoThrow {
            var i16v = _int16Value
            i16v <~ map[JsonKeys.int16]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int16).value)
        }
        assertNoThrow {
            var i32v = _int32Value
            i32v <~ map[JsonKeys.int32]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int32).value)
        }
        assertNoThrow {
            var i64v = _int64Value
            i64v <~ map[JsonKeys.int64]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int64).value)
        }
        assertNoThrow {
            var ival = _intValue
            ival <~ map[JsonKeys.int]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int).value)
        }
        assertNoThrow {
            var ival = _nilValue
            ival <~ map[JsonKeys.nilValue]
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilValue).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional signed Integers
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalSignedIntegers_fromJSON() {
        // swiftlint:disable:previous function_body_length

        let map = Map(mappingType: .fromJSON, JSON: Constants.integerValues)

        // --

        let _int8Value: Int8! = 0

        // Positive
        assertNoThrow {
            var i8v: Int8! = _int8Value
            i8v <~ map[JsonKeys.int8]
            XCTAssertEqual(i8v, Int8.max)
        }
        assertNoThrow {
            var i8v: Int8! = _int8Value
            i8v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(i8v)
        }
        assertNoThrow {
            var i8v: Int8! = _int8Value
            i8v <~ map[JsonKeys.nilValue]
            XCTAssertNil(i8v)
        }

        // Negative
        assertThrowsException {
            var i8v: Int8! = _int8Value
            i8v <~ map[JsonKeys.invalidValue]
        }

        // --

        let _int16Value: Int16! = 0

        // Positive
        assertNoThrow {
            var i16v: Int16! = _int16Value
            i16v <~ map[JsonKeys.int16]
            XCTAssertEqual(i16v, Int16.max)
        }
        assertNoThrow {
            var i16v: Int16! = _int16Value
            i16v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(i16v)
        }
        assertNoThrow {
            var i16v: Int16! = _int16Value
            i16v <~ map[JsonKeys.nilValue]
            XCTAssertNil(i16v)
        }

        // Negative
        assertThrowsException {
            var i16v: Int16! = _int16Value
            i16v <~ map[JsonKeys.invalidValue]
        }

        // --

        let _int32Value: Int32! = 0

        // Positive
        assertNoThrow {
            var i32v: Int32! = _int32Value
            i32v <~ map[JsonKeys.int32]
            XCTAssertEqual(i32v, Int32.max)
        }
        assertNoThrow {
            var i32v: Int32! = _int32Value
            i32v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(i32v)
        }
        assertNoThrow {
            var i32v: Int32! = _int32Value
            i32v <~ map[JsonKeys.nilValue]
            XCTAssertNil(i32v)
        }

        // Negative
        assertThrowsException {
            var i32v: Int32! = _int32Value
            i32v <~ map[JsonKeys.invalidValue]
        }

        // --

        let _int64Value: Int64! = 0

        // Positive
        assertNoThrow {
            var i64v: Int64! = _int64Value
            i64v <~ map[JsonKeys.int64]
            XCTAssertEqual(i64v, Int64.max)
        }
        assertNoThrow {
            var i64v: Int64! = _int64Value
            i64v <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(i64v)
        }
        assertNoThrow {
            var i64v: Int64! = _int64Value
            i64v <~ map[JsonKeys.nilValue]
            XCTAssertNil(i64v)
        }

        // Negative
        assertThrowsException {
            var i64v: Int64! = _int64Value
            i64v <~ map[JsonKeys.invalidValue]
        }

        // --

        let _intValue: Int! = 0

        // Positive
        assertNoThrow {
            var ival: Int! = _intValue
            ival <~ map[JsonKeys.int]
            XCTAssertEqual(ival, Int.max)
        }
        assertNoThrow {
            var ival: Int! = _intValue
            ival <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(ival)
        }
        assertNoThrow {
            var ival: Int! = _intValue
            ival <~ map[JsonKeys.nilValue]
            XCTAssertNil(ival)
        }

        // Negative
        assertThrowsException {
            var ival: Int! = _intValue
            ival <~ map[JsonKeys.invalidValue]
        }
    }

    func testImplicitlyUnwrappedOptionalSignedIntegers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _int8Value: Int8! = Int8.max
        let _int16Value: Int16! = Int16.max
        let _int32Value: Int32! = Int32.max
        let _int64Value: Int64! = Int64.max
        let _intValue: Int! = Int.max

        // Positive
        assertNoThrow {
            var i8v: Int8! = _int8Value
            i8v <~ map[JsonKeys.int8]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int8).value)
        }
        assertNoThrow {
            var i16v: Int16! = _int16Value
            i16v <~ map[JsonKeys.int16]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int16).value)
        }
        assertNoThrow {
            var i32v: Int32! = _int32Value
            i32v <~ map[JsonKeys.int32]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int32).value)
        }
        assertNoThrow {
            var i64v: Int64! = _int64Value
            i64v <~ map[JsonKeys.int64]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int64).value)
        }
        assertNoThrow {
            var ival: Int! = _intValue
            ival <~ map[JsonKeys.int]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int).value)
        }
    }
}
