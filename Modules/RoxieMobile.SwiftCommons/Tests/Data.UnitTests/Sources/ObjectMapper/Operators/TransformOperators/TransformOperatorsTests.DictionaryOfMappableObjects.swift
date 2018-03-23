// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.DictionaryOfMappableObjects.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Dictionary of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testDictionaryOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfMappableObjects)

        var dictionary: [String: Vector3DModel] = [:]

        // Positive
        assertNoThrow {
            dictionary <~ (map[JsonKeys.dictionary], Vector3DTransform.shared)
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.emptyDictionary], Vector3DTransform.shared)
            XCTAssertEqual(dictionary.count, 0)
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, [JsonKeys.object: Vector3DModel.shared])
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.object]?.x, Int(Int16.max))
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.nilDictionary], Vector3DTransform.shared, [:])
            XCTAssertEqual(dictionary.count, 0)
        }

        // Negative
        assertThrowsException {
            dictionary <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
        }
        assertThrowsException {
            dictionary <~ (map[JsonKeys.invalidDictionary], Vector3DTransform.shared)
        }
        assertThrowsException {
            dictionary <~ (map[JsonKeys.invalidDictionary], Vector3DTransform.shared, [:])
        }
        assertThrowsException {
            dictionary <~ (map[JsonKeys.nilDictionary], Vector3DTransform.shared)
        }
    }

    func testDictionaryOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var dictionary = [JsonKeys.object: Vector3DModel.shared]
        var emptyDictionary: [String: Vector3DModel] = [:]

        // Positive
        assertNoThrow {
            dictionary <~ (map[JsonKeys.dictionary], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            emptyDictionary <~ (map[JsonKeys.emptyDictionary], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional dictionary of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testOptionalDictionaryOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfMappableObjects)

        var dictionary: [String: Vector3DModel]? = [:]

        // Positive
        assertNoThrow {
            dictionary <~ (map[JsonKeys.dictionary], Vector3DTransform.shared)
            XCTAssertEqual(dictionary?.count ?? -1, 1)
            XCTAssertEqual(dictionary?[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.emptyDictionary], Vector3DTransform.shared)
            XCTAssertEqual(dictionary?.count ?? -1, 0)
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
            XCTAssertNil(dictionary)
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, [JsonKeys.object: Vector3DModel.shared])
            XCTAssertEqual(dictionary?.count ?? -1, 1)
            XCTAssertEqual(dictionary?[JsonKeys.object]?.x, Int(Int16.max))
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.nilDictionary], Vector3DTransform.shared)
            XCTAssertNil(dictionary)
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.nilDictionary], Vector3DTransform.shared, [:])
            XCTAssertEqual(dictionary?.count, 0)
        }

        // Negative
        assertThrowsException {
            dictionary <~ (map[JsonKeys.invalidDictionary], Vector3DTransform.shared)
        }
        assertThrowsException {
            dictionary <~ (map[JsonKeys.invalidDictionary], Vector3DTransform.shared, [:])
        }
    }

    func testOptionalDictionaryOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var dictionary: [String: Vector3DModel]? = [JsonKeys.object: Vector3DModel.shared]
        var emptyDictionary: [String: Vector3DModel]? = [:]
        var nilDictionary: [String: Vector3DModel]? = nil

        // Positive
        assertNoThrow {
            dictionary <~ (map[JsonKeys.dictionary], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            emptyDictionary <~ (map[JsonKeys.emptyDictionary], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
        assertNoThrow {
            nilDictionary <~ (map[JsonKeys.nilDictionary], Vector3DTransform.shared)
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional dictionary of Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalDictionaryOfMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfMappableObjects)

        var dictionary: [String: Vector3DModel]! = [:]

        // Positive
        assertNoThrow {
            dictionary <~ (map[JsonKeys.dictionary], Vector3DTransform.shared)
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.emptyDictionary], Vector3DTransform.shared)
            XCTAssertEqual(dictionary.count, 0)
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, [JsonKeys.object: Vector3DModel.shared])
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.object]?.x, Int(Int16.max))
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.nilDictionary], Vector3DTransform.shared, [:])
            XCTAssertEqual(dictionary.count, 0)
        }

        // Negative
        assertThrowsException {
            dictionary <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
        }
        assertThrowsException {
            dictionary <~ (map[JsonKeys.invalidDictionary], Vector3DTransform.shared)
        }
        assertThrowsException {
            dictionary <~ (map[JsonKeys.invalidDictionary], Vector3DTransform.shared, [:])
        }
        assertThrowsException {
            dictionary <~ (map[JsonKeys.nilDictionary], Vector3DTransform.shared)
        }
    }

    func testImplicitlyUnwrappedOptionalDictionaryOfMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var dictionary: [String: Vector3DModel]! = [JsonKeys.object: Vector3DModel.shared]
        var emptyDictionary: [String: Vector3DModel]! = [:]

        // Positive
        assertNoThrow {
            dictionary <~ (map[JsonKeys.dictionary], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            emptyDictionary <~ (map[JsonKeys.emptyDictionary], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
