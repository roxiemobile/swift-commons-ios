// ----------------------------------------------------------------------------
//
//  EnumOperatorsTests.RawRepresentableTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
//  MARK: - RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.stringRawValues)

        var value = StringRawType.undefined

        // Positive
        assertNoThrow {
            value = StringRawType.undefined
            value <~ map[JsonKeys.value]
            XCTAssertEqual(value, StringRawType.value)
        }
        assertNoThrow {
            value = StringRawType.undefined
            value <~ map[JsonKeys.noSuchKey, default: StringRawType.otherValue.rawValue]
            XCTAssertEqual(value, StringRawType.otherValue)
        }
        assertNoThrow {
            value = StringRawType.undefined
            value <~ map[JsonKeys.nilValue, default: StringRawType.otherValue.rawValue]
            XCTAssertEqual(value, StringRawType.otherValue)
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

    func testRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var value = StringRawType.value
        let otherValue = StringRawType.otherValue

        // Positive
        assertNoThrow {
            value <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
        assertNoThrow {
            otherValue >>> map[JsonKeys.otherValue]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherValue).value)
        }
    }
}

// ----------------------------------------------------------------------------
//  MARK: - Optional RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testOptionalRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.stringRawValues)

        var value: StringRawType? = nil

        // Positive
        assertNoThrow {
            value = nil
            value <~ map[JsonKeys.value]
            XCTAssertEqual(value, StringRawType.value)
        }
        assertNoThrow {
            value = StringRawType.undefined
            value <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(value)
        }
        assertNoThrow {
            value = nil
            value <~ map[JsonKeys.noSuchKey, default: StringRawType.otherValue.rawValue]
            XCTAssertEqual(value, StringRawType.otherValue)
        }
        assertNoThrow {
            value = StringRawType.undefined
            value <~ map[JsonKeys.nilValue]
            XCTAssertNil(value)
        }
        assertNoThrow {
            value = nil
            value <~ map[JsonKeys.nilValue, default: StringRawType.otherValue.rawValue]
            XCTAssertEqual(value, StringRawType.otherValue)
        }

        // Negative
        assertThrowsException {
            value <~ map[JsonKeys.invalidValue]
        }
    }

    func testOptionalRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var value: StringRawType? = StringRawType.value
        let otherValue: StringRawType? = StringRawType.otherValue
        var nilValue: StringRawType? = nil

        // Positive
        assertNoThrow {
            value <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
        assertNoThrow {
            otherValue >>> map[JsonKeys.otherValue]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherValue).value)
        }
        assertNoThrow {
            nilValue <~ map[JsonKeys.nilValue]
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilValue).value)
        }
    }
}

// ----------------------------------------------------------------------------
//  MARK: - Implicitly unwrapped optional RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.stringRawValues)

        var value: StringRawType! = StringRawType.undefined

        // Positive
        assertNoThrow {
            value = StringRawType.undefined
            value <~ map[JsonKeys.value]
            XCTAssertEqual(value, StringRawType.value)
        }
        assertNoThrow {
            value = StringRawType.undefined
            value <~ map[JsonKeys.noSuchKey, default: StringRawType.otherValue.rawValue]
            XCTAssertEqual(value, StringRawType.otherValue)
        }
        assertNoThrow {
            value = StringRawType.undefined
            value <~ map[JsonKeys.nilValue, default: StringRawType.otherValue.rawValue]
            XCTAssertEqual(value, StringRawType.otherValue)
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

    func testImplicitlyUnwrappedOptionalRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var value: StringRawType! = StringRawType.value
        let otherValue: StringRawType! = StringRawType.otherValue

        // Positive
        assertNoThrow {
            value <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
        assertNoThrow {
            otherValue >>> map[JsonKeys.otherValue]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherValue).value)
        }
    }
}

// ----------------------------------------------------------------------------
