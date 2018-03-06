// ----------------------------------------------------------------------------
//
//  OperatorsTests.ArrayMappable.ImplicitlyUnwrappedOptionalObject.swift
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
    
    func testArrayMappableImplicitlyUnwrappedOptionalObjectsToJSON() {
        let validObject = ValidMappableObjectModel()
        let notValidObject = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        let arrayObjectsImplicitlyUnwrappedOptional: Array<ValidMappableObjectModel>! = [validObject]
        
        let notValidArray: Array<NotValidMappableObjectModel> = [notValidObject]
        let emptyArray: Array<ValidMappableObjectModel> = []
        let nilArray: Array<ValidMappableObjectModel>? = nil
        
        arrayObjectsImplicitlyUnwrappedOptional >>> map[CodingKeys.validArrayImplicitlyUnwrappedObjects]
        
        
        XCTAssertNotNil(map.JSON[CodingKeys.validArrayImplicitlyUnwrappedObjects])
        
        
        guardNegativeException { notValidArray >>> map[CodingKeys.notValidValue] }
        
        emptyArray >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])
        
        nilArray >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }
    
    func testArrayMappableImplicitlyUnwrappedOptionalFromJSON() {
        let validJSONString = JSONKeys.forArrayMappableImplicitlyUnwrappedOptionalObjects
        let notValidJSONString = JSONKeys.forArrayMappableObjectsNotValid
        let emptyJSONString =  JSONKeys.forArrayMappableObjectsEmpty

        let validObject = ValidMappableObjectModel()
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var arrayObjectsImplicitlyUnwrappedOptional: Array<ValidMappableObjectModel>!
        
        arrayObjectsImplicitlyUnwrappedOptional <~ validMap[CodingKeys.validArrayImplicitlyUnwrappedObjects]
        
        /// Valid Array
        XCTAssertNotNil(arrayObjectsImplicitlyUnwrappedOptional.first)
        
        /// Empty Array
        guardNegativeException {
            arrayObjectsImplicitlyUnwrappedOptional <~ emptyMap[CodingKeys.emptyValue]
        }
        
        /// Not Valid Array
        guardNegativeException { arrayObjectsImplicitlyUnwrappedOptional <~ notValidMap[CodingKeys.notValidValue] }
        
        /// Not Valid Key
        guardNegativeException { arrayObjectsImplicitlyUnwrappedOptional <~ validMap[CodingKeys.noSuchKey] }
        
    }
}

// ----------------------------------------------------------------------------
