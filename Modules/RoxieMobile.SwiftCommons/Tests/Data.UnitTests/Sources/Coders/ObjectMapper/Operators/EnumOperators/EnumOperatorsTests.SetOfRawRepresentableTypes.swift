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

        let _set: Set<StringRawType> = []

        // Positive
        assertNoThrow {
            var set = _set
            set <~ map[JsonKeys.array]
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, StringRawType.value)
        }
        assertNoThrow {
            var set = _set
            set <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(set.count, 0)
        }
        assertNoThrow {
            var set = _set
            set <~ map[JsonKeys.noSuchKey, default: [StringRawType.otherValue.rawValue]]
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, StringRawType.otherValue)
        }
        assertNoThrow {
            var set = _set
            set <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(set.count, 0)
        }

        // Negative
        assertThrowsException {
            var set = _set
            set <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var set = _set
            set <~ map[JsonKeys.invalidArray]
        }
        assertThrowsException {
            var set = _set
            set <~ map[JsonKeys.nilArray]
        }
    }

    func testSetOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _set: Set<StringRawType> = [StringRawType.value]
        let _otherSet: Set<StringRawType> = [StringRawType.otherValue]
        let _emptySet: Set<StringRawType> = []

        // Positive
        assertNoThrow {
            var set = _set
            set <~ map[JsonKeys.set]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            let set = _otherSet
            set >>> map[JsonKeys.otherSet]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherSet).value)
        }
        assertNoThrow {
            var set = _emptySet
            set <~ map[JsonKeys.emptySet]
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

        let _set: Set<StringRawType>? = nil

        // Positive
        assertNoThrow {
            var set = _set
            set <~ map[JsonKeys.array]
            XCTAssertEqual(set?.count ?? -1, 1)
            XCTAssertEqual(set?.first, StringRawType.value)
        }
        assertNoThrow {
            var set = _set
            set <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(set?.count ?? -1, 0)
        }
        assertNoThrow {
            var set = _set
            set <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(set)
        }
        assertNoThrow {
            var set = _set
            set <~ map[JsonKeys.noSuchKey, default: [StringRawType.otherValue.rawValue]]
            XCTAssertEqual(set?.count ?? -1, 1)
            XCTAssertEqual(set?.first, StringRawType.otherValue)
        }
        assertNoThrow {
            var set = _set
            set <~ map[JsonKeys.nilArray]
            XCTAssertNil(set)
        }
        assertNoThrow {
            var set = _set
            set <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(set?.count ?? -1, 0)
        }

        // Negative
        assertThrowsException {
            var set = _set
            set <~ map[JsonKeys.invalidArray]
        }
    }

    func testOptionalSetOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _set: Set<StringRawType>? = [StringRawType.value]
        let _otherSet: Set<StringRawType>? = [StringRawType.otherValue]
        let _emptySet: Set<StringRawType>? = []
        let _nilSet: Set<StringRawType>? = nil

        // Positive
        assertNoThrow {
            var set = _set
            set <~ map[JsonKeys.set]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            let set = _otherSet
            set >>> map[JsonKeys.otherSet]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherSet).value)
        }
        assertNoThrow {
            var set = _emptySet
            set <~ map[JsonKeys.emptySet]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
        assertNoThrow {
            var set = _nilSet
            set <~ map[JsonKeys.nilSet]
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

        let _set: Set<StringRawType>! = []

        // Positive
        assertNoThrow {
            var set: Set<StringRawType>! = _set
            set <~ map[JsonKeys.array]
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, StringRawType.value)
        }
        assertNoThrow {
            var set: Set<StringRawType>! = _set
            set <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(set.count, 0)
        }
        assertNoThrow {
            var set: Set<StringRawType>! = _set
            set <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(set)
        }
        assertNoThrow {
            var set: Set<StringRawType>! = _set
            set <~ map[JsonKeys.noSuchKey, default: [StringRawType.otherValue.rawValue]]
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, StringRawType.otherValue)
        }
        assertNoThrow {
            var set: Set<StringRawType>! = _set
            set <~ map[JsonKeys.nilArray]
            XCTAssertNil(set)
        }
        assertNoThrow {
            var set: Set<StringRawType>! = _set
            set <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(set.count, 0)
        }

        // Negative
        assertThrowsException {
            var set: Set<StringRawType>! = _set
            set <~ map[JsonKeys.invalidArray]
        }
    }

    func testImplicitlyUnwrappedOptionalSetOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _set: Set<StringRawType>! = [StringRawType.value]
        let _otherSet: Set<StringRawType>! = [StringRawType.otherValue]
        let _emptySet: Set<StringRawType>! = []

        // Positive
        assertNoThrow {
            var set: Set<StringRawType>! = _set
            set <~ map[JsonKeys.set]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            let set: Set<StringRawType>! = _otherSet
            set >>> map[JsonKeys.otherSet]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherSet).value)
        }
        assertNoThrow {
            var set: Set<StringRawType>! = _emptySet
            set <~ map[JsonKeys.emptySet]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
    }
}

// ----------------------------------------------------------------------------
