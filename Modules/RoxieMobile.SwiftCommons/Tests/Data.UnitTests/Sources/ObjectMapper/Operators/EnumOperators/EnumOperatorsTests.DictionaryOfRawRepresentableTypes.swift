// ----------------------------------------------------------------------------
//
//  EnumOperatorsTests.DictionaryOfRawRepresentableTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
//  MARK: - Dictionary of RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testDictionaryOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfStringRawValues)

        var dictionary: [String: StringRawType] = [:]

        // Positive
        assertNoThrow {
            dictionary <~ map[JsonKeys.dictionary]
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.value], StringRawType.value)
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.emptyDictionary]
            XCTAssertEqual(dictionary.count, 0)
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.noSuchKey, default: [JsonKeys.otherValue: StringRawType.otherValue.rawValue]]
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.otherValue], StringRawType.otherValue)
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

    func testDictionaryOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var dictionary = [JsonKeys.value: StringRawType.value]
        let otherDictionary = [JsonKeys.otherValue: StringRawType.otherValue]
        var emptyDictionary: [String: StringRawType] = [:]

        // Positive
        assertNoThrow {
            dictionary <~ map[JsonKeys.dictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            otherDictionary >>> map[JsonKeys.otherDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherDictionary).value)
        }
        assertNoThrow {
            emptyDictionary <~ map[JsonKeys.emptyDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
//  MARK: - Optional dictionary of RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testOptionalDictionaryOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfStringRawValues)

        var dictionary: [String: StringRawType]? = [:]

        // Positive
        assertNoThrow {
            dictionary <~ map[JsonKeys.dictionary]
            XCTAssertEqual(dictionary?.count ?? -1, 1)
            XCTAssertEqual(dictionary?[JsonKeys.value], StringRawType.value)
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
            dictionary <~ map[JsonKeys.noSuchKey, default: [JsonKeys.otherValue: StringRawType.otherValue.rawValue]]
            XCTAssertEqual(dictionary?.count ?? -1, 1)
            XCTAssertEqual(dictionary?[JsonKeys.otherValue], StringRawType.otherValue)
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

    func testOptionalDictionaryOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var dictionary: [String: StringRawType]? = [JsonKeys.value: StringRawType.value]
        let otherDictionary: [String: StringRawType]? = [JsonKeys.otherValue: StringRawType.otherValue]
        var emptyDictionary: [String: StringRawType]? = [:]
        var nilDictionary: [String: StringRawType]? = nil

        // Positive
        assertNoThrow {
            dictionary <~ map[JsonKeys.dictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            otherDictionary >>> map[JsonKeys.otherDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherDictionary).value)
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
//  MARK: - Implicitly unwrapped optional dictionary of RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalDictionaryOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfStringRawValues)

        var dictionary: [String: StringRawType]! = [:]

        // Positive
        assertNoThrow {
            dictionary <~ map[JsonKeys.dictionary]
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.value], StringRawType.value)
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.emptyDictionary]
            XCTAssertEqual(dictionary.count, 0)
        }
        assertNoThrow {
            dictionary <~ map[JsonKeys.noSuchKey, default: [JsonKeys.otherValue: StringRawType.otherValue.rawValue]]
            XCTAssertEqual(dictionary.count, 1)
            XCTAssertEqual(dictionary[JsonKeys.otherValue], StringRawType.otherValue)
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

    func testImplicitlyUnwrappedOptionalDictionaryOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var dictionary: [String: StringRawType]! = [JsonKeys.value: StringRawType.value]
        let otherDictionary: [String: StringRawType]! = [JsonKeys.otherValue: StringRawType.otherValue]
        var emptyDictionary: [String: StringRawType]! = [:]

        // Positive
        assertNoThrow {
            dictionary <~ map[JsonKeys.dictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            otherDictionary >>> map[JsonKeys.otherDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherDictionary).value)
        }
        assertNoThrow {
            emptyDictionary <~ map[JsonKeys.emptyDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
