// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.ArrayOfMappableObjects.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Array of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testArrayOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        var array: [Vector3DModel] = []

        // Positive
        assertNoThrow {
            array <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0].x, Int(Int8.max))
        }
        assertNoThrow {
            array <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertEqual(array.count, 0)
        }
        assertNoThrow {
            array <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, [Vector3DModel.shared])
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0].x, Int(Int16.max))
        }
        assertNoThrow {
            array <~ (map[JsonKeys.nilArray], Vector3DTransform.shared, [])
            XCTAssertEqual(array.count, 0)
        }

        // Negative
        assertThrowsException {
            array <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
        }
        assertThrowsException {
            array <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared)
        }
        assertThrowsException {
            array <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared, [])
        }
        assertThrowsException {
            array <~ (map[JsonKeys.nilArray], Vector3DTransform.shared)
        }
    }

    func testArrayOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var array = [Vector3DModel.shared]
        var emptyArray: [Vector3DModel] = []

        // Positive
        assertNoThrow {
            array <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            emptyArray <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional array of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testOptionalArrayOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        var array: [Vector3DModel]? = nil

        // Positive
        assertNoThrow {
            array <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertEqual(array?.count ?? -1, 1)
            XCTAssertEqual(array?[0].x, Int(Int8.max))
        }
        assertNoThrow {
            array <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertEqual(array?.count ?? -1, 0)
        }
        assertNoThrow {
            array <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
            XCTAssertNil(array)
        }
        assertNoThrow {
            array <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, [Vector3DModel.shared])
            XCTAssertEqual(array?.count ?? -1, 1)
            XCTAssertEqual(array?[0].x, Int(Int16.max))
        }
        assertNoThrow {
            array <~ (map[JsonKeys.nilArray], Vector3DTransform.shared)
            XCTAssertNil(array)
        }
        assertNoThrow {
            array <~ (map[JsonKeys.nilArray], Vector3DTransform.shared, [])
            XCTAssertEqual(array?.count ?? -1, 0)
        }

        // Negative
        assertThrowsException {
            array <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared)
        }
        assertThrowsException {
            array <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared, [])
        }
    }

    func testOptionalArrayOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var array: [Vector3DModel]? = [Vector3DModel.shared]
        var emptyArray: [Vector3DModel]? = []
        var nilArray: [Vector3DModel]? = nil

        // Positive
        assertNoThrow {
            array <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            emptyArray <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
        assertNoThrow {
            nilArray <~ (map[JsonKeys.nilArray], Vector3DTransform.shared)
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped Optional array of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalArrayOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfMappableObjects)

        var array: [Vector3DModel]! = []

        // Positive
        assertNoThrow {
            array <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0].x, Int(Int8.max))
        }
        assertNoThrow {
            array <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertEqual(array.count, 0)
        }
        assertNoThrow {
            array <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, [Vector3DModel.shared])
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0].x, Int(Int16.max))
        }
        assertNoThrow {
            array <~ (map[JsonKeys.nilArray], Vector3DTransform.shared, [])
            XCTAssertEqual(array.count, 0)
        }

        // Negative
        assertThrowsException {
            array <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
        }
        assertThrowsException {
            array <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared)
        }
        assertThrowsException {
            array <~ (map[JsonKeys.invalidArray], Vector3DTransform.shared, [])
        }
        assertThrowsException {
            array <~ (map[JsonKeys.nilArray], Vector3DTransform.shared)
        }
    }

    func testImplicitlyUnwrappedOptionalArrayOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var array: [Vector3DModel]! = [Vector3DModel.shared]
        var emptyArray: [Vector3DModel]! = []

        // Positive
        assertNoThrow {
            array <~ (map[JsonKeys.array], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            emptyArray <~ (map[JsonKeys.emptyArray], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
