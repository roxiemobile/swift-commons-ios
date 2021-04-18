// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.BasicTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Basic types with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.integerValues)

        let _value: Int = 0

        // Positive
        assertNoThrow {
            var val = _value
            val <~ (map[JsonKeys.string], StringToIntegerTransform.shared)
            XCTAssertEqual(val, Int.max)
        }
        assertNoThrow {
            var val = _value
            val <~ (map[JsonKeys.noSuchKey, default: "\(Int8.max)"], StringToIntegerTransform.shared)
            XCTAssertEqual(val, Int(Int8.max))
        }
        assertNoThrow {
            var val = _value
            val <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, Int(Int16.max))
            XCTAssertEqual(val, Int(Int16.max))
        }
        assertNoThrow {
            var val = _value
            val <~ (map[JsonKeys.nilValue], StringToIntegerTransform.shared, Int(Int32.max))
            XCTAssertEqual(val, Int(Int32.max))
        }

        // Negative
        assertThrowsException {
            var val = _value
            val <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var val = _value
            val <~ (map[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var val = _value
            val <~ (map[JsonKeys.invalidValue], StringToIntegerTransform.shared, Int.max)
        }
        assertThrowsException {
            var val = _value
            val <~ (map[JsonKeys.nilValue], StringToIntegerTransform.shared)
        }
    }

    func testBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _value = Int(Int16.max)
        let _otherValue = Int(Int32.max)

        // Positive
        assertNoThrow {
            var val = _value
            val <~ (map[JsonKeys.value], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
        assertNoThrow {
            var val = _otherValue
            val <~ (map[JsonKeys.otherValue, default: Constants.invalidValue], StringToIntegerTransform.shared, Int.max)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherValue).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Basic types with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testOptionalBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.integerValues)

        let _value: Int? = nil

        // Positive
        assertNoThrow {
            var val = _value
            val <~ (map[JsonKeys.string], StringToIntegerTransform.shared)
            XCTAssertEqual(val, Int.max)
        }
        assertNoThrow {
            var val = _value
            val <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
            XCTAssertNil(val)
        }
        assertNoThrow {
            var val = _value
            val <~ (map[JsonKeys.noSuchKey, default: "\(Int8.max)"], StringToIntegerTransform.shared)
            XCTAssertEqual(val, Int(Int8.max))
        }
        assertNoThrow {
            var val = _value
            val <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, Int(Int16.max))
            XCTAssertEqual(val, Int(Int16.max))
        }
        assertNoThrow {
            var val = _value
            val <~ (map[JsonKeys.nilValue], StringToIntegerTransform.shared)
            XCTAssertNil(val)
        }
        assertNoThrow {
            var val = _value
            val <~ (map[JsonKeys.nilValue], StringToIntegerTransform.shared, Int(Int32.max))
            XCTAssertEqual(val, Int(Int32.max))
        }

        // Negative
        assertThrowsException {
            var val = _value
            val <~ (map[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var val = _value
            val <~ (map[JsonKeys.invalidValue], StringToIntegerTransform.shared, Int.max)
        }
    }

    func testOptionalBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _value: Int? = Int(Int16.max)
        let _otherValue: Int? = Int(Int32.max)
        let _nilValue: Int? = nil

        // Positive
        assertNoThrow {
            var val = _value
            val <~ (map[JsonKeys.value], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
        assertNoThrow {
            var val = _otherValue
            val <~ (map[JsonKeys.otherValue, default: Constants.invalidValue], StringToIntegerTransform.shared, Int.max)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherValue).value)
        }
        assertNoThrow {
            var val = _nilValue
            val <~ (map[JsonKeys.nilValue], StringToIntegerTransform.shared)
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilValue).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional Basic types with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalBasicTypesWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.integerValues)

        let _value: Int! = 0

        // Positive
        assertNoThrow {
            var val: Int! = _value
            val <~ (map[JsonKeys.string], StringToIntegerTransform.shared)
            XCTAssertEqual(val, Int.max)
        }
        assertNoThrow {
            var val: Int! = _value
            val <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared)
            XCTAssertNil(val)
        }
        assertNoThrow {
            var val: Int! = _value
            val <~ (map[JsonKeys.noSuchKey, default: "\(Int8.max)"], StringToIntegerTransform.shared)
            XCTAssertEqual(val, Int(Int8.max))
        }
        assertNoThrow {
            var val: Int! = _value
            val <~ (map[JsonKeys.noSuchKey], StringToIntegerTransform.shared, Int(Int16.max))
            XCTAssertEqual(val, Int(Int16.max))
        }
        assertNoThrow {
            var val: Int! = _value
            val <~ (map[JsonKeys.nilValue], StringToIntegerTransform.shared)
            XCTAssertNil(val)
        }
        assertNoThrow {
            var val: Int! = _value
            val <~ (map[JsonKeys.nilValue], StringToIntegerTransform.shared, Int(Int32.max))
            XCTAssertEqual(val, Int(Int32.max))
        }

        // Negative
        assertThrowsException {
            var val: Int! = _value
            val <~ (map[JsonKeys.invalidValue], StringToIntegerTransform.shared)
        }
        assertThrowsException {
            var val: Int! = _value
            val <~ (map[JsonKeys.invalidValue], StringToIntegerTransform.shared, Int.max)
        }
    }

    func testImplicitlyUnwrappedOptionalBasicTypesWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _value: Int! = Int(Int16.max)
        let _otherValue: Int! = Int(Int32.max)

        // Positive
        assertNoThrow {
            var val: Int! = _value
            val <~ (map[JsonKeys.value], StringToIntegerTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
        assertNoThrow {
            var val: Int! = _otherValue
            val <~ (map[JsonKeys.otherValue, default: Constants.invalidValue], StringToIntegerTransform.shared, Int.max)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherValue).value)
        }
    }
}
