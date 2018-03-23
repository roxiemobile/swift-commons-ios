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

extension TransformOperatorsTests
{
// MARK: - Tests

    func testMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        var object = Vector3DModel.shared

        // Positive
        assertNoThrow {
            object <~ (map[JsonKeys.object], Vector3DTransform.shared)
            XCTAssertEqual(object.x, Int(Int8.max))
        }
        assertNoThrow {
            object <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, Vector3DModel.shared16)
            XCTAssertEqual(object.x, Int(Int16.max))
        }
        assertNoThrow {
            object <~ (map[JsonKeys.nilObject], Vector3DTransform.shared, Vector3DModel.shared32)
            XCTAssertEqual(object.x, Int(Int32.max))
        }

        // Negative
        assertThrowsException {
            object <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
        }
        assertThrowsException {
            object <~ (map[JsonKeys.invalidObject], Vector3DTransform.shared)
        }
        assertThrowsException {
            object <~ (map[JsonKeys.invalidObject], Vector3DTransform.shared, Vector3DModel.shared)
        }
        assertThrowsException {
            object <~ (map[JsonKeys.nilObject], Vector3DTransform.shared)
        }
    }

    func testMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var object = Vector3DModel.shared16
        var otherObject = Vector3DModel.shared32

        // Positive
        assertNoThrow {
            object <~ (map[JsonKeys.object], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.object).value)
        }
        assertNoThrow {
            otherObject <~ (map[JsonKeys.otherObject, default: Constants.invalidValue], Vector3DTransform.shared, Vector3DModel.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherObject).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testOptionalMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        var object: Vector3DModel? = nil

        // Positive
        assertNoThrow {
            object <~ (map[JsonKeys.object], Vector3DTransform.shared)
            XCTAssertEqual(object?.x, Int(Int8.max))
        }
        assertNoThrow {
            object <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
            XCTAssertNil(object)
        }
        assertNoThrow {
            let defaultObject = map.fetch(valueFor: JsonKeys.object).value!
            object <~ (map[JsonKeys.noSuchKey, default: defaultObject], Vector3DTransform.shared)
            XCTAssertEqual(object?.x, Int(Int8.max))
        }
        assertNoThrow {
            object <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, Vector3DModel.shared16)
            XCTAssertEqual(object?.x, Int(Int16.max))
        }
        assertNoThrow {
            object <~ (map[JsonKeys.nilObject], Vector3DTransform.shared)
            XCTAssertNil(object)
        }
        assertNoThrow {
            object <~ (map[JsonKeys.nilObject], Vector3DTransform.shared, Vector3DModel.shared32)
            XCTAssertEqual(object?.x, Int(Int32.max))
        }

        // Negative
        assertThrowsException {
            object <~ (map[JsonKeys.invalidObject], Vector3DTransform.shared)
        }
        assertThrowsException {
            object <~ (map[JsonKeys.invalidObject], Vector3DTransform.shared, Vector3DModel.shared)
        }
    }

    func testOptionalMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var object: Vector3DModel? = Vector3DModel.shared16
        var otherObject: Vector3DModel? = Vector3DModel.shared32
        var nilObject: Vector3DModel? = nil

        // Positive
        assertNoThrow {
            object <~ (map[JsonKeys.object], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.object).value)
        }
        assertNoThrow {
            otherObject <~ (map[JsonKeys.otherObject, default: Constants.invalidValue], Vector3DTransform.shared, Vector3DModel.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherObject).value)
        }
        assertNoThrow {
            nilObject <~ (map[JsonKeys.nilObject], Vector3DTransform.shared)
            XCTAssertNil(map.fetch(valueFor: JsonKeys.nilObject).value)
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional Mappable objects with Transform
// ----------------------------------------------------------------------------

extension TransformOperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalMappableObjectsWithTransform_fromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)

        var object: Vector3DModel! = Vector3DModel.shared

        // Positive
        assertNoThrow {
            object <~ (map[JsonKeys.object], Vector3DTransform.shared)
            XCTAssertEqual(object.x, Int(Int8.max))
        }
        assertNoThrow {
            object <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared, Vector3DModel.shared16)
            XCTAssertEqual(object.x, Int(Int16.max))
        }
        assertNoThrow {
            object <~ (map[JsonKeys.nilObject], Vector3DTransform.shared, Vector3DModel.shared32)
            XCTAssertEqual(object.x, Int(Int32.max))
        }

        // Negative
        assertThrowsException {
            object <~ (map[JsonKeys.noSuchKey], Vector3DTransform.shared)
        }
        assertThrowsException {
            object <~ (map[JsonKeys.invalidObject], Vector3DTransform.shared)
        }
        assertThrowsException {
            object <~ (map[JsonKeys.invalidObject], Vector3DTransform.shared, Vector3DModel.shared)
        }
        assertThrowsException {
            object <~ (map[JsonKeys.nilObject], Vector3DTransform.shared)
        }
    }

    func testImplicitlyUnwrappedOptionalMappableObjectsWithTransform_toJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var object: Vector3DModel! = Vector3DModel.shared16
        var otherObject: Vector3DModel! = Vector3DModel.shared32

        // Positive
        assertNoThrow {
            object <~ (map[JsonKeys.object], Vector3DTransform.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.object).value)
        }
        assertNoThrow {
            otherObject <~ (map[JsonKeys.otherObject, default: Constants.invalidValue], Vector3DTransform.shared, Vector3DModel.shared)
            XCTAssertNotNil(map.fetch(valueFor: JsonKeys.otherObject).value)
        }
    }
}

// ----------------------------------------------------------------------------
