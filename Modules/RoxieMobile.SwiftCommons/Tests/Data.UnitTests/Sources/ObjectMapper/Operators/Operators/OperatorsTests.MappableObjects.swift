// ----------------------------------------------------------------------------
//
//  OperatorsTests.MappableObjects.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        var object = Vector3DModel.shared

        // Positive
        assertNoThrow {
            object = Vector3DModel.shared
            object <~ map[JsonKeys.object]
            XCTAssertEqual(object.x, Int(Int8.max))
        }
        assertNoThrow {
            object = Vector3DModel.shared
            object <~ map[JsonKeys.noSuchKey, default: Constants.dictionaryOfInt8]
            XCTAssertEqual(object.x, Int(Int8.max))
        }
        assertNoThrow {
            object = Vector3DModel.shared
            object <~ map[JsonKeys.nilObject, default: Constants.dictionaryOfInt8]
            XCTAssertEqual(object.x, Int(Int8.max))
        }

        // Negative
        assertThrowsException {
            object <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            object <~ map[JsonKeys.invalidObject]
        }
        assertThrowsException {
            object <~ map[JsonKeys.nilObject]
        }
    }

    func testMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var object = Vector3DModel.shared16
        var otherObject = Vector3DModel.shared32

        // Positive
        assertNoThrow {
            object <~ map[JsonKeys.object]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.object).value)
        }
        assertNoThrow {
            otherObject <~ map[JsonKeys.otherObject, default: Constants.invalidValue]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherObject).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testOptionalMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        var object: Vector3DModel? = nil

        // Positive
        assertNoThrow {
            object = nil
            object <~ map[JsonKeys.object]
            XCTAssertEqual(object?.x, Int(Int8.max))
        }
        assertNoThrow {
            object = Vector3DModel.shared
            object <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(object)
        }
        assertNoThrow {
            object = nil
            object <~ map[JsonKeys.noSuchKey, default: Constants.dictionaryOfInt8]
            XCTAssertEqual(object?.x, Int(Int8.max))
        }
        assertNoThrow {
            object = Vector3DModel.shared
            object <~ map[JsonKeys.nilObject]
            XCTAssertNil(object)
        }
        assertNoThrow {
            object = nil
            object <~ map[JsonKeys.nilObject, default: Constants.dictionaryOfInt8]
            XCTAssertEqual(object?.x, Int(Int8.max))
        }

        // Negative
        assertThrowsException {
            object <~ map[JsonKeys.invalidObject]
        }
    }

    func testOptionalMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var object: Vector3DModel? = Vector3DModel.shared16
        var otherObject: Vector3DModel? = Vector3DModel.shared32
        var nilObject: Vector3DModel? = nil

        // Positive
        assertNoThrow {
            object <~ map[JsonKeys.object]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.object).value)
        }
        assertNoThrow {
            otherObject <~ map[JsonKeys.otherObject, default: Constants.invalidValue]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherObject).value)
        }
        assertNoThrow {
            nilObject <~ map[JsonKeys.nilObject]
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilObject).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        var object: Vector3DModel! = Vector3DModel.shared

        // Positive
        assertNoThrow {
            object = Vector3DModel.shared
            object <~ map[JsonKeys.object]
            XCTAssertEqual(object?.x, Int(Int8.max))
        }
        assertNoThrow {
            object = Vector3DModel.shared
            object <~ map[JsonKeys.noSuchKey, default: Constants.dictionaryOfInt8]
            XCTAssertEqual(object?.x, Int(Int8.max))
        }
        assertNoThrow {
            object = Vector3DModel.shared
            object <~ map[JsonKeys.nilObject, default: Constants.dictionaryOfInt8]
            XCTAssertEqual(object?.x, Int(Int8.max))
        }

        // Negative
        assertThrowsException {
            object <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            object <~ map[JsonKeys.invalidObject]
        }
        assertThrowsException {
            object <~ map[JsonKeys.nilObject]
        }
    }

    func testImplicitlyUnwrappedOptionalMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var object: Vector3DModel! = Vector3DModel.shared16
        var otherObject: Vector3DModel! = Vector3DModel.shared32

        // Positive
        assertNoThrow {
            object <~ map[JsonKeys.object]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.object).value)
        }
        assertNoThrow {
            otherObject <~ map[JsonKeys.otherObject, default: Constants.invalidValue]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherObject).value)
        }
    }
}

// ----------------------------------------------------------------------------
