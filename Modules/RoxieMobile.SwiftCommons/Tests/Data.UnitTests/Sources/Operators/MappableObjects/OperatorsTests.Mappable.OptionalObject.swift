// ----------------------------------------------------------------------------
//
//  OperatorsTests.Mappable.OptionalObject.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testOptionalMappableObjectsToJSON() {

        var object: ValidMappableObjectModel? = ValidMappableObjectModel()
        var map = Map(mappingType: .toJSON, JSON: [:])
        object >>> map[CodingKeys.validObject]
        let someDictionary = map.JSON[CodingKeys.validObject]! as! [String: Bool]
        let bool = someDictionary[CodingKeys.bool]!

        /// Positive results
        XCTAssertEqual(object?.bool, bool)

        /// Negative results
        let someDateTime: NotValidMappableObjectModel? = NotValidMappableObjectModel(map: map)
        guardNegativeException {
            someDateTime >>> map[CodingKeys.date]
        }
    }

    func testOptionalMappableObjectsFromJSON() {

        let JSONString = JSONKeys.forMappableObjects
        let JSONStringNotValid = JSONKeys.forMappableObjectsNotValid

        let map = Map(mappingType: .fromJSON, JSON: JSONString)
        map.JSON[CodingKeys.nilValue] = nil
        let mapNotValid = Map(mappingType: .toJSON, JSON: JSONStringNotValid)
        var object: ValidMappableObjectModel? = ValidMappableObjectModel()
        object <~ map[CodingKeys.validObject]
        print(object?.bool)
        let bool = object?.bool

        /// Positive results
        XCTAssertTrue(bool!)

        /// Negative results
        object <~ mapNotValid[CodingKeys.validObject]
        XCTAssertTrue((object?.boolOpt)!)
        object <~ map[CodingKeys.noSuchKey]
        XCTAssertNil(object?.boolOpt)
        object <~ map[CodingKeys.nilValue]
        XCTAssertNil(object?.boolOpt)
    }
}

// ----------------------------------------------------------------------------
