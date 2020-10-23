// ----------------------------------------------------------------------------
//
//  OperatorsTests.Double.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2020, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Double
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testDouble_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.doubleValues)

        let _double = Double(0.0)

        // Positive
        assertNoThrow {
            var num = _double
            num <~ map[JsonKeys.double]
            XCTAssertEqual(num, Double.pi)
        }
        assertNoThrow {
            var num = _double
            num <~ map[JsonKeys.nilValue, default: Double.greatestFiniteMagnitude]
            XCTAssertEqual(num, Double.greatestFiniteMagnitude)
        }

        // Negative
        assertThrowsException {
            var num = _double
            num <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var num = _double
            num <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            var num = _double
            num <~ map[JsonKeys.nilValue]
        }
    }

    func testDouble_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _double = Double.pi

        // Positive
        assertNoThrow {
            var num = _double
            num <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Double
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testOptionalDouble_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.doubleValues)

        let _double: Double? = nil

        // Positive
        assertNoThrow {
            var num = _double
            num <~ map[JsonKeys.double]
            XCTAssertEqual(num, Double.pi)
        }
        assertNoThrow {
            var num = _double
            num <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(num)
        }
        assertNoThrow {
            var num = _double
            num <~ map[JsonKeys.nilValue]
            XCTAssertNil(num)
        }

        // Negative
        assertThrowsException {
            var num = _double
            num <~ map[JsonKeys.invalidValue]
        }
    }

    func testOptionalDouble_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _double: Double? = Double.pi

        // Positive
        assertNoThrow {
            var num = _double
            num <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional Double
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalDouble_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.doubleValues)

        let _double: Double! = Double(0.0)

        // Positive
        assertNoThrow {
            var num: Double! = _double
            num <~ map[JsonKeys.double]
            XCTAssertEqual(num, Double.pi)
        }
        assertNoThrow {
            var num: Double! = _double
            num <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(num)
        }
        assertNoThrow {
            var num: Double! = _double
            num <~ map[JsonKeys.nilValue]
            XCTAssertNil(num)
        }

        // Negative
        assertThrowsException {
            var num: Double! = _double
            num <~ map[JsonKeys.invalidValue]
        }
    }

    func testImplicitlyUnwrappedOptionalDouble_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _double: Double! = Double.pi

        // Positive
        assertNoThrow {
            var num: Double! = _double
            num <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
    }
}
