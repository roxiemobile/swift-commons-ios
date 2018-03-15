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
// MARK: - Object conforming to Mappable
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testMappableObjectMappingFromJSON() {

        let mapValid = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: Constants.invalidMappableObjects)

        mapValid.JSON[JsonKeys.nilValue] = nil

        // --

        var object: ValidMappableObjectModel = ValidMappableObjectModel()

        // Positive
        object <~ mapValid[JsonKeys.validObject]
        XCTAssertTrue(object.bool && (object.boolOpt ?? false) && object.boolImpOpt)

        // Negative
        assertExceptionNotNil {
            object <~ mapNotValid[JsonKeys.validObject]
        }
        assertExceptionNotNil {
            object <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            object <~ mapValid[JsonKeys.nilValue]
        }
    }

    // FIXME: WTF?
    func testMappableObjectMappingToJSON() {

        var map = Map(mappingType: .toJSON, JSON: [:])

        var object: ValidMappableObjectModel = ValidMappableObjectModel()

        let someDictionary = map.JSON[JsonKeys.validObject]! as! [String: Bool]
        let bool = someDictionary[JsonKeys.bool]!

        // Positive
        object >>> map[JsonKeys.validObject]
        XCTAssertEqual(object.bool, bool)

        // Negative
        let someDateTime = NotValidMappableObjectModel(map: map)
        assertExceptionNotNil {
            someDateTime >>> map[JsonKeys.date]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    // FIXME: WTF?
    func testOptionalMappableObjectMappingFromJSON() {

        let map = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: Constants.invalidMappableObjects)

        map.JSON[JsonKeys.nilValue] = nil

        // --

        var object: ValidMappableObjectModel? = ValidMappableObjectModel()
        let bool = object?.bool

        // Positive
        object <~ map[JsonKeys.validObject]
        XCTAssertTrue(bool!)

        // Negative
        object <~ mapNotValid[JsonKeys.validObject]
        XCTAssertTrue((object?.boolOpt)!)

        object <~ map[JsonKeys.noSuchKey]
        XCTAssertNil(object?.boolOpt)

        object <~ map[JsonKeys.nilValue]
        XCTAssertNil(object?.boolOpt)
    }

    // FIXME: WTF?
    func testOptionalMappableObjectMappingToJSON() {

        var map = Map(mappingType: .toJSON, JSON: [:])

        let someDictionary = map.JSON[JsonKeys.validObject]! as! [String: Bool]
        let bool = someDictionary[JsonKeys.bool]!

        var object: ValidMappableObjectModel? = ValidMappableObjectModel()

        // Positive
        object >>> map[JsonKeys.validObject]
        XCTAssertEqual(object?.bool, bool)

        // Negative
        let someDateTime: NotValidMappableObjectModel? = NotValidMappableObjectModel(map: map)
        assertExceptionNotNil {
            someDateTime >>> map[JsonKeys.date]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    // FIXME: WTF?
    func testImplicitlyUnwrappedOptionalMappableObjectMappingFromJSON() {

        let mapValid = Map(mappingType: .fromJSON, JSON: Constants.mappableObjects)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: Constants.invalidMappableObjects)

        var object: ValidMappableObjectModel! = ValidMappableObjectModel()

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertTrue(object.bool)

        // Negative
        object <~ mapNotValid[JsonKeys.validObject]
        XCTAssertTrue(object.bool)

        assertExceptionNotNil {
            object <~ mapValid[JsonKeys.noSuchKey]
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        assertExceptionNotNil {
            object <~ mapValid[JsonKeys.nilValue]
        }
    }

    // FIXME: WTF?
    func testImplicitlyUnwrappedOptionalMappableObjectMappingToJSON() {

        var object: ValidMappableObjectModel! = ValidMappableObjectModel()
        var map = Map(mappingType: .toJSON, JSON: [:])

        object <~ map[JsonKeys.validObject]


        // Positive
        let someDictionary = map.JSON[JsonKeys.validObject]! as! [String: Bool]
        let bool = someDictionary[JsonKeys.bool]!
        XCTAssertEqual(object.bool, bool)

        // Negative
        let someDateTime = NotValidMappableObjectModel(map: map)
        assertExceptionNotNil {
            someDateTime >>> map[JsonKeys.date]
        }
    }
}

// ----------------------------------------------------------------------------
