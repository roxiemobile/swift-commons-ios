// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.ArrayOfBasicTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Array of basic types with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testArrayOfBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfIntegerBasicTypes)

        let _array: [Int] = []

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0], Int(Int32.max))
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertEqual(arr.count, 0)
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [Int(Int16.max)])
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0], Int(Int16.max))
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared, [])
            XCTAssertEqual(arr.count, 0)
        }

        // Negative
        assertThrowsException {
            var arr = _array
            arr <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var arr = _array
            arr <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var arr = _array
            arr <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared, [])
        }
        assertThrowsException {
            var arr = _array
            arr <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared)
        }
    }

    func testArrayOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _array = [Int(Int16.max), Int(Int32.max)]
        let _emptyArray: [Int] = []

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            var arr = _emptyArray
            arr <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional array of basic types with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testOptionalArrayOfBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfIntegerBasicTypes)

        let _array: [Int]? = nil

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertEqual(arr?.count ?? -1, 1)
            XCTAssertEqual(arr?[0], Int(Int32.max))
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertEqual(arr?.count ?? -1, 0)
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [Int(Int16.max)])
            XCTAssertEqual(arr?.count ?? -1, 1)
            XCTAssertEqual(arr?[0], Int(Int16.max))
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared)
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared, [])
            XCTAssertEqual(arr?.count ?? -1, 0)
        }

        // Negative
        assertThrowsException {
            var arr = _array
            arr <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var arr = _array
            arr <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared, [])
        }
    }

    func testOptionalArrayOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _array: [Int]? = [Int(Int16.max), Int(Int32.max)]
        let _emptyArray: [Int]? = []
        let _nilArray: [Int]? = nil

        // Positive
        assertNoThrow {
            var arr = _array
            arr <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            var arr = _emptyArray
            arr <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
        assertNoThrow {
            var arr = _nilArray
            arr <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared)
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional array of basic types with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalArrayOfBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.arrayOfIntegerBasicTypes)

        let _array: [Int]! = []

        // Positive
        assertNoThrow {
            var arr: [Int]! = _array
            arr <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0], Int(Int32.max))
        }
        assertNoThrow {
            var arr: [Int]! = _array
            arr <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertEqual(arr.count, 0)
        }
        assertNoThrow {
            var arr: [Int]! = _array
            arr <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr: [Int]! = _array
            arr <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [Int(Int16.max)])
            XCTAssertEqual(arr.count, 1)
            XCTAssertEqual(arr[0], Int(Int16.max))
        }
        assertNoThrow {
            var arr: [Int]! = _array
            arr <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared)
            XCTAssertNil(arr)
        }
        assertNoThrow {
            var arr: [Int]! = _array
            arr <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared, [])
            XCTAssertEqual(arr.count, 0)
        }

        // Negative
        assertThrowsException {
            var arr: [Int]! = _array
            arr <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var arr: [Int]! = _array
            arr <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared, [])
        }
    }

    func testImplicitlyUnwrappedOptionalArrayOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _array: [Int]! = [Int(Int16.max), Int(Int32.max)]
        let _emptyArray: [Int]! = []

        // Positive
        assertNoThrow {
            var arr: [Int]! = _array
            arr <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            var arr: [Int]! = _emptyArray
            arr <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
