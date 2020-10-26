// ----------------------------------------------------------------------------
//
//  TransformOperatorsTests.MappableObjects.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        let _object = Vector3DModel.shared

        // Positive
        assertNoThrow {
            var obj = _object
            obj <~ (map[JsonKeys.object], Vector3DTransform.shared)
            XCTAssertEqual(obj.x, Int(Int8.max))
        }
        assertNoThrow {
            var obj = _object
            obj <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, Vector3DModel.shared16)
            XCTAssertEqual(obj.x, Int(Int16.max))
        }
        assertNoThrow {
            var obj = _object
            obj <~ (map[JsonKeys.nilObject], Vector3DTransform.shared, Vector3DModel.shared32)
            XCTAssertEqual(obj.x, Int(Int32.max))
        }

        // Negative
        assertThrowsException {
            var obj = _object
            obj <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
        }
        assertThrowsException {
            var obj = _object
            obj <~ (map[JsonKeys.invalidObject], Vector3DTransform.shared)
        }
        assertThrowsException {
            var obj = _object
            obj <~ (map[JsonKeys.invalidObject], Vector3DTransform.shared, Vector3DModel.shared)
        }
        assertThrowsException {
            var obj = _object
            obj <~ (map[JsonKeys.nilObject], Vector3DTransform.shared)
        }
    }

    func testMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _object = Vector3DModel.shared16
        let _otherObject = Vector3DModel.shared32

        // Positive
        assertNoThrow {
            var obj = _object
            obj <~ (map[JsonKeys.object], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.object).value)
        }
        assertNoThrow {
            var obj = _otherObject
            obj <~ (map[JsonKeys.otherObject, default: Constants.invalidValue], Vector3DTransform.shared, Vector3DModel.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherObject).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testOptionalMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        let _object: Vector3DModel? = nil

        // Positive
        assertNoThrow {
            var obj = _object
            obj <~ (map[JsonKeys.object], Vector3DTransform.shared)
            XCTAssertEqual(obj?.x, Int(Int8.max))
        }
        assertNoThrow {
            var obj = _object
            obj <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
            XCTAssertNil(obj)
        }
        assertNoThrow {
            let defaultObject = map.fetch(valueFor: JsonKeys.object).value!
            var obj = _object
            obj <~ (map[JsonKeys.noSuchKey, default: defaultObject], Vector3DTransform.shared)
            XCTAssertEqual(obj?.x, Int(Int8.max))
        }
        assertNoThrow {
            var obj = _object
            obj <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, Vector3DModel.shared16)
            XCTAssertEqual(obj?.x, Int(Int16.max))
        }
        assertNoThrow {
            var obj = _object
            obj <~ (map[JsonKeys.nilObject], Vector3DTransform.shared)
            XCTAssertNil(obj)
        }
        assertNoThrow {
            var obj = _object
            obj <~ (map[JsonKeys.nilObject], Vector3DTransform.shared, Vector3DModel.shared32)
            XCTAssertEqual(obj?.x, Int(Int32.max))
        }

        // Negative
        assertThrowsException {
            var obj = _object
            obj <~ (map[JsonKeys.invalidObject], Vector3DTransform.shared)
        }
        assertThrowsException {
            var obj = _object
            obj <~ (map[JsonKeys.invalidObject], Vector3DTransform.shared, Vector3DModel.shared)
        }
    }

    func testOptionalMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _object: Vector3DModel? = Vector3DModel.shared16
        let _otherObject: Vector3DModel? = Vector3DModel.shared32
        let _nilObject: Vector3DModel? = nil

        // Positive
        assertNoThrow {
            var obj = _object
            obj <~ (map[JsonKeys.object], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.object).value)
        }
        assertNoThrow {
            var obj = _otherObject
            obj <~ (map[JsonKeys.otherObject, default: Constants.invalidValue], Vector3DTransform.shared, Vector3DModel.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherObject).value)
        }
        assertNoThrow {
            var obj = _nilObject
            obj <~ (map[JsonKeys.nilObject], Vector3DTransform.shared)
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilObject).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests {

// MARK: - Tests

    func testImplicitlyUnwrappedOptionalMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        let _object: Vector3DModel! = Vector3DModel.shared

        // Positive
        assertNoThrow {
            var obj: Vector3DModel! = _object
            obj <~ (map[JsonKeys.object], Vector3DTransform.shared)
            XCTAssertEqual(obj?.x, Int(Int8.max))
        }
        assertNoThrow {
            var obj: Vector3DModel! = _object
            obj <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
            XCTAssertNil(obj)
        }
        assertNoThrow {
            let defaultObject = map.fetch(valueFor: JsonKeys.object).value!
            var obj: Vector3DModel! = _object
            obj <~ (map[JsonKeys.noSuchKey, default: defaultObject], Vector3DTransform.shared)
            XCTAssertEqual(obj?.x, Int(Int8.max))
        }
        assertNoThrow {
            var obj: Vector3DModel! = _object
            obj <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, Vector3DModel.shared16)
            XCTAssertEqual(obj?.x, Int(Int16.max))
        }
        assertNoThrow {
            var obj: Vector3DModel! = _object
            obj <~ (map[JsonKeys.nilObject], Vector3DTransform.shared)
            XCTAssertNil(obj)
        }
        assertNoThrow {
            var obj: Vector3DModel! = _object
            obj <~ (map[JsonKeys.nilObject], Vector3DTransform.shared, Vector3DModel.shared32)
            XCTAssertEqual(obj?.x, Int(Int32.max))
        }

        // Negative
        assertThrowsException {
            var obj: Vector3DModel! = _object
            obj <~ (map[JsonKeys.invalidObject], Vector3DTransform.shared)
        }
        assertThrowsException {
            var obj: Vector3DModel! = _object
            obj <~ (map[JsonKeys.invalidObject], Vector3DTransform.shared, Vector3DModel.shared)
        }
    }

    func testImplicitlyUnwrappedOptionalMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let _object: Vector3DModel! = Vector3DModel.shared16
        let _otherObject: Vector3DModel! = Vector3DModel.shared32

        // Positive
        assertNoThrow {
            var obj: Vector3DModel! = _object
            obj <~ (map[JsonKeys.object], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.object).value)
        }
        assertNoThrow {
            var obj: Vector3DModel! = _otherObject
            obj <~ (map[JsonKeys.otherObject, default: Constants.invalidValue], Vector3DTransform.shared, Vector3DModel.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherObject).value)
        }
    }
}
