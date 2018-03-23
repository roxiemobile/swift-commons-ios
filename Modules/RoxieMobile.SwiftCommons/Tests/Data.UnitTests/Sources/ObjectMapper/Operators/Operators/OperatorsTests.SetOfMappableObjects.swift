// ----------------------------------------------------------------------------
//
//  OperatorsTests.SetOfMappableObjects.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Set of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testSetOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        var set: Set<Vector3DModel> = []

        // Positive
        assertNoThrow {
            set <~ map[JsonKeys.array]
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first?.x, Int(Int8.max))
        }
        assertNoThrow {
            set <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(set.count, 0)
        }
        assertNoThrow {
            set <~ map[JsonKeys.noSuchKey, default: [Constants.dictionaryOfInt8]]
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first?.x, Int(Int8.max))
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

    func testSetOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var set: Set<Vector3DModel> = [Vector3DModel.shared]
        var emptySet: Set<Vector3DModel> = []

        // Positive
        assertNoThrow {
            set <~ map[JsonKeys.set]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            emptySet <~ map[JsonKeys.emptySet]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Set of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testOptionalSetOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        var set: Set<Vector3DModel>? = nil

        // Positive
        assertNoThrow {
            set <~ map[JsonKeys.array]
            XCTAssertEqual(set?.count ?? -1, 1)
            XCTAssertEqual(set?.first?.x, Int(Int8.max))
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
            set <~ map[JsonKeys.noSuchKey, default: [Constants.dictionaryOfInt8]]
            XCTAssertEqual(set?.count ?? -1, 1)
            XCTAssertEqual(set?.first?.x, Int(Int8.max))
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

    func testOptionalSetOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var set: Set<Vector3DModel>? = [Vector3DModel.shared]
        var emptySet: Set<Vector3DModel>? = []
        var nilSet: Set<Vector3DModel>? = nil

        // Positive
        assertNoThrow {
            set <~ map[JsonKeys.set]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
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
// MARK: - Implicitly unwrapped Optional Set of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalSetOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        var set: Set<Vector3DModel>! = []

        // Positive
        assertNoThrow {
            set <~ map[JsonKeys.array]
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first?.x, Int(Int8.max))
        }
        assertNoThrow {
            set <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(set.count, 0)
        }
        assertNoThrow {
            set <~ map[JsonKeys.noSuchKey, default: [Constants.dictionaryOfInt8]]
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first?.x, Int(Int8.max))
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

    func testImplicitlyUnwrappedOptionalSetOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var set: Set<Vector3DModel>! = [Vector3DModel.shared]
        var emptySet: Set<Vector3DModel>! = []

        // Positive
        assertNoThrow {
            set <~ map[JsonKeys.set]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            emptySet <~ map[JsonKeys.emptySet]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
    }
}

// ----------------------------------------------------------------------------
