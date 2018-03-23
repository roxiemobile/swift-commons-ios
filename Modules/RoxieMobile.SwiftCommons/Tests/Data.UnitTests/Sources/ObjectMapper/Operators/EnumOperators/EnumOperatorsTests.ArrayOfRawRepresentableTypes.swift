// ----------------------------------------------------------------------------
//
//  EnumOperatorsTests.ArrayOfRawRepresentableTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
//  MARK: - Array of RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testArrayOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfStringRawValues)

        var array: [StringRawType] = []

        // Positive
        assertNoThrow {
            array <~ map[JsonKeys.array]
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0], StringRawType.value)
        }
        assertNoThrow {
            array <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(array.count, 0)
        }
        assertNoThrow {
            array <~ map[JsonKeys.noSuchKey, default: [StringRawType.otherValue.rawValue]]
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0], StringRawType.otherValue)
        }
        assertNoThrow {
            array <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(array.count, 0)
        }

        // Negative
        assertThrowsException {
            array <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            array <~ map[JsonKeys.invalidArray]
        }
        assertThrowsException {
            array <~ map[JsonKeys.nilArray]
        }
    }

    func testArrayOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var array = [StringRawType.value]
        let otherArray = [StringRawType.otherValue]
        var emptyArray: [StringRawType] = []

        // Positive
        assertNoThrow {
            array <~ map[JsonKeys.array]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            otherArray >>> map[JsonKeys.otherArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherArray).value)
        }
        assertNoThrow {
            emptyArray <~ map[JsonKeys.emptyArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
//  MARK: - Optional array of RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testOptionalArrayOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfStringRawValues)

        var array: [StringRawType]? = nil

        // Positive
        assertNoThrow {
            array <~ map[JsonKeys.array]
            XCTAssertEqual(array?.count ?? -1, 1)
            XCTAssertEqual(array?[0], StringRawType.value)
        }
        assertNoThrow {
            array <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(array?.count ?? -1, 0)
        }
        assertNoThrow {
            array <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(array)
        }
        assertNoThrow {
            array <~ map[JsonKeys.noSuchKey, default: [StringRawType.otherValue.rawValue]]
            XCTAssertEqual(array?.count ?? -1, 1)
            XCTAssertEqual(array?[0], StringRawType.otherValue)
        }
        assertNoThrow {
            array <~ map[JsonKeys.nilArray]
            XCTAssertNil(array)
        }
        assertNoThrow {
            array <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(array?.count ?? -1, 0)
        }

        // Negative
        assertThrowsException {
            array <~ map[JsonKeys.invalidArray]
        }
    }

    func testOptionalArrayOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var array: [StringRawType]? = [StringRawType.value]
        let otherArray: [StringRawType]? = [StringRawType.otherValue]
        var emptyArray: [StringRawType]? = []
        var nilArray: [StringRawType]? = nil

        // Positive
        assertNoThrow {
            array <~ map[JsonKeys.array]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            otherArray >>> map[JsonKeys.otherArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherArray).value)
        }
        assertNoThrow {
            emptyArray <~ map[JsonKeys.emptyArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
        assertNoThrow {
            nilArray <~ map[JsonKeys.nilArray]
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
//  MARK: - Implicitly unwrapped optional array of RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalArrayOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfStringRawValues)

        var array: [StringRawType]! = []

        // Positive
        assertNoThrow {
            array <~ map[JsonKeys.array]
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0], StringRawType.value)
        }
        assertNoThrow {
            array <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(array.count, 0)
        }
        assertNoThrow {
            array <~ map[JsonKeys.noSuchKey, default: [StringRawType.otherValue.rawValue]]
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0], StringRawType.otherValue)
        }
        assertNoThrow {
            array <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(array.count, 0)
        }

        // Negative
        assertThrowsException {
            array <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            array <~ map[JsonKeys.invalidArray]
        }
        assertThrowsException {
            array <~ map[JsonKeys.nilArray]
        }
    }

    func testImplicitlyUnwrappedOptionalArrayOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var array: [StringRawType]! = [StringRawType.value]
        let otherArray: [StringRawType]! = [StringRawType.otherValue]
        var emptyArray: [StringRawType]! = []

        // Positive
        assertNoThrow {
            array <~ map[JsonKeys.array]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            otherArray >>> map[JsonKeys.otherArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherArray).value)
        }
        assertNoThrow {
            emptyArray <~ map[JsonKeys.emptyArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
