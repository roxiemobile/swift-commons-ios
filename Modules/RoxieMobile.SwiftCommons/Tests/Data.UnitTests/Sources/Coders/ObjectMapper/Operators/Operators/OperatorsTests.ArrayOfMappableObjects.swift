// ----------------------------------------------------------------------------
//
//  OperatorsTests.ArrayOfMappableObjects.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Array of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testArrayOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        let _array: [Vector3DModel] = []

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.array]
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0].dx, Int(Int8.max))
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(arr.count, 0)
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.noSuchKey, default: [Constants.dictionaryOfInt8]]
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0].dx, Int(Int8.max))
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(arr.count, 0)
        }

        // Negative
        assertThrowsException {
            var arr = _array
            arr <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var arr = _array
            arr <~ map[JsonKeys.invalidArray]
        }
        assertThrowsException {
            var arr = _array
            arr <~ map[JsonKeys.nilArray]
        }
    }

    func testArrayOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _array = [Vector3DModel.shared]
        let _emptyArray: [Vector3DModel] = []

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.array]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            var arr = _emptyArray
            arr <~ map[JsonKeys.emptyArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional array of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testOptionalArrayOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        let _array: [Vector3DModel]? = nil

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.array]
            XCTAssertEqual(arr?.count ?? -1, 1)
            XCTAssertEqual(arr?[0].dx, Int(Int8.max))
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(arr?.count ?? -1, 0)
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.noSuchKey, default: [Constants.dictionaryOfInt8]]
            XCTAssertEqual(arr?.count ?? -1, 1)
            XCTAssertEqual(arr?[0].dx, Int(Int8.max))
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.nilArray]
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(arr?.count ?? -1, 0)
        }

        // Negative
        assertThrowsException {
            var arr = _array
            arr <~ map[JsonKeys.invalidArray]
        }
    }

    func testOptionalArrayOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _array: [Vector3DModel]? = [Vector3DModel.shared]
        let _emptyArray: [Vector3DModel]? = []
        let _nilArray: [Vector3DModel]? = nil

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.array]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            var arr = _emptyArray
            arr <~ map[JsonKeys.emptyArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
        assertNoThrow {
            var arr = _nilArray
            arr <~ map[JsonKeys.nilArray]
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped Optional array of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalArrayOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        let _array: [Vector3DModel]! = []

        // Positive
        assertNoThrow {
            var arr: [Vector3DModel]! = _array
            arr <~ map[JsonKeys.array]
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0].dx, Int(Int8.max))
        }
        assertNoThrow {
            var arr: [Vector3DModel]! = _array
            arr <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(arr.count, 0)
        }
        assertNoThrow {
            var arr: [Vector3DModel]! = _array
            arr <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr: [Vector3DModel]! = _array
            arr <~ map[JsonKeys.noSuchKey, default: [Constants.dictionaryOfInt8]]
            XCTAssertEqual(arr?.count ?? -1, 1)
            XCTAssertEqual(arr?[0].dx, Int(Int8.max))
        }
        assertNoThrow {
            var arr: [Vector3DModel]! = _array
            arr <~ map[JsonKeys.nilArray]
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr: [Vector3DModel]! = _array
            arr <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(arr?.count ?? -1, 0)
        }

        // Negative
        assertThrowsException {
            var arr: [Vector3DModel]! = _array
            arr <~ map[JsonKeys.invalidArray]
        }
    }

    func testImplicitlyUnwrappedOptionalArrayOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _array: [Vector3DModel]! = [Vector3DModel.shared]
        let _emptyArray: [Vector3DModel]! = []

        // Positive
        assertNoThrow {
            var arr: [Vector3DModel]! = _array
            arr <~ map[JsonKeys.array]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            var arr: [Vector3DModel]! = _emptyArray
            arr <~ map[JsonKeys.emptyArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}
