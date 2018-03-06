// ----------------------------------------------------------------------------
//
//  OperatorsTests.ArrayMappable.OptionalObject.swift
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
    
    func testArrayMappableOptionalObjectsToJSON() {
        let validObject = ValidMappableObjectModel()
        let notValidObject = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        let arrayObjectsOptional: Array<ValidMappableObjectModel>? = [validObject]
        
        let notValidArray: Array<NotValidMappableObjectModel> = [notValidObject]
        let emptyArray: Array<ValidMappableObjectModel> = []
        let nilArray: Array<ValidMappableObjectModel>? = nil
        
        arrayObjectsOptional >>> map[CodingKeys.validArrayOptionalObjects]
        
        
        XCTAssertNotNil(map.JSON[CodingKeys.validArrayOptionalObjects])
        
        
        guardNegativeException { notValidArray >>> map[CodingKeys.notValidValue] }
        
        emptyArray >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])
        
        nilArray >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }
    
    func testArrayMappableOptionalObjectsFromJSON() {
        let validJSONString = JSONKeys.forArrayMappableOptionalObjects
        let notValidJSONString = JSONKeys.forArrayMappableObjectsNotValid
        let emptyJSONString =  JSONKeys.forArrayMappableObjectsEmpty
        
        let validObject = ValidMappableObjectModel()
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var arrayObjectsOptional: Array<ValidMappableObjectModel>? = nil
        
        arrayObjectsOptional <~ validMap[CodingKeys.validArrayOptionalObjects]
        
        /// Valid Array
        XCTAssertNotNil(arrayObjectsOptional?.first)
        
        /// Empty Array
        guardNegativeException { arrayObjectsOptional <~ emptyMap[CodingKeys.emptyValue] }
        
        /// Not Valid Array
        guardNegativeException { arrayObjectsOptional <~ notValidMap[CodingKeys.notValidValue] }
        
        /// Not Valid Key
        arrayObjectsOptional <~ validMap[CodingKeys.noSuchKey]
        XCTAssertNil(arrayObjectsOptional)
        
    }
}

// ----------------------------------------------------------------------------
