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

extension OperatorsTests {

// MARK: - Tests

    func testMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        let _object = Vector3DModel.shared

        // Positive
        assertNoThrow {
            var obj = _object
            obj <~ map[JsonKeys.object]
            XCTAssertEqual(obj.x, Int(Int8.max))
        }
        assertNoThrow {
            var obj = _object
            obj <~ map[JsonKeys.noSuchKey, default: Constants.dictionaryOfInt8]
            XCTAssertEqual(obj.x, Int(Int8.max))
        }
        assertNoThrow {
            var obj = _object
            obj <~ map[JsonKeys.nilObject, default: Constants.dictionaryOfInt8]
            XCTAssertEqual(obj.x, Int(Int8.max))
        }

        // Negative
        assertThrowsException {
            var obj = _object
            obj <~ map[JsonKeys.noSuchKey]
        }
        assertThrowsException {
            var obj = _object
            obj <~ map[JsonKeys.invalidObject]
        }
        assertThrowsException {
            var obj = _object
            obj <~ map[JsonKeys.nilObject]
        }
    }

    func testMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _object = Vector3DModel.shared16
        let _otherObject = Vector3DModel.shared32

        // Positive
        assertNoThrow {
            var obj = _object
            obj <~ map[JsonKeys.object]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.object).value)
        }
        assertNoThrow {
            var obj = _otherObject
            obj <~ map[JsonKeys.otherObject, default: Constants.invalidValue]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherObject).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testOptionalMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        let _object: Vector3DModel? = nil

        // Positive
        assertNoThrow {
            var obj = _object
            obj <~ map[JsonKeys.object]
            XCTAssertEqual(obj?.x, Int(Int8.max))
        }
        assertNoThrow {
            var obj: Vector3DModel? = Vector3DModel.shared
            obj <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(obj)
        }
        assertNoThrow {
            var obj = _object
            obj <~ map[JsonKeys.noSuchKey, default: Constants.dictionaryOfInt8]
            XCTAssertEqual(obj?.x, Int(Int8.max))
        }
        assertNoThrow {
            var obj: Vector3DModel? = Vector3DModel.shared
            obj <~ map[JsonKeys.nilObject]
            XCTAssertNil(obj)
        }
        assertNoThrow {
            var obj = _object
            obj <~ map[JsonKeys.nilObject, default: Constants.dictionaryOfInt8]
            XCTAssertEqual(obj?.x, Int(Int8.max))
        }

        // Negative
        assertThrowsException {
            var obj = _object
            obj <~ map[JsonKeys.invalidObject]
        }
    }

    func testOptionalMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _object: Vector3DModel? = Vector3DModel.shared16
        let _otherObject: Vector3DModel? = Vector3DModel.shared32
        let _nilObject: Vector3DModel? = nil

        // Positive
        assertNoThrow {
            var obj = _object
            obj <~ map[JsonKeys.object]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.object).value)
        }
        assertNoThrow {
            var obj = _otherObject
            obj <~ map[JsonKeys.otherObject, default: Constants.invalidValue]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherObject).value)
        }
        assertNoThrow {
            var obj = _nilObject
            obj <~ map[JsonKeys.nilObject]
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilObject).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalMappableObjects_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        let _object: Vector3DModel! = Vector3DModel.shared

        // Positive
        assertNoThrow {
            var obj: Vector3DModel! = _object
            obj <~ map[JsonKeys.object]
            XCTAssertEqual(obj?.x, Int(Int8.max))
        }
        assertNoThrow {
            var obj: Vector3DModel! = _object
            obj <~ map[JsonKeys.noSuchKey]
            XCTAssertNil(obj)
        }
        assertNoThrow {
            var obj: Vector3DModel! = _object
            obj <~ map[JsonKeys.noSuchKey, default: Constants.dictionaryOfInt8]
            XCTAssertEqual(obj?.x, Int(Int8.max))
        }
        assertNoThrow {
            var obj: Vector3DModel! = _object
            obj <~ map[JsonKeys.nilObject]
            XCTAssertNil(obj)
        }
        assertNoThrow {
            var obj: Vector3DModel! = _object
            obj <~ map[JsonKeys.nilObject, default: Constants.dictionaryOfInt8]
            XCTAssertEqual(obj?.x, Int(Int8.max))
        }

        // Negative
        assertThrowsException {
            var obj: Vector3DModel! = _object
            obj <~ map[JsonKeys.invalidObject]
        }
    }

    func testImplicitlyUnwrappedOptionalMappableObjects_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _object: Vector3DModel! = Vector3DModel.shared16
        let _otherObject: Vector3DModel! = Vector3DModel.shared32

        // Positive
        assertNoThrow {
            var obj = _object
            obj <~ map[JsonKeys.object]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.object).value)
        }
        assertNoThrow {
            var obj = _otherObject
            obj <~ map[JsonKeys.otherObject, default: Constants.invalidValue]
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherObject).value)
        }
    }
}
