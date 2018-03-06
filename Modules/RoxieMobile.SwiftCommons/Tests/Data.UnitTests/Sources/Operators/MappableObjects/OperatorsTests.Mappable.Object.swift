// ----------------------------------------------------------------------------
//
//  OperatorsTests.Mappable.Object.swift
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

    func testObjectMappableToJSON() {

        var object: ValidMappableObjectModel = ValidMappableObjectModel()
        var map = Map(mappingType: .toJSON, JSON: [:])
        object >>> map[CodingKeys.validObject]
        let someDictionary = map.JSON[CodingKeys.validObject]! as! [String: Bool]
        let bool = someDictionary[CodingKeys.bool]!

        /// Positive results
        XCTAssertEqual(object.bool, bool)

        /// Negative results
        let someDateTime = NotValidMappableObjectModel(map: map)
        guardNegativeException {
            someDateTime >>> map[CodingKeys.date]
        }
    }

    func testObjectMappableFromJSON() {
        let JSONString = JSONKeys.forMappableObjects
        let JSONStringNotValid = JSONKeys.forMappableObjectsNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        mapValid.JSON[CodingKeys.nilValue] = nil
        let mapNotValid = Map(mappingType: .toJSON, JSON: JSONStringNotValid)
        var object: ValidMappableObjectModel = ValidMappableObjectModel()
        object <~ mapValid[CodingKeys.validObject]
        print(object.bool)

        /// Positive results
        XCTAssertTrue(object.bool)

        /// Negative results
        object <~ mapNotValid[CodingKeys.validObject]
        print(object.bool)
        XCTAssertTrue(object.bool)
        guardNegativeException {
            object <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            object <~ mapValid[CodingKeys.nilValue]
        }
    }
}

// ----------------------------------------------------------------------------
