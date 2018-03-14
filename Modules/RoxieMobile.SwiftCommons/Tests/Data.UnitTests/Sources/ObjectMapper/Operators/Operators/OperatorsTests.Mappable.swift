// ----------------------------------------------------------------------------
//
//  OperatorsTests.Mappable.swift
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

    func testObjectMappableToJSON() {

        var object: ValidMappableObjectModel = ValidMappableObjectModel()
        var map = Map(mappingType: .toJSON, JSON: [:])
        object >>> map[JsonKeys.validObject]
        let someDictionary = map.JSON[JsonKeys.validObject]! as! [String: Bool]
        let bool = someDictionary[JsonKeys.bool]!

        /// Positive results
        XCTAssertEqual(object.bool, bool)

        /// Negative results
        let someDateTime = NotValidMappableObjectModel(map: map)
        guardNegativeException {
            someDateTime >>> map[JsonKeys.date]
        }
    }

    func testObjectMappableFromJSON() {

        let JsonString = Constants.mappableObjects
        let JsonStringNotValid = Constants.mappableObjectsNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        mapValid.JSON[JsonKeys.nilValue] = nil
        let mapNotValid = Map(mappingType: .toJSON, JSON: JsonStringNotValid)
        var object: ValidMappableObjectModel = ValidMappableObjectModel()
        object <~ mapValid[JsonKeys.validObject]
        print(object.bool)

        /// Positive results
        XCTAssertTrue(object.bool)

        /// Negative results
        object <~ mapNotValid[JsonKeys.validObject]
        print(object.bool)
        XCTAssertTrue(object.bool)
        guardNegativeException {
            object <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            object <~ mapValid[JsonKeys.nilValue]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testOptionalMappableObjectsToJSON() {

        var object: ValidMappableObjectModel? = ValidMappableObjectModel()
        var map = Map(mappingType: .toJSON, JSON: [:])
        object >>> map[JsonKeys.validObject]
        let someDictionary = map.JSON[JsonKeys.validObject]! as! [String: Bool]
        let bool = someDictionary[JsonKeys.bool]!

        /// Positive results
        XCTAssertEqual(object?.bool, bool)

        /// Negative results
        let someDateTime: NotValidMappableObjectModel? = NotValidMappableObjectModel(map: map)
        guardNegativeException {
            someDateTime >>> map[JsonKeys.date]
        }
    }

    func testOptionalMappableObjectsFromJSON() {

        let JsonString = Constants.mappableObjects
        let JsonStringNotValid = Constants.mappableObjectsNotValid

        let map = Map(mappingType: .fromJSON, JSON: JsonString)
        map.JSON[JsonKeys.nilValue] = nil
        let mapNotValid = Map(mappingType: .toJSON, JSON: JsonStringNotValid)
        var object: ValidMappableObjectModel? = ValidMappableObjectModel()
        object <~ map[JsonKeys.validObject]
        print(object?.bool)
        let bool = object?.bool

        /// Positive results
        XCTAssertTrue(bool!)

        /// Negative results
        object <~ mapNotValid[JsonKeys.validObject]
        XCTAssertTrue((object?.boolOpt)!)
        object <~ map[JsonKeys.noSuchKey]
        XCTAssertNil(object?.boolOpt)
        object <~ map[JsonKeys.nilValue]
        XCTAssertNil(object?.boolOpt)
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional Mappable objects
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testObjectImplicitlyUnwrappedOptionalMappableToJSON() {

        var object: ValidMappableObjectModel! = ValidMappableObjectModel()
        var map = Map(mappingType: .toJSON, JSON: [:])

        object <~ map[JsonKeys.validObject]


        // Positive
        let someDictionary = map.JSON[JsonKeys.validObject]! as! [String: Bool]
        let bool = someDictionary[JsonKeys.bool]!
        XCTAssertEqual(object.bool, bool)

        // Negative
        let someDateTime = NotValidMappableObjectModel(map: map)
        guardNegativeException {
            someDateTime >>> map[JsonKeys.date]
        }
    }

    func testObjectImplicitlyUnwrappedOptionalMappableFromJSON() {

        let JsonString = Constants.mappableObjects
        let JsonStringNotValid = Constants.mappableObjectsNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .toJSON, JSON: JsonStringNotValid)

        var object: ValidMappableObjectModel! = ValidMappableObjectModel()

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertTrue(object.bool)

        // Negative
        object <~ mapNotValid[JsonKeys.validObject]
        XCTAssertTrue(object.bool)

        guardNegativeException {
            object <~ mapValid[JsonKeys.noSuchKey]
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        guardNegativeException {
            object <~ mapValid[JsonKeys.nilValue]
        }
    }
}

// ----------------------------------------------------------------------------
