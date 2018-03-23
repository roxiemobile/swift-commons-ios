// ----------------------------------------------------------------------------
//
//  IntegerOperatorsTests.SignedIntegers.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Signed Integers
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
// MARK: - Tests

    func testSignedIntegers_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.integerValues)

        // --

        var int8Value: Int8 = 0

        // Positive
        assertNoThrow {
            int8Value <~ map[JsonKeys.int8]
            XCTAssertEqual(int8Value, Int8.max)
        }

        // Negative
        assertThrowsException {
            int8Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            int8Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            int8Value <~ map[JsonKeys.nilValue]
        }

        // --

        var int16Value: Int16 = 0

        // Positive
        assertNoThrow {
            int16Value <~ map[JsonKeys.int16]
            XCTAssertEqual(int16Value, Int16.max)
        }

        // Negative
        assertThrowsException {
            int16Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            int16Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            int16Value <~ map[JsonKeys.nilValue]
        }

        // --

        var int32Value: Int32 = 0

        // Positive
        assertNoThrow {
            int32Value <~ map[JsonKeys.int32]
            XCTAssertEqual(int32Value, Int32.max)
        }

        // Negative
        assertThrowsException {
            int32Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            int32Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            int32Value <~ map[JsonKeys.nilValue]
        }

        // --

        var int64Value: Int64 = 0

        // Positive
        assertNoThrow {
            int64Value <~ map[JsonKeys.int64]
            XCTAssertEqual(int64Value, Int64.max)
        }

        // Negative
        assertThrowsException {
            int64Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            int64Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            int64Value <~ map[JsonKeys.nilValue]
        }

        // --

        var intValue: Int = 0

        // Positive
        assertNoThrow {
            intValue <~ map[JsonKeys.int]
            XCTAssertEqual(intValue, Int.max)
        }

        // Negative
        assertThrowsException {
            intValue <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            intValue <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            intValue <~ map[JsonKeys.nilValue]
        }
    }

    func testSignedIntegers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var int8Value = Int8.max
        var int16Value = Int16.max
        var int32Value = Int32.max
        var int64Value = Int64.max
        var intValue = Int.max

        // Positive
        assertNoThrow {
            int8Value <~ map[JsonKeys.int8]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int8).value)
        }
        assertNoThrow {
            int16Value <~ map[JsonKeys.int16]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int16).value)
        }
        assertNoThrow {
            int32Value <~ map[JsonKeys.int32]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int32).value)
        }
        assertNoThrow {
            int64Value <~ map[JsonKeys.int64]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int64).value)
        }
        assertNoThrow {
            intValue <~ map[JsonKeys.int]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional signed Integers
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
// MARK: - Tests

    func testOptionalSignedIntegers_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.integerValues)

        // --

        var int8Value: Int8? = nil

        // Positive
        assertNoThrow {
            int8Value <~ map[JsonKeys.int8]
            XCTAssertEqual(int8Value, Int8.max)
        }
        assertNoThrow {
            int8Value <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(int8Value)
        }
        assertNoThrow {
            int8Value <~ map[JsonKeys.nilValue]
            XCTAssertNil(int8Value)
        }

        // Negative
        assertThrowsException {
            int8Value <~ map[JsonKeys.invalidValue]
        }

        // --

        var int16Value: Int16? = nil

        // Positive
        assertNoThrow {
            int16Value <~ map[JsonKeys.int16]
            XCTAssertEqual(int16Value, Int16.max)
        }
        assertNoThrow {
            int16Value <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(int8Value)
        }
        assertNoThrow {
            int16Value <~ map[JsonKeys.nilValue]
            XCTAssertNil(int16Value)
        }

        // Negative
        assertThrowsException {
            int16Value <~ map[JsonKeys.invalidValue]
        }

        // --

        var int32Value: Int32? = nil

        // Positive
        assertNoThrow {
            int32Value <~ map[JsonKeys.int32]
            XCTAssertEqual(int32Value, Int32.max)
        }
        assertNoThrow {
            int32Value <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(int32Value)
        }
        assertNoThrow {
            int32Value <~ map[JsonKeys.nilValue]
            XCTAssertNil(int32Value)
        }

        // Negative
        assertThrowsException {
            int32Value <~ map[JsonKeys.invalidValue]
        }

        // --

        var int64Value: Int64? = nil

        // Positive
        assertNoThrow {
            int64Value <~ map[JsonKeys.int64]
            XCTAssertEqual(int64Value, Int64.max)
        }
        assertNoThrow {
            int64Value <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(int64Value)
        }
        assertNoThrow {
            int64Value <~ map[JsonKeys.nilValue]
            XCTAssertNil(int64Value)
        }

        // Negative
        assertThrowsException {
            int64Value <~ map[JsonKeys.invalidValue]
        }

        // --

        var intValue: Int? = nil

        // Positive
        assertNoThrow {
            intValue <~ map[JsonKeys.int]
            XCTAssertEqual(intValue, Int.max)
        }
        assertNoThrow {
            intValue <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(intValue)
        }
        assertNoThrow {
            intValue <~ map[JsonKeys.nilValue]
            XCTAssertNil(intValue)
        }

        // Negative
        assertThrowsException {
            intValue <~ map[JsonKeys.invalidValue]
        }
    }

    func testOptionalSignedIntegers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var int8Value: Int8? = Int8.max
        var int16Value: Int16? = Int16.max
        var int32Value: Int32? = Int32.max
        var int64Value: Int64? = Int64.max
        var intValue: Int? = Int.max
        var nilValue: Int? = nil

        // Positive
        assertNoThrow {
            int8Value <~ map[JsonKeys.int8]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int8).value)
        }
        assertNoThrow {
            int16Value <~ map[JsonKeys.int16]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int16).value)
        }
        assertNoThrow {
            int32Value <~ map[JsonKeys.int32]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int32).value)
        }
        assertNoThrow {
            int64Value <~ map[JsonKeys.int64]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int64).value)
        }
        assertNoThrow {
            intValue <~ map[JsonKeys.int]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int).value)
        }
        assertNoThrow {
            nilValue <~ map[JsonKeys.nilValue]
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilValue).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional signed Integers
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalSignedIntegers_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.integerValues)

        // --

        var int8Value: Int8! = 0

        // Positive
        assertNoThrow {
            int8Value <~ map[JsonKeys.int8]
            XCTAssertEqual(int8Value, Int8.max)
        }

        // Negative
        assertThrowsException {
            int8Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            int8Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            int8Value <~ map[JsonKeys.nilValue]
        }

        // --

        var int16Value: Int16! = 0

        // Positive
        assertNoThrow {
            int16Value <~ map[JsonKeys.int16]
            XCTAssertEqual(int16Value, Int16.max)
        }

        // Negative
        assertThrowsException {
            int16Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            int16Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            int16Value <~ map[JsonKeys.nilValue]
        }

        // --

        var int32Value: Int32! = 0

        // Positive
        assertNoThrow {
            int32Value <~ map[JsonKeys.int32]
            XCTAssertEqual(int32Value, Int32.max)
        }

        // Negative
        assertThrowsException {
            int32Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            int32Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            int32Value <~ map[JsonKeys.nilValue]
        }

        // --

        var int64Value: Int64! = 0

        // Positive
        assertNoThrow {
            int64Value <~ map[JsonKeys.int64]
            XCTAssertEqual(int64Value, Int64.max)
        }

        // Negative
        assertThrowsException {
            int64Value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            int64Value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            int64Value <~ map[JsonKeys.nilValue]
        }

        // --

        var intValue: Int! = 0

        // Positive
        assertNoThrow {
            intValue <~ map[JsonKeys.int]
            XCTAssertEqual(intValue, Int.max)
        }

        // Negative
        assertThrowsException {
            intValue <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            intValue <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            intValue <~ map[JsonKeys.nilValue]
        }
    }

    func testImplicitlyUnwrappedOptionalSignedIntegers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var int8Value: Int8! = Int8.max
        var int16Value: Int16! = Int16.max
        var int32Value: Int32! = Int32.max
        var int64Value: Int64! = Int64.max
        var intValue: Int! = Int.max

        // Positive
        assertNoThrow {
            int8Value <~ map[JsonKeys.int8]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int8).value)
        }
        assertNoThrow {
            int16Value <~ map[JsonKeys.int16]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int16).value)
        }
        assertNoThrow {
            int32Value <~ map[JsonKeys.int32]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int32).value)
        }
        assertNoThrow {
            int64Value <~ map[JsonKeys.int64]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int64).value)
        }
        assertNoThrow {
            intValue <~ map[JsonKeys.int]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int).value)
        }
    }
}

// ----------------------------------------------------------------------------
