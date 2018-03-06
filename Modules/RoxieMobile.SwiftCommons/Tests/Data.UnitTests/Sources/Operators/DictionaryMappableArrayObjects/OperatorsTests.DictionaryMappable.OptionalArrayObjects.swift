// ----------------------------------------------------------------------------
//
//  OperatorsTests.DictionaryMappable.OptionalArrayObjects.swift
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
    
    func testDictionaryMappableOptionalArrayObjectsToJSON() {
        let validObject = ValidMappableObjectModel()
        let notValidObject = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        let dictionaryObjectsOptional: Dictionary<String, [ValidMappableObjectModel]>? = [CodingKeys.validDictionaryArrayOptionalObjects : [validObject]]
        
        let notValidDictionary: Dictionary<String, [NotValidMappableObjectModel]> = [CodingKeys.notValidValue : [notValidObject]]
        let emptyDictionary: Dictionary<String, ValidMappableObjectModel> = [:]
        let nilDictionary: Dictionary<String, ValidMappableObjectModel>? = nil
        
        dictionaryObjectsOptional >>> map[CodingKeys.validDictionaryArrayOptionalObjects]
        
        
        XCTAssertNotNil(map.JSON[CodingKeys.validDictionaryArrayOptionalObjects])
        
        guardNegativeException { notValidDictionary >>> map[CodingKeys.notValidValue] }

        emptyDictionary >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        nilDictionary >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }
    
    func testDictionaryMappableOptionalArrayObjectsFromJSON() {
        let validJSONString = JSONKeys.forDictionaryMappableArrayOptionalObjects
        let notValidJSONString = JSONKeys.forDictionaryMappableArrayObjectsNotValid
        let emptyJSONString =  JSONKeys.forDictionaryMappableArrayObjectsEmpty

        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var dictionaryObjectsOptional: Dictionary<String, [ValidMappableObjectModel]>? = nil
        
        dictionaryObjectsOptional <~ validMap[CodingKeys.validDictionaryArrayOptionalObjects]
        
        /// Valid Dictionary
        XCTAssertNotNil(dictionaryObjectsOptional?[CodingKeys.validDictionaryArrayOptionalObjects])
        
        /// Empty Dictionary
        guardNegativeException { dictionaryObjectsOptional <~ emptyMap[CodingKeys.emptyValue] }
        
        /// Not Valid Dictionary
        guardNegativeException { dictionaryObjectsOptional <~ notValidMap[CodingKeys.notValidValue] }
        
        /// Not Valid Key
        dictionaryObjectsOptional <~ validMap[CodingKeys.noSuchKey]
        XCTAssertNil(dictionaryObjectsOptional)
        
    }
}

// ----------------------------------------------------------------------------
