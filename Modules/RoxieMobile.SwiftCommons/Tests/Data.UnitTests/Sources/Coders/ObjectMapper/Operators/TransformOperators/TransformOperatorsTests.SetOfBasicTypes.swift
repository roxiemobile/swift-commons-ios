// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.SetOfBasicTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Set of basic types
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testSetOfBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfIntegerBasicTypes)

        let _set: Set<Int> = []

        // Positive
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, Int(Int32.max))
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertEqual(set.count, 0)
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [Int(Int16.max)])
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, Int(Int16.max))
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared, [])
            XCTAssertEqual(set.count, 0)
        }

        // Negative
        assertThrowsException {
            var set = _set
            set <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var set = _set
            set <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var set = _set
            set <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared, [])
        }
        assertThrowsException {
            var set = _set
            set <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared)
        }
    }

    func testSetOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _set: Set<Int> = [Int(Int16.max), Int(Int32.max)]
        let _emptySet: Set<Int> = []

        // Positive
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.set], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            var set = _emptySet
            set <~ (map[JsonKeys.emptySet], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional set of basic types with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testOptionalSetOfBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfIntegerBasicTypes)

        let _set: Set<Int>? = nil

        // Positive
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertEqual(set?.count ?? -1, 1)
            XCTAssertEqual(set?.first, Int(Int32.max))
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertEqual(set?.count ?? -1, 0)
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
            XCTAssertNil(set)
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [Int(Int16.max)])
            XCTAssertEqual(set?.count ?? -1, 1)
            XCTAssertEqual(set?.first, Int(Int16.max))
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared)
            XCTAssertNil(set)
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared, [])
            XCTAssertEqual(set?.count ?? -1, 0)
        }

        // Negative
        assertThrowsException {
            var set = _set
            set <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var set = _set
            set <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared, [])
        }
    }

    func testOptionalSetOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _set: Set<Int>? = [Int(Int16.max), Int(Int32.max)]
        let _emptySet: Set<Int>? = []
        let _nilSet: Set<Int>? = nil

        // Positive
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.set], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            var set = _emptySet
            set <~ (map[JsonKeys.emptySet], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
        assertNoThrow {
            var set = _nilSet
            set <~ (map[JsonKeys.nilSet], StringToIntegerTransform.shared)
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilSet).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional set of basic types with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalSetOfBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfIntegerBasicTypes)

        let _set: Set<Int>! = []

        // Positive
        assertNoThrow {
            var set: Set<Int>! = _set
            set <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, Int(Int32.max))
        }
        assertNoThrow {
            var set: Set<Int>! = _set
            set <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertEqual(set.count, 0)
        }
        assertNoThrow {
            var set: Set<Int>! = _set
            set <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
            XCTAssertNil(set)
        }
        assertNoThrow {
            var set: Set<Int>! = _set
            set <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [Int(Int16.max)])
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, Int(Int16.max))
        }
        assertNoThrow {
            var set: Set<Int>! = _set
            set <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared)
            XCTAssertNil(set)
        }
        assertNoThrow {
            var set: Set<Int>! = _set
            set <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared, [])
            XCTAssertEqual(set.count, 0)
        }

        // Negative
        assertThrowsException {
            var set: Set<Int>! = _set
            set <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var set: Set<Int>! = _set
            set <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared, [])
        }
    }

    func testImplicitlyUnwrappedOptionalSetOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _set: Set<Int>! = [Int(Int16.max), Int(Int32.max)]
        let _emptySet: Set<Int>! = []

        // Positive
        assertNoThrow {
            var set: Set<Int>! = _set
            set <~ (map[JsonKeys.set], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            var set: Set<Int>! = _emptySet
            set <~ (map[JsonKeys.emptySet], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
    }
}

// ----------------------------------------------------------------------------
