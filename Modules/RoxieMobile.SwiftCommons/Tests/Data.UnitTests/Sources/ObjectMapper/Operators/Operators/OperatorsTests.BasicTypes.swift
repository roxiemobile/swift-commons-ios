// ----------------------------------------------------------------------------
//
//  OperatorsTests.BasicTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Basic types
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testBasicTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.booleanBasicTypes)

        let _value = false

        // Positive
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.value]
            XCTAssertEqual(val, true)
        }
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.noSuchKey, default: true]
            XCTAssertEqual(val, true)
        }
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.nilValue, default: true]
            XCTAssertEqual(val, true)
        }

        // Negative
        assertThrowsException {
            var val = _value
            val <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var val = _value
            val <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            var val = _value
            val <~ map[JsonKeys.nilValue]
        }
    }

    func testBasicTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _value = true

        // Positive
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Basic types
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testOptionalBasicTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.booleanBasicTypes)

        let _value: Bool? = nil

        // Positive
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.value]
            XCTAssertEqual(val, true)
        }
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(val)
        }
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.noSuchKey, default: true]
            XCTAssertEqual(val, true)
        }
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.nilValue]
            XCTAssertNil(val)
        }
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.nilValue, default: true]
            XCTAssertEqual(val, true)
        }

        // Negative
        assertThrowsException {
            var val = _value
            val <~ map[JsonKeys.invalidValue]
        }
    }

    func testOptionalBasicTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _value: Bool? = true
        let _nilValue: Bool? = nil

        // Positive
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
        assertNoThrow {
            var val = _nilValue
            val <~ map[JsonKeys.nilValue]
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilValue).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional Basic types
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalBasicTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.booleanBasicTypes)

        let _value: Bool! = true

        // Positive
        assertNoThrow {
            var val: Bool! = _value
            val <~ map[JsonKeys.value]
            XCTAssertEqual(val, true)
        }
        assertNoThrow {
            var val: Bool! = _value
            val <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(val)
        }
        assertNoThrow {
            var val: Bool! = _value
            val <~ map[JsonKeys.noSuchKey, default: true]
            XCTAssertEqual(val, true)
        }
        assertNoThrow {
            var val: Bool! = _value
            val <~ map[JsonKeys.nilValue]
            XCTAssertNil(val)
        }
        assertNoThrow {
            var val: Bool! = _value
            val <~ map[JsonKeys.nilValue, default: true]
            XCTAssertEqual(val, true)
        }

        // Negative
        assertThrowsException {
            var val: Bool! = _value
            val <~ map[JsonKeys.invalidValue]
        }
    }

    func testImplicitlyUnwrappedOptionalBasicTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _value: Bool! = true

        // Positive
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
    }
}

// ----------------------------------------------------------------------------
