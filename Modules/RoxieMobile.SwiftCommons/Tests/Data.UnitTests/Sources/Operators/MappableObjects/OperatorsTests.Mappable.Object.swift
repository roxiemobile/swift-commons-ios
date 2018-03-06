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
        let someDictionary = map.JSON[CodingKeys.validObject]! as! [String : Bool]
        let bool = someDictionary[CodingKeys.bool]!
        
        /// Positive results
        XCTAssertEqual(object.bool, bool)
        
        /// Negative results
        let someDateTime = NotValidMappableObjectModel(map: map)
        guardNegativeException { someDateTime >>> map [CodingKeys.date] }
    }
    
    func testObjectMappableFromJSON() {
        let JSONString = JSONKeys.forMappableObjects
        let notBoolValueJson = JSONKeys.forMappableObjectsNotValid

        let mapSet = Map(mappingType: .fromJSON, JSON: [:])
        let map = Map(mappingType: .fromJSON, JSON: JSONString)
        map.JSON[CodingKeys.nilValue] = nil
        let mapNotBoolValue = Map(mappingType: .toJSON, JSON: notBoolValueJson)
        var object: ValidMappableObjectModel = ValidMappableObjectModel(map: mapSet)!
        object <~ map[CodingKeys.validObject]
        print(object.bool)
        
        /// Positive results
        XCTAssertTrue(object.bool)
        
        /// Negative results
        object <~ mapNotBoolValue[CodingKeys.validObject]
        print(object.bool)
        XCTAssertTrue(object.bool)
        guardNegativeException { object <~ map[CodingKeys.noSuchKey] }
        guardNegativeException { object <~ map[CodingKeys.nilValue]}
    }
}

// ----------------------------------------------------------------------------
