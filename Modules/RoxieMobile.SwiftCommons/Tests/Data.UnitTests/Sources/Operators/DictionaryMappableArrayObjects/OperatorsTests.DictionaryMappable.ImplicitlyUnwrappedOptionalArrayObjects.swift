// ----------------------------------------------------------------------------
//
//  OperatorsTests.DictionaryMappable.ImplicitlyUnwrappedOptionalArrayObjects.swift
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
    
    func testDictionaryMappableImplicitlyUnwrappedOptionalArrayObjectsToJSON() {
        let validObject = ValidMappableObjectModel()
        let notValidObject = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        var dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, [ValidMappableObjectModel]>! = [CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects : [validObject]]
        
        let notValidDictionary: Dictionary<String, [NotValidMappableObjectModel]> = [CodingKeys.notValidValue: [notValidObject]]
        let emptyDictionary: Dictionary<String, [ValidMappableObjectModel]> = [:]
        let nilDictionary: Dictionary<String, [ValidMappableObjectModel]>? = nil
        
        dictionaryObjectsImplicitlyUnwrappedOptional <~ map[CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects]
        
        
        XCTAssertNotNil(map.JSON[CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects])
        
        
        guardNegativeException { notValidDictionary >>> map[CodingKeys.notValidValue] }
        
        emptyDictionary >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])
        
        nilDictionary >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }
    
    func testDictionaryMappableImplicitlyUnwrappedOptionalArrayObjectsFromJSON() {
        let validJSONString = [
            CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects : [
                CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects : [
                    [CodingKeys.bool : Constants.boolTrue,
                     CodingKeys.boolOptional : Constants.boolTrue,
                     CodingKeys.boolImplicityUnwrapped : Constants.boolTrue]
                ]
            ]
        ]
        let notValidJSONString = [
            CodingKeys.notValidValue : [
                CodingKeys.notValidValue : [
                    [CodingKeys.bool : Constants.notValidValue,
                     CodingKeys.boolOptional : Constants.notValidValue,
                     CodingKeys.boolImplicityUnwrapped : Constants.notValidValue]
                ]
            ]
        ]

        let emptyJSONString =  [
            CodingKeys.emptyValue : [
                CodingKeys.emptyValue : [:]
            ]
        ]
        
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, [ValidMappableObjectModel]>!
        
        dictionaryObjectsImplicitlyUnwrappedOptional <~ validMap[CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects]
        
        /// Valid Dictionary
        XCTAssertNotNil(dictionaryObjectsImplicitlyUnwrappedOptional[CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects])
        
        /// Empty Dictionary
        guardNegativeException { dictionaryObjectsImplicitlyUnwrappedOptional <~ emptyMap[CodingKeys.emptyValue] }
        
        /// Not Valid Dictionary
        guardNegativeException { dictionaryObjectsImplicitlyUnwrappedOptional <~ notValidMap[CodingKeys.notValidValue] }
        
        /// Not Valid Key
        guardNegativeException { dictionaryObjectsImplicitlyUnwrappedOptional <~ validMap[CodingKeys.nilValue] }
        
    }
}

// ----------------------------------------------------------------------------
