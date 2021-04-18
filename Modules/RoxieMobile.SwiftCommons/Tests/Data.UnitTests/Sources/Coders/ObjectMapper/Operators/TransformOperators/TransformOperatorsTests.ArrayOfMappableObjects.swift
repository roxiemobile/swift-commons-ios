// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.ArrayOfMappableObjects.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Array of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testArrayOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        let _array: [Vector3DModel] = []

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0].dx, Int(Int8.max))
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertEqual(arr.count, 0)
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, [Vector3DModel.shared])
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0].dx, Int(Int16.max))
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.nilArray], Vector3DTransform.shared, [])
            XCTAssertEqual(arr.count, 0)
        }

        // Negative
        assertThrowsException {
            var arr = _array
            arr <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
        }
        assertThrowsException {
            var arr = _array
            arr <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared)
        }
        assertThrowsException {
            var arr = _array
            arr <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared, [])
        }
        assertThrowsException {
            var arr = _array
            arr <~ (map[JsonKeys.nilArray], Vector3DTransform.shared)
        }
    }

    func testArrayOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _array = [Vector3DModel.shared]
        let _emptyArray: [Vector3DModel] = []

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            var arr = _emptyArray
            arr <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional array of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testOptionalArrayOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        let _array: [Vector3DModel]? = nil

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertEqual(arr?.count ?? -1, 1)
            XCTAssertEqual(arr?[0].dx, Int(Int8.max))
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertEqual(arr?.count ?? -1, 0)
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, [Vector3DModel.shared])
            XCTAssertEqual(arr?.count ?? -1, 1)
            XCTAssertEqual(arr?[0].dx, Int(Int16.max))
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.nilArray], Vector3DTransform.shared)
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.nilArray], Vector3DTransform.shared, [])
            XCTAssertEqual(arr?.count ?? -1, 0)
        }

        // Negative
        assertThrowsException {
            var arr = _array
            arr <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared)
        }
        assertThrowsException {
            var arr = _array
            arr <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared, [])
        }
    }

    func testOptionalArrayOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _array: [Vector3DModel]? = [Vector3DModel.shared]
        let _emptyArray: [Vector3DModel]? = []
        let _nilArray: [Vector3DModel]? = nil

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            var arr = _emptyArray
            arr <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
        assertNoThrow {
            var arr = _nilArray
            arr <~ (map[JsonKeys.nilArray], Vector3DTransform.shared)
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped Optional array of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalArrayOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        let _array: [Vector3DModel]! = []

        // Positive
        assertNoThrow {
            var arr: [Vector3DModel]! = _array
            arr <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0].dx, Int(Int8.max))
        }
        assertNoThrow {
            var arr: [Vector3DModel]! = _array
            arr <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertEqual(arr.count, 0)
        }
        assertNoThrow {
            var arr: [Vector3DModel]! = _array
            arr <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr: [Vector3DModel]! = _array
            arr <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, [Vector3DModel.shared])
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0].dx, Int(Int16.max))
        }
        assertNoThrow {
            var arr: [Vector3DModel]! = _array
            arr <~ (map[JsonKeys.nilArray], Vector3DTransform.shared)
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr: [Vector3DModel]! = _array
            arr <~ (map[JsonKeys.nilArray], Vector3DTransform.shared, [])
            XCTAssertEqual(arr.count, 0)
        }

        // Negative
        assertThrowsException {
            var arr: [Vector3DModel]! = _array
            arr <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared)
        }
        assertThrowsException {
            var arr: [Vector3DModel]! = _array
            arr <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared, [])
        }
    }

    func testImplicitlyUnwrappedOptionalArrayOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _array: [Vector3DModel]! = [Vector3DModel.shared]
        let _emptyArray: [Vector3DModel]! = []

        // Positive
        assertNoThrow {
            var arr: [Vector3DModel]! = _array
            arr <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            var arr: [Vector3DModel]! = _emptyArray
            arr <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}
