// ----------------------------------------------------------------------------
//
//  OperatorsTests.DictionaryMappable.ImplicitlyUnwrappedOptionalObjects.swift
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
    
    func testDictionaryMappableImplicitlyUnwrappedOptionalObjectsToJSON() {
        let validObject = ValidMappableObjectModel()
        let notValidObject = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        var dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, ValidMappableObjectModel>! = [CodingKeys.validDictionaryImplicitlyUnwrappedObjects : validObject]
        
        let notValidDictionary: Dictionary<String, NotValidMappableObjectModel> = [CodingKeys.notValidValue : notValidObject]
        let emptyDictionary: Dictionary<String, ValidMappableObjectModel> = [:]
        let nilDictionary: Dictionary<String, ValidMappableObjectModel>? = nil
        
        dictionaryObjectsImplicitlyUnwrappedOptional <~ map[CodingKeys.validDictionaryImplicitlyUnwrappedObjects]
        
        
        XCTAssertNotNil(map.JSON[CodingKeys.validDictionaryImplicitlyUnwrappedObjects])
        
        
        guardNegativeException { notValidDictionary >>> map[CodingKeys.notValidValue] }
        
        emptyDictionary >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])
        
        nilDictionary >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }
    
    func testDictionaryMappableImplicitlyUnwrappedOptionalObjectsFromJSON() {
        let validJSONString = JSONKeys.forDictionaryMappableImplicitlyUnwrappedOptionalObjects
        let notValidJSONString = JSONKeys.forDictionaryMappableObjectsNotValid
        let emptyJSONString =  JSONKeys.forDictionaryMappableObjectsEmpty
        
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, ValidMappableObjectModel>!
        
        dictionaryObjectsImplicitlyUnwrappedOptional <~ validMap[CodingKeys.validDictionaryImplicitlyUnwrappedObjects]
        
        /// Valid Dictionary
        XCTAssertNotNil(dictionaryObjectsImplicitlyUnwrappedOptional[CodingKeys.validDictionaryImplicitlyUnwrappedObjects])

        /// Empty Dictionary
        guardNegativeException { dictionaryObjectsImplicitlyUnwrappedOptional <~ emptyMap[CodingKeys.emptyValue] }

        /// Not Valid Dictionary
        guardNegativeException { dictionaryObjectsImplicitlyUnwrappedOptional <~ notValidMap[CodingKeys.notValidValue] }

        /// Not Valid Key
        guardNegativeException { dictionaryObjectsImplicitlyUnwrappedOptional <~ validMap[CodingKeys.noSuchKey] }
        
    }
}

// ----------------------------------------------------------------------------
