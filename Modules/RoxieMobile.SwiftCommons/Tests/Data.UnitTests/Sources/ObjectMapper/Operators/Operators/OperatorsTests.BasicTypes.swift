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

        var value = false

        // Positive
        assertNoThrow {
            value = false
            value <~ map[JsonKeys.value]
            XCTAssertEqual(value, true)
        }
        assertNoThrow {
            value = false
            value <~ map[JsonKeys.noSuchKey, default: true]
            XCTAssertEqual(value, true)
        }
        assertNoThrow {
            value = false
            value <~ map[JsonKeys.nilValue, default: true]
            XCTAssertEqual(value, true)
        }

        // Negative
        assertThrowsException {
            value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            value <~ map[JsonKeys.nilValue]
        }
    }

    func testBasicTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var value = true

        // Positive
        assertNoThrow {
            value <~ map[JsonKeys.value]
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

        var value: Bool? = nil

        // Positive
        assertNoThrow {
            value = nil
            value <~ map[JsonKeys.value]
            XCTAssertEqual(value, true)
        }
        assertNoThrow {
            value = false
            value <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(value)
        }
        assertNoThrow {
            value = nil
            value <~ map[JsonKeys.noSuchKey, default: true]
            XCTAssertEqual(value, true)
        }
        assertNoThrow {
            value = false
            value <~ map[JsonKeys.nilValue]
            XCTAssertNil(value)
        }
        assertNoThrow {
            value = nil
            value <~ map[JsonKeys.nilValue, default: true]
            XCTAssertEqual(value, true)
        }

        // Negative
        assertThrowsException {
            value <~ map[JsonKeys.invalidValue]
        }
    }

    func testOptionalBasicTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var value: Bool? = true
        var nilValue: Bool? = nil

        // Positive
        assertNoThrow {
            value <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
        assertNoThrow {
            nilValue <~ map[JsonKeys.nilValue]
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

        var value: Bool! = true

        // Positive
        assertNoThrow {
            value = false
            value <~ map[JsonKeys.value]
            XCTAssertEqual(value, true)
        }
        assertNoThrow {
            value = false
            value <~ map[JsonKeys.noSuchKey, default: true]
            XCTAssertEqual(value, true)
        }
        assertNoThrow {
            value = false
            value <~ map[JsonKeys.nilValue, default: true]
            XCTAssertEqual(value, true)
        }

        // Negative
        assertThrowsException {
            value <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            value <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            value <~ map[JsonKeys.nilValue]
        }
    }

    func testImplicitlyUnwrappedOptionalBasicTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var value: Bool! = true

        // Positive
        assertNoThrow {
            value <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
    }
}

// ----------------------------------------------------------------------------
