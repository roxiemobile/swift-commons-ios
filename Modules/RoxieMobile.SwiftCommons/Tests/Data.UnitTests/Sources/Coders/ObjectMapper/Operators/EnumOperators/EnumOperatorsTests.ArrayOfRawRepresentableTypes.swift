// ----------------------------------------------------------------------------
//
//  EnumOperatorsTests.ArrayOfRawRepresentableTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Array of RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests {

// MARK: - Tests

    func testArrayOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfStringRawValues)

        let _array: [StringRawType] = []

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.array]
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0], StringRawType.value)
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(arr.count, 0)
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.noSuchKey, default: [StringRawType.otherValue.rawValue]]
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0], StringRawType.otherValue)
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(arr.count, 0)
        }

        // Negative
        assertThrowsException {
            var arr = _array
            arr <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var arr = _array
            arr <~ map[JsonKeys.invalidArray]
        }
        assertThrowsException {
            var arr = _array
            arr <~ map[JsonKeys.nilArray]
        }
    }

    func testArrayOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _array = [StringRawType.value]
        let _otherArray = [StringRawType.otherValue]
        let _emptyArray: [StringRawType] = []

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.array]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            let arr = _otherArray
            arr >>> map[JsonKeys.otherArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherArray).value)
        }
        assertNoThrow {
            var arr = _emptyArray
            arr <~ map[JsonKeys.emptyArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional array of RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests {

// MARK: - Tests

    func testOptionalArrayOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfStringRawValues)

        let _array: [StringRawType]? = nil

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.array]
            XCTAssertEqual(arr?.count ?? -1, 1)
            XCTAssertEqual(arr?[0], StringRawType.value)
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(arr?.count ?? -1, 0)
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.noSuchKey, default: [StringRawType.otherValue.rawValue]]
            XCTAssertEqual(arr?.count ?? -1, 1)
            XCTAssertEqual(arr?[0], StringRawType.otherValue)
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.nilArray]
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(arr?.count ?? -1, 0)
        }

        // Negative
        assertThrowsException {
            var arr = _array
            arr <~ map[JsonKeys.invalidArray]
        }
    }

    func testOptionalArrayOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _array: [StringRawType]? = [StringRawType.value]
        let _otherArray: [StringRawType]? = [StringRawType.otherValue]
        let _emptyArray: [StringRawType]? = []
        let _nilArray: [StringRawType]? = nil

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ map[JsonKeys.array]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            let arr = _otherArray
            arr >>> map[JsonKeys.otherArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherArray).value)
        }
        assertNoThrow {
            var arr = _emptyArray
            arr <~ map[JsonKeys.emptyArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
        assertNoThrow {
            var arr = _nilArray
            arr <~ map[JsonKeys.nilArray]
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional array of RawRepresentable types
// ----------------------------------------------------------------------------

extension EnumOperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalArrayOfRawRepresentableTypes_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfStringRawValues)

        let _array: [StringRawType]! = []

        // Positive
        assertNoThrow {
            var arr: [StringRawType]! = _array
            arr <~ map[JsonKeys.array]
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0], StringRawType.value)
        }
        assertNoThrow {
            var arr: [StringRawType]! = _array
            arr <~ map[JsonKeys.emptyArray]
            XCTAssertEqual(arr.count, 0)
        }
        assertNoThrow {
            var arr: [StringRawType]! = _array
            arr <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr: [StringRawType]! = _array
            arr <~ map[JsonKeys.noSuchKey, default: [StringRawType.otherValue.rawValue]]
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0], StringRawType.otherValue)
        }
        assertNoThrow {
            var arr: [StringRawType]! = _array
            arr <~ map[JsonKeys.nilArray]
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr: [StringRawType]! = _array
            arr <~ map[JsonKeys.nilArray, default: []]
            XCTAssertEqual(arr.count, 0)
        }

        // Negative
        assertThrowsException {
            var arr: [StringRawType]! = _array
            arr <~ map[JsonKeys.invalidArray]
        }
    }

    func testImplicitlyUnwrappedOptionalArrayOfRawRepresentableTypes_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _array: [StringRawType]! = [StringRawType.value]
        let _otherArray: [StringRawType]! = [StringRawType.otherValue]
        let _emptyArray: [StringRawType]! = []

        // Positive
        assertNoThrow {
            var arr: [StringRawType]! = _array
            arr <~ map[JsonKeys.array]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            let arr: [StringRawType]! = _otherArray
            arr >>> map[JsonKeys.otherArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherArray).value)
        }
        assertNoThrow {
            var arr: [StringRawType]! = _emptyArray
            arr <~ map[JsonKeys.emptyArray]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}
