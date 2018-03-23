// ----------------------------------------------------------------------------
//
//  OperatorsTests.DictionaryOfMappableObjects.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Dictionary of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testDictionaryOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfMappableObjects)

        var dictionary: [String: Vector3DModel] = [:]

        // Positive
        assertNoThrow {
            dictionary <~ map[JsonKeys.dictionary]
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.emptyDictionary]
            XCTAssertEqual(dictionary.count, 0)
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.noSuchKey, default: [JsonKeys.object: Constants.dictionaryOfInt8]]
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.nilDictionary, default: [:]]
            XCTAssertEqual(dictionary.count, 0)
        }

        // Negative
        assertThrowsException {
            dictionary <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            dictionary <~ map[JsonKeys.invalidDictionary]
        }
        assertThrowsException {
            dictionary <~ map[JsonKeys.nilDictionary]
        }
    }

    func testDictionaryOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var dictionary = [JsonKeys.object: Vector3DModel.shared]
        var emptyDictionary: [String: Vector3DModel] = [:]

        // Positive
        assertNoThrow {
            dictionary <~ map[JsonKeys.dictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            emptyDictionary <~ map[JsonKeys.emptyDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional dictionary of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testOptionalDictionaryOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfMappableObjects)

        var dictionary: [String: Vector3DModel]? = [:]

        // Positive
        assertNoThrow {
            dictionary <~ map[JsonKeys.dictionary]
            XCTAssertEqual(dictionary?.count ?? -1, 1)
            XCTAssertEqual(dictionary?[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.emptyDictionary]
            XCTAssertEqual(dictionary?.count ?? -1, 0)
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(dictionary)
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.noSuchKey, default: [JsonKeys.object: Constants.dictionaryOfInt8]]
            XCTAssertEqual(dictionary?.count ?? -1, 1)
            XCTAssertEqual(dictionary?[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.nilDictionary]
            XCTAssertNil(dictionary)
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.nilDictionary, default: [:]]
            XCTAssertEqual(dictionary?.count, 0)
        }

        // Negative
        assertThrowsException {
            dictionary <~ map[JsonKeys.invalidDictionary]
        }
    }

    func testOptionalDictionaryOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var dictionary: [String: Vector3DModel]? = [JsonKeys.object: Vector3DModel.shared]
        var emptyDictionary: [String: Vector3DModel]? = [:]
        var nilDictionary: [String: Vector3DModel]? = nil

        // Positive
        assertNoThrow {
            dictionary <~ map[JsonKeys.dictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            emptyDictionary <~ map[JsonKeys.emptyDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
        assertNoThrow {
            nilDictionary <~ map[JsonKeys.nilDictionary]
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional dictionary of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalDictionaryOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfMappableObjects)

        var dictionary: [String: Vector3DModel]! = [:]

        // Positive
        assertNoThrow {
            dictionary <~ map[JsonKeys.dictionary]
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.emptyDictionary]
            XCTAssertEqual(dictionary.count, 0)
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.noSuchKey, default: [JsonKeys.object: Constants.dictionaryOfInt8]]
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.nilDictionary, default: [:]]
            XCTAssertEqual(dictionary.count, 0)
        }

        // Negative
        assertThrowsException {
            dictionary <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            dictionary <~ map[JsonKeys.invalidDictionary]
        }
        assertThrowsException {
            dictionary <~ map[JsonKeys.nilDictionary]
        }
    }

    func testImplicitlyUnwrappedOptionalDictionaryOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var dictionary: [String: Vector3DModel]! = [JsonKeys.object: Vector3DModel.shared]
        var emptyDictionary: [String: Vector3DModel]! = [:]

        // Positive
        assertNoThrow {
            dictionary <~ map[JsonKeys.dictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            emptyDictionary <~ map[JsonKeys.emptyDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
