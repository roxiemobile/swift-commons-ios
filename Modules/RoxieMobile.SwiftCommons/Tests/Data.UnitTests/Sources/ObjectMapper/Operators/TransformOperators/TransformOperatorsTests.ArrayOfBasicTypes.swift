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

        var array: [Int] = []

        // Positive
        assertNoThrow {
            array <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0], Int(Int32.max))
        }
        assertNoThrow {
            array <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertEqual(array.count, 0)
        }
        assertNoThrow {
            array <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [Int(Int16.max)])
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0], Int(Int16.max))
        }
        assertNoThrow {
            array <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared, [])
            XCTAssertEqual(array.count, 0)
        }

        // Negative
        assertThrowsException {
            array <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            array <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            array <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared, [])
        }
        assertThrowsException {
            array <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared)
        }
    }

    func testArrayOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var array = [Int(Int16.max), Int(Int32.max)]
        var emptyArray: [Int] = []

        // Positive
        assertNoThrow {
            array <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            emptyArray <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
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

        var array: [Int]? = nil

        // Positive
        assertNoThrow {
            array <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertEqual(array?.count ?? -1, 1)
            XCTAssertEqual(array?[0], Int(Int32.max))
        }
        assertNoThrow {
            array <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertEqual(array?.count ?? -1, 0)
        }
        assertNoThrow {
            array <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
            XCTAssertNil(array)
        }
        assertNoThrow {
            array <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [Int(Int16.max)])
            XCTAssertEqual(array?.count ?? -1, 1)
            XCTAssertEqual(array?[0], Int(Int16.max))
        }
        assertNoThrow {
            array <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared)
            XCTAssertNil(array)
        }
        assertNoThrow {
            array <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared, [])
            XCTAssertEqual(array?.count ?? -1, 0)
        }

        // Negative
        assertThrowsException {
            array <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            array <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared, [])
        }
    }

    func testOptionalArrayOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var array: [Int]? = [Int(Int16.max), Int(Int32.max)]
        var emptyArray: [Int]? = []
        var nilArray: [Int]? = nil

        // Positive
        assertNoThrow {
            array <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            emptyArray <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
        assertNoThrow {
            nilArray <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared)
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

        var array: [Int]! = []

        // Positive
        assertNoThrow {
            array <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0], Int(Int32.max))
        }
        assertNoThrow {
            array <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertEqual(array.count, 0)
        }
        assertNoThrow {
            array <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, [Int(Int16.max)])
            XCTAssertEqual(array.count, 1)
            XCTAssertEqual(array[0], Int(Int16.max))
        }
        assertNoThrow {
            array <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared, [])
            XCTAssertEqual(array.count, 0)
        }

        // Negative
        assertThrowsException {
            array <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            array <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            array <~ (map[JsonKeys.invalidArray], StringToIntegerTransform.shared, [])
        }
        assertThrowsException {
            array <~ (map[JsonKeys.nilArray], StringToIntegerTransform.shared)
        }
    }

    func testImplicitlyUnwrappedOptionalArrayOfBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var array: [Int]! = [Int(Int16.max), Int(Int32.max)]
        var emptyArray: [Int]! = []

        // Positive
        assertNoThrow {
            array <~ (map[JsonKeys.array], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.array).value)
        }
        assertNoThrow {
            emptyArray <~ (map[JsonKeys.emptyArray], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.emptyArray).value)
        }
    }
}

// ----------------------------------------------------------------------------
