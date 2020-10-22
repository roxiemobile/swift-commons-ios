// ----------------------------------------------------------------------------
//
//  OperatorsTests.AnyObjects.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Basic types
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testAnyObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        // --

        let _any: Any = false

        // Positive
        assertNoThrow {
            var obj = _any
            obj <~ map[JsonKeys.object]
            XCTAssertNotNil(obj)
        }
        assertNoThrow {
            var obj = _any
            obj <~ map[JsonKeys.invalidObject]
            XCTAssertNotNil(obj)
        }

        // Negative
        assertThrowsException {
            var obj = _any
            obj <~ map[JsonKeys.nilObject]
        }
        assertThrowsException {
            var obj = _any
            obj <~ map[JsonKeys.noSuchKey]
        }

        // --

        let _anyObject: AnyObject = NSNull()

        // Positive
        assertNoThrow {
            var obj = _anyObject
            obj <~ map[JsonKeys.object]
            XCTAssertNotNil(obj)
        }
        assertNoThrow {
            var obj = _anyObject
            obj <~ map[JsonKeys.invalidObject]
            XCTAssertNotNil(obj)
        }

        // Negative
        assertThrowsException {
            var obj = _anyObject
            obj <~ map[JsonKeys.nilObject]
        }
        assertThrowsException {
            var obj = _anyObject
            obj <~ map[JsonKeys.noSuchKey]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Basic types
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testOptionalAnyObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        // --

        let _any: Any? = nil

        // Positive
        assertNoThrow {
            var obj = _any
            obj <~ map[JsonKeys.object]
            XCTAssertNotNil(obj)
        }
        assertNoThrow {
            var obj = _any
            obj <~ map[JsonKeys.invalidObject]
            XCTAssertNotNil(obj)
        }
        assertNoThrow {
            var obj = _any
            obj <~ map[JsonKeys.nilObject]
            XCTAssertNil(obj)
        }
        assertNoThrow {
            var obj = _any
            obj <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(obj)
        }

        // --

        let _anyObject: AnyObject? = nil

        // Positive
        assertNoThrow {
            var obj = _anyObject
            obj <~ map[JsonKeys.object]
            XCTAssertNotNil(obj)
        }
        assertNoThrow {
            var obj = _anyObject
            obj <~ map[JsonKeys.invalidObject]
            XCTAssertNotNil(obj)
        }
        assertNoThrow {
            var obj = _anyObject
            obj <~ map[JsonKeys.nilObject]
            XCTAssertNil(obj)
        }
        assertNoThrow {
            var obj = _anyObject
            obj <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(obj)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional Basic types
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalAnyObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        // --

        let _any: Any! = false

        // Positive
        assertNoThrow {
            var obj: Any! = _any
            obj <~ map[JsonKeys.object]
            XCTAssertNotNil(obj)
        }
        assertNoThrow {
            var obj: Any! = _any
            obj <~ map[JsonKeys.invalidObject]
            XCTAssertNotNil(obj)
        }
        assertNoThrow {
            var obj: Any! = _any
            obj <~ map[JsonKeys.nilObject]
            XCTAssertNil(obj)
        }
        assertNoThrow {
            var obj: Any! = _any
            obj <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(obj)
        }

        // --

        let _anyObject: AnyObject! = NSNull()

        // Positive
        assertNoThrow {
            var obj: AnyObject! = _anyObject
            obj <~ map[JsonKeys.object]
            XCTAssertNotNil(obj)
        }
        assertNoThrow {
            var obj: AnyObject! = _anyObject
            obj <~ map[JsonKeys.invalidObject]
            XCTAssertNotNil(obj)
        }
        assertNoThrow {
            var obj: AnyObject! = _anyObject
            obj <~ map[JsonKeys.nilObject]
            XCTAssertNil(obj)
        }
        assertNoThrow {
            var obj: AnyObject! = _anyObject
            obj <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(obj)
        }
    }
}
