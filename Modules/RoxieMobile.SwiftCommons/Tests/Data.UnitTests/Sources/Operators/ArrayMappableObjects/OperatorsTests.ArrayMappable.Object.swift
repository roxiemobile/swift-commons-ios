// ----------------------------------------------------------------------------
//
//  OperatorsTests.ArrayMappable.Object.swift
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
    
    func testArrayMappableObjectsToJSON() {
        let validObject = ValidMappableObjectModel()
        let notValidObject = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let arrayObjects: Array<ValidMappableObjectModel> = [validObject]
        
        let notValidArray: Array<NotValidMappableObjectModel> = [notValidObject]
        let emptyArray: Array<ValidMappableObjectModel> = []
        let nilArray: Array<ValidMappableObjectModel>? = nil
        
        arrayObjects >>> map[CodingKeys.validArrayObjects]
        
        
        XCTAssertNotNil(map.JSON[CodingKeys.validArrayObjects])
        
        
        guardNegativeException { notValidArray >>> map[CodingKeys.notValidValue] }
        
        emptyArray >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])
        
        nilArray >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }
    
    func testArrayMappableObjectsFromJSON() {
        let validJSONString = [
            CodingKeys.validArrayObjects : [[
                CodingKeys.bool : Constants.boolTrue,
                CodingKeys.boolOptional : Constants.boolTrue,
                CodingKeys.boolImplicityUnwrapped : Constants.boolTrue]
            ]
        ]
        let notValidJSONString = [
            CodingKeys.notValidValue : [
                [CodingKeys.bool : Constants.notValidValue,
                 CodingKeys.boolOptional : Constants.notValidValue,
                 CodingKeys.boolImplicityUnwrapped : Constants.notValidValue]
            ]
        ]
        let emptyJSONString =  [
            CodingKeys.emptyValue : [[]]
        ]

        let validObject = ValidMappableObjectModel()
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)

        var arrayObjects: Array<ValidMappableObjectModel> = []
        
        arrayObjects <~ validMap[CodingKeys.validArrayObjects]

        /// Valid Array
        XCTAssertNotNil(arrayObjects.first)
        
        /// Empty Array
        guardNegativeException { arrayObjects <~ emptyMap[CodingKeys.emptyValue] }
        
        /// Not Valid Array
        guardNegativeException { arrayObjects <~ notValidMap[CodingKeys.notValidValue] }
        
        /// Not Valid Key
        guardNegativeException { arrayObjects <~ validMap[CodingKeys.noSuchKey] }
        
    }
}

// ----------------------------------------------------------------------------
