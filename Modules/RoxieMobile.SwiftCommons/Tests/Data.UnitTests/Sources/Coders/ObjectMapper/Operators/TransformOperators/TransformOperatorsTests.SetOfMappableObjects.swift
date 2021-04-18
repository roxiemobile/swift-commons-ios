// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.SetOfMappableObjects.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Set of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testSetOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        let _set: Set<Vector3DModel> = []

        // Positive
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first?.dx, Int(Int8.max))
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertEqual(set.count, 0)
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, Set([Vector3DModel.shared]))
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first?.dx, Int(Int16.max))
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.nilArray], Vector3DTransform.shared, Set())
            XCTAssertEqual(set.count, 0)
        }

        // Negative
        assertThrowsException {
            var set = _set
            set <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
        }
        assertThrowsException {
            var set = _set
            set <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared)
        }
        assertThrowsException {
            var set = _set
            set <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared, Set())
        }
        assertThrowsException {
            var set = _set
            set <~ (map[JsonKeys.nilArray], Vector3DTransform.shared)
        }
    }

    func testSetOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _set: Set<Vector3DModel> = [Vector3DModel.shared]
        let _emptySet: Set<Vector3DModel> = []

        // Positive
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.set], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            var set = _emptySet
            set <~ (map[JsonKeys.emptySet], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional set of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testOptionalSetOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        let _set: Set<Vector3DModel>? = nil

        // Positive
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertEqual(set?.count ?? -1, 1)
            XCTAssertEqual(set?.first?.dx, Int(Int8.max))
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertEqual(set?.count ?? -1, 0)
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
            XCTAssertNil(set)
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, Set([Vector3DModel.shared]))
            XCTAssertEqual(set?.count ?? -1, 1)
            XCTAssertEqual(set?.first?.dx, Int(Int16.max))
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.nilArray], Vector3DTransform.shared)
            XCTAssertNil(set)
        }
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.nilArray], Vector3DTransform.shared, Set())
            XCTAssertEqual(set?.count ?? -1, 0)
        }

        // Negative
        assertThrowsException {
            var set = _set
            set <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared)
        }
        assertThrowsException {
            var set = _set
            set <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared, Set())
        }
    }

    func testOptionalSetOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _set: Set<Vector3DModel>? = [Vector3DModel.shared]
        let _emptySet: Set<Vector3DModel>? = []
        let _nilSet: Set<Vector3DModel>? = nil

        // Positive
        assertNoThrow {
            var set = _set
            set <~ (map[JsonKeys.set], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            var set = _emptySet
            set <~ (map[JsonKeys.emptySet], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
        assertNoThrow {
            var set = _nilSet
            set <~ (map[JsonKeys.nilSet], Vector3DTransform.shared)
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilSet).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional set of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalSetOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        let _set: Set<Vector3DModel>! = []

        // Positive
        assertNoThrow {
            var set: Set<Vector3DModel>! = _set
            set <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first?.dx, Int(Int8.max))
        }
        assertNoThrow {
            var set: Set<Vector3DModel>! = _set
            set <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertEqual(set.count, 0)
        }
        assertNoThrow {
            var set: Set<Vector3DModel>! = _set
            set <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
            XCTAssertNil(set)
        }
        assertNoThrow {
            var set: Set<Vector3DModel>! = _set
            set <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, Set([Vector3DModel.shared]))
            XCTAssertEqual(set.count, 1)
            XCTAssertEqual(set.first?.dx, Int(Int16.max))
        }
        assertNoThrow {
            var set: Set<Vector3DModel>! = _set
            set <~ (map[JsonKeys.nilArray], Vector3DTransform.shared)
            XCTAssertNil(set)
        }
        assertNoThrow {
            var set: Set<Vector3DModel>! = _set
            set <~ (map[JsonKeys.nilArray], Vector3DTransform.shared, Set())
            XCTAssertEqual(set.count, 0)
        }

        // Negative
        assertThrowsException {
            var set: Set<Vector3DModel>! = _set
            set <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared)
        }
        assertThrowsException {
            var set: Set<Vector3DModel>! = _set
            set <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared, Set())
        }
    }

    func testImplicitlyUnwrappedOptionalSetOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _set: Set<Vector3DModel>! = [Vector3DModel.shared]
        let _emptySet: Set<Vector3DModel>! = []

        // Positive
        assertNoThrow {
            var set: Set<Vector3DModel>! = _set
            set <~ (map[JsonKeys.set], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.set).value)
        }
        assertNoThrow {
            var set: Set<Vector3DModel>! = _emptySet
            set <~ (map[JsonKeys.emptySet], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptySet).value)
        }
    }
}
