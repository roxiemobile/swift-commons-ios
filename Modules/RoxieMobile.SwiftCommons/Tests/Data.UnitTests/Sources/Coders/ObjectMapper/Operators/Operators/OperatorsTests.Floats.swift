// ----------------------------------------------------------------------------
//
//  OperatorsTests.Floats.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Floats
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testNumbers_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.floatValues)

        let _float = Float(0.0)

        // Positive
        assertNoThrow {
            var num = _float
            num <~ map[JsonKeys.value]
            XCTAssertEqual(num, Float.pi)
        }
        assertNoThrow {
            var num = _float
            num <~ map[JsonKeys.nilValue, default: Float.greatestFiniteMagnitude]
            XCTAssertEqual(num, Float.greatestFiniteMagnitude)
        }

        // Negative
        assertThrowsException {
            var num = _float
            num <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var num = _float
            num <~ map[JsonKeys.invalidValue]
        }
        assertThrowsException {
            var num = _float
            num <~ map[JsonKeys.nilValue]
        }
    }

    func testNumbers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _float = Float.pi

        // Positive
        assertNoThrow {
            var num = _float
            num <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Floats
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testOptionalNumbers_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.floatValues)

        let _float: Float? = nil

        // Positive
        assertNoThrow {
            var num = _float
            num <~ map[JsonKeys.value]
            XCTAssertEqual(num, Float.pi)
        }
        assertNoThrow {
            var num = _float
            num <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(num)
        }
        assertNoThrow {
            var num = _float
            num <~ map[JsonKeys.nilValue]
            XCTAssertNil(num)
        }

        // Negative
        assertThrowsException {
            var num = _float
            num <~ map[JsonKeys.invalidValue]
        }
    }

    func testOptionalNumbers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _float: Float? = Float.pi

        // Positive
        assertNoThrow {
            var num = _float
            num <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional Floats
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalNumbers_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.floatValues)

        let _float: Float! = Float(0.0)

        // Positive
        assertNoThrow {
            var num: Float! = _float
            num <~ map[JsonKeys.value]
            XCTAssertEqual(num, Float.pi)
        }
        assertNoThrow {
            var num: Float! = _float
            num <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(num)
        }
        assertNoThrow {
            var num: Float! = _float
            num <~ map[JsonKeys.nilValue]
            XCTAssertNil(num)
        }

        // Negative
        assertThrowsException {
            var num: Float! = _float
            num <~ map[JsonKeys.invalidValue]
        }
    }

    func testImplicitlyUnwrappedOptionalNumbers_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _float: Float! = Float.pi

        // Positive
        assertNoThrow {
            var num: Float! = _float
            num <~ map[JsonKeys.value]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.value).value)
        }
    }
}

// ----------------------------------------------------------------------------
