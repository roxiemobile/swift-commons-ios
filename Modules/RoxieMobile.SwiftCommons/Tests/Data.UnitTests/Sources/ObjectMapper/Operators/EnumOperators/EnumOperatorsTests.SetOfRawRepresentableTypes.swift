// ----------------------------------------------------------------------------
//
//  EnumOperatorsTests.SetOfRawRepresentableTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
//  MARK: - Set of RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testSetOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfStringRawValues)

        var set: Set<StringRawType> = []

        // Positive
        assertNoThrow {
            set <~ map[JsonKeys.array]
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, StringRawType.value)
        }
        assertNoThrow {
            set <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(set.count, 0)
        }
        assertNoThrow {
            set <~ map[JsonKeys.noSuchKey, default: [StringRawType.otherValue.rawValue]]
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, StringRawType.otherValue)
        }
        assertNoThrow {
            set <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(set.count, 0)
        }

        // Negative
        assertThrowsException {
            set <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            set <~ map[JsonKeys.invalidArray]
        }
        assertThrowsException {
            set <~ map[JsonKeys.nilArray]
        }
    }

    func testSetOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var set: Set<StringRawType> = [StringRawType.value]
        let otherSet: Set<StringRawType> = [StringRawType.otherValue]
        var emptySet: Set<StringRawType> = []

        // Positive
        assertNoThrow {
            set <~ map[JsonKeys.set]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            otherSet >>> map[JsonKeys.otherSet]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherSet).value)
        }
        assertNoThrow {
            emptySet <~ map[JsonKeys.emptySet]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
    }
}

// ----------------------------------------------------------------------------
//  MARK: - Optional array of RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testOptionalSetOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfStringRawValues)

        var set: Set<StringRawType>? = nil

        // Positive
        assertNoThrow {
            set <~ map[JsonKeys.array]
            XCTAssertEqual(set?.count ?? -1, 1)
            XCTAssertEqual(set?.first, StringRawType.value)
        }
        assertNoThrow {
            set <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(set?.count ?? -1, 0)
        }
        assertNoThrow {
            set <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(set)
        }
        assertNoThrow {
            set <~ map[JsonKeys.noSuchKey, default: [StringRawType.otherValue.rawValue]]
            XCTAssertEqual(set?.count ?? -1, 1)
            XCTAssertEqual(set?.first, StringRawType.otherValue)
        }
        assertNoThrow {
            set <~ map[JsonKeys.nilArray]
            XCTAssertNil(set)
        }
        assertNoThrow {
            set <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(set?.count ?? -1, 0)
        }

        // Negative
        assertThrowsException {
            set <~ map[JsonKeys.invalidArray]
        }
    }

    func testOptionalSetOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var set: Set<StringRawType>? = [StringRawType.value]
        let otherSet: Set<StringRawType>? = [StringRawType.otherValue]
        var emptySet: Set<StringRawType>? = []
        var nilSet: Set<StringRawType>? = nil

        // Positive
        assertNoThrow {
            set <~ map[JsonKeys.set]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            otherSet >>> map[JsonKeys.otherSet]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherSet).value)
        }
        assertNoThrow {
            emptySet <~ map[JsonKeys.emptySet]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
        assertNoThrow {
            nilSet <~ map[JsonKeys.nilSet]
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilSet).value)
        }
    }
}

// ----------------------------------------------------------------------------
//  MARK: - Implicitly unwrapped optional array of RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalSetOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfStringRawValues)

        var set: Set<StringRawType>! = []

        // Positive
        assertNoThrow {
            set <~ map[JsonKeys.array]
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, StringRawType.value)
        }
        assertNoThrow {
            set <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(set.count, 0)
        }
        assertNoThrow {
            set <~ map[JsonKeys.noSuchKey, default: [StringRawType.otherValue.rawValue]]
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, StringRawType.otherValue)
        }
        assertNoThrow {
            set <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(set.count, 0)
        }

        // Negative
        assertThrowsException {
            set <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            set <~ map[JsonKeys.invalidArray]
        }
        assertThrowsException {
            set <~ map[JsonKeys.nilArray]
        }
    }

    func testImplicitlyUnwrappedOptionalSetOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var set: Set<StringRawType>! = [StringRawType.value]
        let otherSet: Set<StringRawType>! = [StringRawType.otherValue]
        var emptySet: Set<StringRawType>! = []

        // Positive
        assertNoThrow {
            set <~ map[JsonKeys.set]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            otherSet >>> map[JsonKeys.otherSet]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherSet).value)
        }
        assertNoThrow {
            emptySet <~ map[JsonKeys.emptySet]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
    }
}

// ----------------------------------------------------------------------------
