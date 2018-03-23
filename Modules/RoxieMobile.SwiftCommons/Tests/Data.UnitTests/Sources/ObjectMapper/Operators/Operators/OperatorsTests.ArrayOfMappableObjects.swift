// ----------------------------------------------------------------------------
//
//  OperatorsTests.ArrayOfMappableObjects.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Array of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testArrayOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        var array: [Vector3DModel] = []

        // Positive
        assertNoThrow {
            array <~ map[JsonKeys.array]
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0].x, Int(Int8.max))
        }
        assertNoThrow {
            array <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(array.count, 0)
        }
        assertNoThrow {
            array <~ map[JsonKeys.noSuchKey, default: [Constants.dictionaryOfInt8]]
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0].x, Int(Int8.max))
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

    func testArrayOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var array = [Vector3DModel.shared]
        var emptyArray: [Vector3DModel] = []

        // Positive
        assertNoThrow {
            array <~ map[JsonKeys.array]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            emptyArray <~ map[JsonKeys.emptyArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional array of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testOptionalArrayOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        var array: [Vector3DModel]? = nil

        // Positive
        assertNoThrow {
            array <~ map[JsonKeys.array]
            XCTAssertEqual(array?.count ?? -1, 1)
            XCTAssertEqual(array?[0].x, Int(Int8.max))
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
            array <~ map[JsonKeys.noSuchKey, default: [Constants.dictionaryOfInt8]]
            XCTAssertEqual(array?.count ?? -1, 1)
            XCTAssertEqual(array?[0].x, Int(Int8.max))
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

    func testOptionalArrayOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var array: [Vector3DModel]? = [Vector3DModel.shared]
        var emptyArray: [Vector3DModel]? = []
        var nilArray: [Vector3DModel]? = nil

        // Positive
        assertNoThrow {
            array <~ map[JsonKeys.array]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
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
// MARK: - Implicitly unwrapped Optional array of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalArrayOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        var array: [Vector3DModel]! = []

        // Positive
        assertNoThrow {
            array <~ map[JsonKeys.array]
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0].x, Int(Int8.max))
        }
        assertNoThrow {
            array <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(array.count, 0)
        }
        assertNoThrow {
            array <~ map[JsonKeys.noSuchKey, default: [Constants.dictionaryOfInt8]]
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0].x, Int(Int8.max))
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

    func testImplicitlyUnwrappedOptionalArrayOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var array: [Vector3DModel]! = [Vector3DModel.shared]
        var emptyArray: [Vector3DModel]! = []

        // Positive
        assertNoThrow {
            array <~ map[JsonKeys.array]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            emptyArray <~ map[JsonKeys.emptyArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
