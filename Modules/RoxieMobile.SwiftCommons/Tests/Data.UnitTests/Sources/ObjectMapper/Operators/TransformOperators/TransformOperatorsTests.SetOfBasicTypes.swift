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

        var set: Set<Int> = []

        // Positive
        assertNoThrow {
            set <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, Int(Int32.max))
        }
        assertNoThrow {
            set <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertEqual(set.count, 0)
        }
        assertNoThrow {
            set <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [Int(Int16.max)])
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, Int(Int16.max))
        }
        assertNoThrow {
            set <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared, [])
            XCTAssertEqual(set.count, 0)
        }

        // Negative
        assertThrowsException {
            set <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            set <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            set <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared, [])
        }
        assertThrowsException {
            set <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared)
        }
    }

    func testSetOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var set: Set<Int> = [Int(Int16.max), Int(Int32.max)]
        var emptySet: Set<Int> = []

        // Positive
        assertNoThrow {
            set <~ (map[JsonKeys.set], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            emptySet <~ (map[JsonKeys.emptySet], StringToIntegerTransform.shared)
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

        var set: Set<Int>? = nil

        // Positive
        assertNoThrow {
            set <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertEqual(set?.count ?? -1, 1)
            XCTAssertEqual(set?.first, Int(Int32.max))
        }
        assertNoThrow {
            set <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertEqual(set?.count ?? -1, 0)
        }
        assertNoThrow {
            set <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
            XCTAssertNil(set)
        }
        assertNoThrow {
            set <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [Int(Int16.max)])
            XCTAssertEqual(set?.count ?? -1, 1)
            XCTAssertEqual(set?.first, Int(Int16.max))
        }
        assertNoThrow {
            set <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared)
            XCTAssertNil(set)
        }
        assertNoThrow {
            set <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared, [])
            XCTAssertEqual(set?.count ?? -1, 0)
        }

        // Negative
        assertThrowsException {
            set <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            set <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared, [])
        }
    }

    func testOptionalSetOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var set: Set<Int>? = [Int(Int16.max), Int(Int32.max)]
        var emptySet: Set<Int>? = []
        var nilSet: Set<Int>? = nil

        // Positive
        assertNoThrow {
            set <~ (map[JsonKeys.set], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            emptySet <~ (map[JsonKeys.emptySet], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
        assertNoThrow {
            nilSet <~ (map[JsonKeys.nilSet], StringToIntegerTransform.shared)
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

        var set: Set<Int>! = []

        // Positive
        assertNoThrow {
            set <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, Int(Int32.max))
        }
        assertNoThrow {
            set <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertEqual(set.count, 0)
        }
        assertNoThrow {
            set <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [Int(Int16.max)])
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first, Int(Int16.max))
        }
        assertNoThrow {
            set <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared, [])
            XCTAssertEqual(set.count, 0)
        }

        // Negative
        assertThrowsException {
            set <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            set <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            set <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared, [])
        }
        assertThrowsException {
            set <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared)
        }
    }

    func testImplicitlyUnwrappedOptionalSetOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var set: Set<Int>! = [Int(Int16.max), Int(Int32.max)]
        var emptySet: Set<Int>! = []

        // Positive
        assertNoThrow {
            set <~ (map[JsonKeys.set], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            emptySet <~ (map[JsonKeys.emptySet], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
    }
}

// ----------------------------------------------------------------------------
