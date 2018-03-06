// ----------------------------------------------------------------------------
//
//  OperatorsTests.DictionaryMappable.Object.swift
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
    
    func testDictionaryMappableObjectsToJSON() {
        let validObject = ValidMappableObjectModel()
        let notValidObject = SetNotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let dictionaryObjects: Dictionary<String, ValidMappableObjectModel> = [CodingKeys.validDictionaryObjects : validObject]

        let notValidDictionary: Dictionary<String, SetNotValidMappableObjectModel> = [CodingKeys.notValidValue : notValidObject]
        let emptyDictionary: Dictionary<String, ValidMappableObjectModel> = [:]
        let nilDictionary: Dictionary<String, ValidMappableObjectModel>? = nil

        dictionaryObjects >>> map[CodingKeys.validDictionaryObjects]

        XCTAssertNotNil(map.JSON[CodingKeys.validDictionaryObjects])

        guardNegativeException { notValidDictionary >>> map[CodingKeys.notValidValue] }

        emptyDictionary >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        nilDictionary >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }
    
    func testDictionaryMappableObjectsFromJSON() {
        let validJSONString = [
            CodingKeys.validDictionaryObjects : [
                CodingKeys.validDictionaryObjects : [
                    CodingKeys.bool : Constants.boolTrue,
                    CodingKeys.boolOptional : Constants.boolTrue,
                    CodingKeys.boolImplicityUnwrapped : Constants.boolTrue
                ]
            ]
        ]
        let notValidJSONString = [
            CodingKeys.notValidValue : [
                CodingKeys.notValidValue : [
                    CodingKeys.bool : Constants.notValidValue,
                    CodingKeys.boolOptional : Constants.notValidValue,
                    CodingKeys.boolImplicityUnwrapped : Constants.notValidValue
                ]
            ]
        ]
        
        let emptyJSONString =  [
            CodingKeys.emptyValue : [
                CodingKeys.emptyValue:[:]
            ]
        ]

        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var dictionaryObjects: Dictionary<String, ValidMappableObjectModel> = [:]
        
        dictionaryObjects <~ validMap[CodingKeys.validDictionaryObjects]
        
        
        /// Valid Dictionary
        XCTAssertNotNil(dictionaryObjects[CodingKeys.validDictionaryObjects])

        /// Empty Dictionary
        guardNegativeException { dictionaryObjects <~ emptyMap[CodingKeys.emptyValue] }

        /// Not Valid Dictionary
        guardNegativeException { dictionaryObjects <~ notValidMap[CodingKeys.notValidValue] }

        /// Not Valid Key
        guardNegativeException { dictionaryObjects <~ validMap[CodingKeys.noSuchKey] }
        
    }
}

// ----------------------------------------------------------------------------
