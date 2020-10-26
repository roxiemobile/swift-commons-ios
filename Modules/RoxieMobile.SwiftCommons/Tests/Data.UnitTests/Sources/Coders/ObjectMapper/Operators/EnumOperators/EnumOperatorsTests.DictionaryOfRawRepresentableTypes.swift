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

extension EnumOperatorsTests {

// MARK: - Tests

    func testDictionaryOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfStringRawValues)

        let _dictionary: [String: StringRawType] = [:]

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.dictionary]
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.value], StringRawType.value)
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.emptyDictionary]
            XCTAssertEqual(dict.count, 0)
        }
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.noSuchKey, default: [JsonKeys.otherValue: StringRawType.otherValue.rawValue]]
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.otherValue], StringRawType.otherValue)
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

    func testDictionaryOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _dictionary = [JsonKeys.value: StringRawType.value]
        let _otherDictionary = [JsonKeys.otherValue: StringRawType.otherValue]
        let _emptyDictionary: [String: StringRawType] = [:]

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.dictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            let dict = _otherDictionary
            dict >>> map[JsonKeys.otherDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherDictionary).value)
        }
        assertNoThrow {
            var dict = _emptyDictionary
            dict <~ map[JsonKeys.emptyDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}

// ----------------------------------------------------------------------------
//  MARK: - Optional dictionary of RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests {

// MARK: - Tests

    func testOptionalDictionaryOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfStringRawValues)

        let _dictionary: [String: StringRawType]? = nil

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.dictionary]
            XCTAssertEqual(dict?.count ?? -1, 1)
            XCTAssertEqual(dict?[JsonKeys.value], StringRawType.value)
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
            dict <~ map[JsonKeys.noSuchKey, default: [JsonKeys.otherValue: StringRawType.otherValue.rawValue]]
            XCTAssertEqual(dict?.count ?? -1, 1)
            XCTAssertEqual(dict?[JsonKeys.otherValue], StringRawType.otherValue)
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

    func testOptionalDictionaryOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _dictionary: [String: StringRawType]? = [JsonKeys.value: StringRawType.value]
        let _otherDictionary: [String: StringRawType]? = [JsonKeys.otherValue: StringRawType.otherValue]
        let _emptyDictionary: [String: StringRawType]? = [:]
        let _nilDictionary: [String: StringRawType]? = nil

        // Positive
        assertNoThrow {
            var dict = _dictionary
            dict <~ map[JsonKeys.dictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            let dict = _otherDictionary
            dict >>> map[JsonKeys.otherDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherDictionary).value)
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
//  MARK: - Implicitly unwrapped optional dictionary of RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalDictionaryOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.dictionaryOfStringRawValues)

        let _dictionary: [String: StringRawType]! = [:]

        // Positive
        assertNoThrow {
            var dict: [String: StringRawType]! = _dictionary
            dict <~ map[JsonKeys.dictionary]
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.value], StringRawType.value)
        }
        assertNoThrow {
            var dict: [String: StringRawType]! = _dictionary
            dict <~ map[JsonKeys.emptyDictionary]
            XCTAssertEqual(dict.count, 0)
        }
        assertNoThrow {
            var dict: [String: StringRawType]! = _dictionary
            dict <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(dict)
        }
        assertNoThrow {
            var dict: [String: StringRawType]! = _dictionary
            dict <~ map[JsonKeys.noSuchKey, default: [JsonKeys.otherValue: StringRawType.otherValue.rawValue]]
            XCTAssertEqual(dict.count, 1)
            XCTAssertEqual(dict[JsonKeys.otherValue], StringRawType.otherValue)
        }
        assertNoThrow {
            var dict: [String: StringRawType]! = _dictionary
            dict <~ map[JsonKeys.nilDictionary]
            XCTAssertNil(dict)
        }
        assertNoThrow {
            var dict: [String: StringRawType]! = _dictionary
            dict <~ map[JsonKeys.nilDictionary, default: [:]]
            XCTAssertEqual(dict.count, 0)
        }

        // Negative
        assertThrowsException {
            var dict: [String: StringRawType]! = _dictionary
            dict <~ map[JsonKeys.invalidDictionary]
        }
    }

    func testImplicitlyUnwrappedOptionalDictionaryOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _dictionary: [String: StringRawType]! = [JsonKeys.value: StringRawType.value]
        let _otherDictionary: [String: StringRawType]! = [JsonKeys.otherValue: StringRawType.otherValue]
        let _emptyDictionary: [String: StringRawType]! = [:]

        // Positive
        assertNoThrow {
            var dict: [String: StringRawType]! = _dictionary
            dict <~ map[JsonKeys.dictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.dictionary).value)
        }
        assertNoThrow {
            let dict: [String: StringRawType]! = _otherDictionary
            dict >>> map[JsonKeys.otherDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherDictionary).value)
        }
        assertNoThrow {
            var dict: [String: StringRawType]! = _emptyDictionary
            dict <~ map[JsonKeys.emptyDictionary]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyDictionary).value)
        }
    }
}
