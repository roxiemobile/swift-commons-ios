// ----------------------------------------------------------------------------
//
//  OperatorsTests.Bool.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Bool
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testBool_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.booleanValues)

        let _value = false

        // Positive
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.bool]
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

    func testBool_toJSON() {

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
// MARK: - Optional Bool
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testOptionalBool_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.booleanValues)

        let _value: Bool? = nil

        // Positive
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.bool]
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

    func testOptionalBool_toJSON() {

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
// MARK: - Implicitly unwrapped optional Bool
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalBool_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.booleanValues)

        let _value: Bool! = true

        // Positive
        assertNoThrow {
            var val: Bool! = _value
            val <~ map[JsonKeys.bool]
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

    func testImplicitlyUnwrappedOptionalBool_toJSON() {

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
