// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.DictionaryOfBasicTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Dictionary of Basic types with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testDictionaryOfBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfIntegerBasicTypes)

        let _dictionary: [String: Int] = [:]

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.dictionary], StringToIntegerTransform.shared)
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.value], Int(Int16.max))
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.emptyDictionary], StringToIntegerTransform.shared)
            XCTAssertEqual(dict.count, 0)
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [JsonKeys.value: Int(Int16.max)])
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.value], Int(Int16.max))
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.nilDictionary], StringToIntegerTransform.shared, [:])
            XCTAssertEqual(dict.count, 0)
        }

        // Negative
        assertThrowsException {
            var dict = _dictionary
            dict <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var dict = _dictionary
            dict <~ (map[JsonKeys.invalidDictionary], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var dict = _dictionary
            dict <~ (map[JsonKeys.invalidDictionary], StringToIntegerTransform.shared, [:])
        }
        assertThrowsException {
            var dict = _dictionary
            dict <~ (map[JsonKeys.nilDictionary], StringToIntegerTransform.shared)
        }
    }

    func testDictionaryOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _dictionary = [JsonKeys.value: Int(Int16.max)]
        let _emptyDictionary: [String: Int] = [:]

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.dictionary], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            var dict = _emptyDictionary
            dict <~ (map[JsonKeys.emptyDictionary], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional dictionary of Basic types with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testOptionalDictionaryOfBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfIntegerBasicTypes)

        let _dictionary: [String: Int]? = nil

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.dictionary], StringToIntegerTransform.shared)
            XCTAssertEqual(dict?.count ?? -1, 1)
            XCTAssertEqual(dict?[JsonKeys.value], Int(Int16.max))
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.emptyDictionary], StringToIntegerTransform.shared)
            XCTAssertEqual(dict?.count ?? -1, 0)
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
            XCTAssertNil(dict)
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [JsonKeys.value: Int(Int16.max)])
            XCTAssertEqual(dict?.count ?? -1, 1)
            XCTAssertEqual(dict?[JsonKeys.value], Int(Int16.max))
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.nilDictionary], StringToIntegerTransform.shared)
            XCTAssertNil(dict)
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.nilDictionary], StringToIntegerTransform.shared, [:])
            XCTAssertEqual(dict?.count, 0)
        }

        // Negative
        assertThrowsException {
            var dict = _dictionary
            dict <~ (map[JsonKeys.invalidDictionary], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var dict = _dictionary
            dict <~ (map[JsonKeys.invalidDictionary], StringToIntegerTransform.shared, [:])
        }
    }

    func testOptionalDictionaryOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _dictionary: [String: Int]? = [JsonKeys.value: Int(Int16.max)]
        let _emptyDictionary: [String: Int]? = [:]
        let _nilDictionary: [String: Int]? = nil

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ (map[JsonKeys.dictionary], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            var dict = _emptyDictionary
            dict <~ (map[JsonKeys.emptyDictionary], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
        assertNoThrow {
            var dict = _nilDictionary
            dict <~ (map[JsonKeys.nilDictionary], StringToIntegerTransform.shared)
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional dictionary of Basic types with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalDictionaryOfBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfIntegerBasicTypes)

        let _dictionary: [String: Int]! = [:]

        // Positive
        assertNoThrow {
            var dict: [String: Int]! = _dictionary
            dict <~ (map[JsonKeys.dictionary], StringToIntegerTransform.shared)
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.value], Int(Int16.max))
        }
        assertNoThrow {
            var dict: [String: Int]! = _dictionary
            dict <~ (map[JsonKeys.emptyDictionary], StringToIntegerTransform.shared)
            XCTAssertEqual(dict.count, 0)
        }
        assertNoThrow {
            var dict: [String: Int]! = _dictionary
            dict <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
            XCTAssertNil(dict)
        }
        assertNoThrow {
            var dict: [String: Int]! = _dictionary
            dict <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [JsonKeys.value: Int(Int16.max)])
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.value], Int(Int16.max))
        }
        assertNoThrow {
            var dict: [String: Int]! = _dictionary
            dict <~ (map[JsonKeys.nilDictionary], StringToIntegerTransform.shared)
            XCTAssertNil(dict)
        }
        assertNoThrow {
            var dict: [String: Int]! = _dictionary
            dict <~ (map[JsonKeys.nilDictionary], StringToIntegerTransform.shared, [:])
            XCTAssertEqual(dict.count, 0)
        }

        // Negative
        assertThrowsException {
            var dict: [String: Int]! = _dictionary
            dict <~ (map[JsonKeys.invalidDictionary], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var dict: [String: Int]! = _dictionary
            dict <~ (map[JsonKeys.invalidDictionary], StringToIntegerTransform.shared, [:])
        }
    }

    func testImplicitlyUnwrappedOptionalDictionaryOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _dictionary: [String: Int]! = [JsonKeys.value: Int(Int16.max)]
        let _emptyDictionary: [String: Int]! = [:]

        // Positive
        assertNoThrow {
            var dict: [String: Int]! = _dictionary
            dict <~ (map[JsonKeys.dictionary], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            var dict: [String: Int]! = _emptyDictionary
            dict <~ (map[JsonKeys.emptyDictionary], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
