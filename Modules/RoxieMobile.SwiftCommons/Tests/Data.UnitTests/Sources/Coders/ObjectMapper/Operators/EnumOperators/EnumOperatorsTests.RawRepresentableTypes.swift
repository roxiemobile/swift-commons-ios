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

extension EnumOperatorsTests {

// MARK: - Tests

    func testRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.stringValues)

        let _value = StringRawType.undefined

        // Positive
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.rawTypeValue]
            XCTAssertEqual(val, StringRawType.value)
        }
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.noSuchKey, default: StringRawType.otherValue.rawValue]
            XCTAssertEqual(val, StringRawType.otherValue)
        }
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.nilValue, default: StringRawType.otherValue.rawValue]
            XCTAssertEqual(val, StringRawType.otherValue)
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

    func testRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _value = StringRawType.value
        let _otherValue = StringRawType.otherValue

        // Positive
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
        assertNoThrow {
            let val = _otherValue
            val >>> map[JsonKeys.otherValue]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherValue).value)
        }
    }
}

// ----------------------------------------------------------------------------
//  MARK: - Optional RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests {

// MARK: - Tests

    func testOptionalRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.stringValues)

        let _value: StringRawType? = nil

        // Positive
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.rawTypeValue]
            XCTAssertEqual(val, StringRawType.value)
        }
        assertNoThrow {
            var val: StringRawType? = StringRawType.undefined
            val <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(val)
        }
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.noSuchKey, default: StringRawType.otherValue.rawValue]
            XCTAssertEqual(val, StringRawType.otherValue)
        }
        assertNoThrow {
            var val: StringRawType? = StringRawType.undefined
            val <~ map[JsonKeys.nilValue]
            XCTAssertNil(val)
        }
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.nilValue, default: StringRawType.otherValue.rawValue]
            XCTAssertEqual(val, StringRawType.otherValue)
        }

        // Negative
        assertThrowsException {
            var val = _value
            val <~ map[JsonKeys.invalidValue]
        }
    }

    func testOptionalRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _value: StringRawType? = StringRawType.value
        let _otherValue: StringRawType? = StringRawType.otherValue
        let _nilValue: StringRawType? = nil

        // Positive
        assertNoThrow {
            var val = _value
            val <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
        assertNoThrow {
            let val = _otherValue
            val >>> map[JsonKeys.otherValue]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherValue).value)
        }
        assertNoThrow {
            var val = _nilValue
            val <~ map[JsonKeys.nilValue]
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilValue).value)
        }
    }
}

// ----------------------------------------------------------------------------
//  MARK: - Implicitly unwrapped optional RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.stringValues)

        let _value: StringRawType! = StringRawType.undefined

        // Positive
        assertNoThrow {
            var val: StringRawType! = _value
            val <~ map[JsonKeys.rawTypeValue]
            XCTAssertEqual(val, StringRawType.value)
        }
        assertNoThrow {
            var val: StringRawType! = _value
            val <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(val)
        }
        assertNoThrow {
            var val: StringRawType! = _value
            val <~ map[JsonKeys.noSuchKey, default: StringRawType.otherValue.rawValue]
            XCTAssertEqual(val, StringRawType.otherValue)
        }
        assertNoThrow {
            var val: StringRawType! = _value
            val <~ map[JsonKeys.nilValue]
            XCTAssertNil(val)
        }
        assertNoThrow {
            var val: StringRawType! = _value
            val <~ map[JsonKeys.nilValue, default: StringRawType.otherValue.rawValue]
            XCTAssertEqual(val, StringRawType.otherValue)
        }

        // Negative
        assertThrowsException {
            var val: StringRawType! = _value
            val <~ map[JsonKeys.invalidValue]
        }
    }

    func testImplicitlyUnwrappedOptionalRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _value: StringRawType! = StringRawType.value
        let _otherValue: StringRawType! = StringRawType.otherValue

        // Positive
        assertNoThrow {
            var val: StringRawType! = _value
            val <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
        assertNoThrow {
            let val: StringRawType! = _otherValue
            val >>> map[JsonKeys.otherValue]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherValue).value)
        }
    }
}
