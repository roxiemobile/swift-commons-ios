// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.BasicTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Basic types with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.integerBasicTypes)

        var value: Int = 0

        // Positive
        assertNoThrow {
            value <~ (map[JsonKeys.value], StringToIntegerTransform.shared)
            XCTAssertEqual(value, Int.max)
        }
        assertNoThrow {
            value <~ (map[JsonKeys.noSuchKey, default: "\(Int8.max)"], StringToIntegerTransform.shared)
            XCTAssertEqual(value, Int(Int8.max))
        }
        assertNoThrow {
            value <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, Int(Int16.max))
            XCTAssertEqual(value, Int(Int16.max))
        }
        assertNoThrow {
            value <~ (map[JsonKeys.nilValue], StringToIntegerTransform.shared, Int(Int32.max))
            XCTAssertEqual(value, Int(Int32.max))
        }

        // Negative
        assertThrowsException {
            value <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            value <~ (map[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            value <~ (map[JsonKeys.invalidValue], StringToIntegerTransform.shared, Int.max)
        }
        assertThrowsException {
            value <~ (map[JsonKeys.nilValue], StringToIntegerTransform.shared)
        }
    }

    func testBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var value = Int(Int16.max)
        var otherValue = Int(Int32.max)

        // Positive
        assertNoThrow {
            value <~ (map[JsonKeys.value], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
        assertNoThrow {
            otherValue <~ (map[JsonKeys.otherValue, default: Constants.invalidValue], StringToIntegerTransform.shared, Int.max)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherValue).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Basic types with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testOptionalBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.integerBasicTypes)

        var value: Int? = nil

        // Positive
        assertNoThrow {
            value <~ (map[JsonKeys.value], StringToIntegerTransform.shared)
            XCTAssertEqual(value, Int.max)
        }
        assertNoThrow {
            value <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
            XCTAssertNil(value)
        }
        assertNoThrow {
            value <~ (map[JsonKeys.noSuchKey, default: "\(Int8.max)"], StringToIntegerTransform.shared)
            XCTAssertEqual(value, Int(Int8.max))
        }
        assertNoThrow {
            value <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, Int(Int16.max))
            XCTAssertEqual(value, Int(Int16.max))
        }
        assertNoThrow {
            value <~ (map[JsonKeys.nilValue], StringToIntegerTransform.shared)
            XCTAssertNil(value)
        }
        assertNoThrow {
            value <~ (map[JsonKeys.nilValue], StringToIntegerTransform.shared, Int(Int32.max))
            XCTAssertEqual(value, Int(Int32.max))
        }

        // Negative
        assertThrowsException {
            value <~ (map[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            value <~ (map[JsonKeys.invalidValue], StringToIntegerTransform.shared, Int.max)
        }
    }

    func testOptionalBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var value: Int? = Int(Int16.max)
        var otherValue: Int? = Int(Int32.max)
        var nilValue: Int? = nil

        // Positive
        assertNoThrow {
            value <~ (map[JsonKeys.value], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
        assertNoThrow {
            otherValue <~ (map[JsonKeys.otherValue, default: Constants.invalidValue], StringToIntegerTransform.shared, Int.max)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherValue).value)
        }
        assertNoThrow {
            nilValue <~ (map[JsonKeys.nilValue], StringToIntegerTransform.shared)
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilValue).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional Basic types with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.integerBasicTypes)

        var value: Int! = 0

        // Positive
        assertNoThrow {
            value <~ (map[JsonKeys.value], StringToIntegerTransform.shared)
            XCTAssertEqual(value, Int.max)
        }
        assertNoThrow {
            value <~ (map[JsonKeys.noSuchKey, default: "\(Int8.max)"], StringToIntegerTransform.shared)
            XCTAssertEqual(value, Int(Int8.max))
        }
        assertNoThrow {
            value <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, Int(Int16.max))
            XCTAssertEqual(value, Int(Int16.max))
        }
        assertNoThrow {
            value <~ (map[JsonKeys.nilValue], StringToIntegerTransform.shared, Int(Int32.max))
            XCTAssertEqual(value, Int(Int32.max))
        }

        // Negative
        assertThrowsException {
            value <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            value <~ (map[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            value <~ (map[JsonKeys.invalidValue], StringToIntegerTransform.shared, Int.max)
        }
        assertThrowsException {
            value <~ (map[JsonKeys.nilValue], StringToIntegerTransform.shared)
        }
    }

    func testImplicitlyUnwrappedOptionalBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var value: Int! = Int(Int16.max)
        var otherValue: Int! = Int(Int32.max)

        // Positive
        assertNoThrow {
            value <~ (map[JsonKeys.value], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
        assertNoThrow {
            otherValue <~ (map[JsonKeys.otherValue, default: Constants.invalidValue], StringToIntegerTransform.shared, Int.max)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherValue).value)
        }
    }
}

// ----------------------------------------------------------------------------
