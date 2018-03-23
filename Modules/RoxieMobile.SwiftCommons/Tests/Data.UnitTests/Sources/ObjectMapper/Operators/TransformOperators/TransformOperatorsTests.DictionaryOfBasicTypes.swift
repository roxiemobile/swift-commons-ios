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

        var dictionary: [String: Int] = [:]

        // Positive
        assertNoThrow {
            dictionary <~ (map[JsonKeys.dictionary], StringToIntegerTransform.shared)
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.value], Int(Int16.max))
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.emptyDictionary], StringToIntegerTransform.shared)
            XCTAssertEqual(dictionary.count, 0)
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [JsonKeys.value: Int(Int16.max)])
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.value], Int(Int16.max))
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.nilDictionary], StringToIntegerTransform.shared, [:])
            XCTAssertEqual(dictionary.count, 0)
        }

        // Negative
        assertThrowsException {
            dictionary <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            dictionary <~ (map[JsonKeys.invalidDictionary], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            dictionary <~ (map[JsonKeys.invalidDictionary], StringToIntegerTransform.shared, [:])
        }
        assertThrowsException {
            dictionary <~ (map[JsonKeys.nilDictionary], StringToIntegerTransform.shared)
        }
    }

    func testDictionaryOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var dictionary = [JsonKeys.value: Int(Int16.max)]
        var emptyDictionary: [String: Int] = [:]

        // Positive
        assertNoThrow {
            dictionary <~ (map[JsonKeys.dictionary], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            emptyDictionary <~ (map[JsonKeys.emptyDictionary], StringToIntegerTransform.shared)
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

        var dictionary: [String: Int]? = [:]

        // Positive
        assertNoThrow {
            dictionary <~ (map[JsonKeys.dictionary], StringToIntegerTransform.shared)
            XCTAssertEqual(dictionary?.count ?? -1, 1)
            XCTAssertEqual(dictionary?[JsonKeys.value], Int(Int16.max))
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.emptyDictionary], StringToIntegerTransform.shared)
            XCTAssertEqual(dictionary?.count ?? -1, 0)
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
            XCTAssertNil(dictionary)
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [JsonKeys.value: Int(Int16.max)])
            XCTAssertEqual(dictionary?.count ?? -1, 1)
            XCTAssertEqual(dictionary?[JsonKeys.value], Int(Int16.max))
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.nilDictionary], StringToIntegerTransform.shared)
            XCTAssertNil(dictionary)
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.nilDictionary], StringToIntegerTransform.shared, [:])
            XCTAssertEqual(dictionary?.count, 0)
        }

        // Negative
        assertThrowsException {
            dictionary <~ (map[JsonKeys.invalidDictionary], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            dictionary <~ (map[JsonKeys.invalidDictionary], StringToIntegerTransform.shared, [:])
        }
    }

    func testOptionalDictionaryOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var dictionary: [String: Int]? = [JsonKeys.value: Int(Int16.max)]
        var emptyDictionary: [String: Int]? = [:]
        var nilDictionary: [String: Int]? = nil

        // Positive
        assertNoThrow {
            dictionary <~ (map[JsonKeys.dictionary], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            emptyDictionary <~ (map[JsonKeys.emptyDictionary], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
        assertNoThrow {
            nilDictionary <~ (map[JsonKeys.nilDictionary], StringToIntegerTransform.shared)
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

        var dictionary: [String: Int]! = [:]

        // Positive
        assertNoThrow {
            dictionary <~ (map[JsonKeys.dictionary], StringToIntegerTransform.shared)
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.value], Int(Int16.max))
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.emptyDictionary], StringToIntegerTransform.shared)
            XCTAssertEqual(dictionary.count, 0)
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [JsonKeys.value: Int(Int16.max)])
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.value], Int(Int16.max))
        }
        assertNoThrow {
            dictionary <~ (map[JsonKeys.nilDictionary], StringToIntegerTransform.shared, [:])
            XCTAssertEqual(dictionary.count, 0)
        }

        // Negative
        assertThrowsException {
            dictionary <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            dictionary <~ (map[JsonKeys.invalidDictionary], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            dictionary <~ (map[JsonKeys.invalidDictionary], StringToIntegerTransform.shared, [:])
        }
        assertThrowsException {
            dictionary <~ (map[JsonKeys.nilDictionary], StringToIntegerTransform.shared)
        }
    }

    func testImplicitlyUnwrappedOptionalDictionaryOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var dictionary: [String: Int]! = [JsonKeys.value: Int(Int16.max)]
        var emptyDictionary: [String: Int]! = [:]

        // Positive
        assertNoThrow {
            dictionary <~ (map[JsonKeys.dictionary], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            emptyDictionary <~ (map[JsonKeys.emptyDictionary], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
