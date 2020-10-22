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

extension OperatorsTests {

// MARK: - Tests

    func testDictionaryOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfMappableObjects)

        let _dictionary: [String: Vector3DModel] = [:]

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.dictionary]
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.emptyDictionary]
            XCTAssertEqual(dict.count, 0)
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.noSuchKey, default: [JsonKeys.object: Constants.dictionaryOfInt8]]
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.nilDictionary, default: [:]]
            XCTAssertEqual(dict.count, 0)
        }

        // Negative
        assertThrowsException {
            var dict = _dictionary
            dict <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var dict = _dictionary
            dict <~ map[JsonKeys.invalidDictionary]
        }
        assertThrowsException {
            var dict = _dictionary
            dict <~ map[JsonKeys.nilDictionary]
        }
    }

    func testDictionaryOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _dictionary = [JsonKeys.object: Vector3DModel.shared]
        let _emptyDictionary: [String: Vector3DModel] = [:]

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.dictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            var dict = _emptyDictionary
            dict <~ map[JsonKeys.emptyDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional dictionary of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testOptionalDictionaryOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfMappableObjects)

        let _dictionary: [String: Vector3DModel]? = [:]

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.dictionary]
            XCTAssertEqual(dict?.count ?? -1, 1)
            XCTAssertEqual(dict?[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.emptyDictionary]
            XCTAssertEqual(dict?.count ?? -1, 0)
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(dict)
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.noSuchKey, default: [JsonKeys.object: Constants.dictionaryOfInt8]]
            XCTAssertEqual(dict?.count ?? -1, 1)
            XCTAssertEqual(dict?[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.nilDictionary]
            XCTAssertNil(dict)
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.nilDictionary, default: [:]]
            XCTAssertEqual(dict?.count, 0)
        }

        // Negative
        assertThrowsException {
            var dict = _dictionary
            dict <~ map[JsonKeys.invalidDictionary]
        }
    }

    func testOptionalDictionaryOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _dictionary: [String: Vector3DModel]? = [JsonKeys.object: Vector3DModel.shared]
        let _emptyDictionary: [String: Vector3DModel]? = [:]
        let _nilDictionary: [String: Vector3DModel]? = nil

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.dictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            var dict = _emptyDictionary
            dict <~ map[JsonKeys.emptyDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
        assertNoThrow {
            var dict = _nilDictionary
            dict <~ map[JsonKeys.nilDictionary]
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional dictionary of Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalDictionaryOfMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfMappableObjects)

        let _dictionary: [String: Vector3DModel]! = [:]

        // Positive
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ map[JsonKeys.dictionary]
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ map[JsonKeys.emptyDictionary]
            XCTAssertEqual(dict.count, 0)
        }
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(dict)
        }
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ map[JsonKeys.noSuchKey, default: [JsonKeys.object: Constants.dictionaryOfInt8]]
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.object]?.x, Int(Int8.max))
        }
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ map[JsonKeys.nilDictionary]
            XCTAssertNil(dict)
        }
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ map[JsonKeys.nilDictionary, default: [:]]
            XCTAssertEqual(dict.count, 0)
        }

        // Negative
        assertThrowsException {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ map[JsonKeys.invalidDictionary]
        }
    }

    func testImplicitlyUnwrappedOptionalDictionaryOfMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _dictionary: [String: Vector3DModel]! = [JsonKeys.object: Vector3DModel.shared]
        let _emptyDictionary: [String: Vector3DModel]! = [:]

        // Positive
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _dictionary
            dict <~ map[JsonKeys.dictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            var dict: [String: Vector3DModel]! = _emptyDictionary
            dict <~ map[JsonKeys.emptyDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}
