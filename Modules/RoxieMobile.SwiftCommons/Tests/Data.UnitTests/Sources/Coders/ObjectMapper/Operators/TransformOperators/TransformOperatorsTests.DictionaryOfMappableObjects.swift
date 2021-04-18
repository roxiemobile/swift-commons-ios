// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.DictionaryOfMappableObjects.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Dictionary of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testDictionaryOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfMappableObjects)

        let _dictionary: [String: Vector3DModel] = [:]

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.dictionary], Vector3DTransform.shared)
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.object]?.dx, Int(Int8.max))
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.emptyDictionary], Vector3DTransform.shared)
            XCTAssertEqual(dict.count, 0)
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, [JsonKeys.object: Vector3DModel.shared])
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.object]?.dx, Int(Int16.max))
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.nilDictionary], Vector3DTransform.shared, [:])
            XCTAssertEqual(dict.count, 0)
        }

        // Negative
        assertThrowsException {
            var dict = _dictionary
            dict <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
        }
        assertThrowsException {
            var dict = _dictionary
            dict <~ (map[JsonKeys.invalidDictionary], Vector3DTransform.shared)
        }
        assertThrowsException {
            var dict = _dictionary
            dict <~ (map[JsonKeys.invalidDictionary], Vector3DTransform.shared, [:])
        }
        assertThrowsException {
            var dict = _dictionary
            dict <~ (map[JsonKeys.nilDictionary], Vector3DTransform.shared)
        }
    }

    func testDictionaryOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _dictionary = [JsonKeys.object: Vector3DModel.shared]
        let _emptyDictionary: [String: Vector3DModel] = [:]

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.dictionary], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            var dict = _emptyDictionary
            dict <~ (map[JsonKeys.emptyDictionary], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional dictionary of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testOptionalDictionaryOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfMappableObjects)

        let _dictionary: [String: Vector3DModel]? = nil

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.dictionary], Vector3DTransform.shared)
            XCTAssertEqual(dict?.count ?? -1, 1)
            XCTAssertEqual(dict?[JsonKeys.object]?.dx, Int(Int8.max))
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.emptyDictionary], Vector3DTransform.shared)
            XCTAssertEqual(dict?.count ?? -1, 0)
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
            XCTAssertNil(dict)
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, [JsonKeys.object: Vector3DModel.shared])
            XCTAssertEqual(dict?.count ?? -1, 1)
            XCTAssertEqual(dict?[JsonKeys.object]?.dx, Int(Int16.max))
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.nilDictionary], Vector3DTransform.shared)
            XCTAssertNil(dict)
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.nilDictionary], Vector3DTransform.shared, [:])
            XCTAssertEqual(dict?.count, 0)
        }

        // Negative
        assertThrowsException {
            var dict = _dictionary
            dict <~ (map[JsonKeys.invalidDictionary], Vector3DTransform.shared)
        }
        assertThrowsException {
            var dict = _dictionary
            dict <~ (map[JsonKeys.invalidDictionary], Vector3DTransform.shared, [:])
        }
    }

    func testOptionalDictionaryOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _dictionary: [String: Vector3DModel]? = [JsonKeys.object: Vector3DModel.shared]
        let _emptyDictionary: [String: Vector3DModel]? = [:]
        let _nilDictionary: [String: Vector3DModel]? = nil

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.dictionary], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            var dict = _emptyDictionary
            dict <~ (map[JsonKeys.emptyDictionary], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
        assertNoThrow {
            var dict = _nilDictionary
            dict <~ (map[JsonKeys.nilDictionary], Vector3DTransform.shared)
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional dictionary of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalDictionaryOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfMappableObjects)

        let _dictionary: [String: Vector3DModel]! = [:]

        // Positive
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ (map[JsonKeys.dictionary], Vector3DTransform.shared)
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.object]?.dx, Int(Int8.max))
        }
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ (map[JsonKeys.emptyDictionary], Vector3DTransform.shared)
            XCTAssertEqual(dict.count, 0)
        }
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
            XCTAssertNil(dict)
        }
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, [JsonKeys.object: Vector3DModel.shared])
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.object]?.dx, Int(Int16.max))
        }
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ (map[JsonKeys.nilDictionary], Vector3DTransform.shared)
            XCTAssertNil(dict)
        }
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ (map[JsonKeys.nilDictionary], Vector3DTransform.shared, [:])
            XCTAssertEqual(dict?.count, 0)
        }

        // Negative
        assertThrowsException {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ (map[JsonKeys.invalidDictionary], Vector3DTransform.shared)
        }
        assertThrowsException {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ (map[JsonKeys.invalidDictionary], Vector3DTransform.shared, [:])
        }
    }

    func testImplicitlyUnwrappedOptionalDictionaryOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _dictionary: [String: Vector3DModel]! = [JsonKeys.object: Vector3DModel.shared]
        let _emptyDictionary: [String: Vector3DModel]! = [:]

        // Positive
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ (map[JsonKeys.dictionary], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _emptyDictionary
            dict <~ (map[JsonKeys.emptyDictionary], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}
