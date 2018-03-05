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
        
        var dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, ValidMappableObjectModel>! = ["object" : validObject]
        
        let notValidDictionary: Dictionary<String, NotValidMappableObjectModel> = ["object" : notValidObject]
        let emptyDictionary: Dictionary<String, ValidMappableObjectModel> = [:]
        let nilDictionary: Dictionary<String, ValidMappableObjectModel>? = nil
        
        dictionaryObjectsImplicitlyUnwrappedOptional <~ map["validImplicitlyUnwrappedObjects"]
        
        
        XCTAssertNotNil(map.JSON["validImplicitlyUnwrappedObjects"])
        
        
        guardNegativeException { notValidDictionary >>> map["notValidDictionary"] }
        
        emptyDictionary >>> map["emptyDictionary"]
        XCTAssertNotNil(map.JSON["emptyDictionary"])
        
        nilDictionary >>> map["nilDictionary"]
        XCTAssertNil(map.JSON["nilDictionary"])
    }
    
    func testDictionaryMappableImplicitlyUnwrappedOptionalObjectsFromJSON() {
        let value: Bool = true
        let validJSONString = ["object" : ["object" : ["bool" : value,
                                                       "boolOpt" : value,
                                                       "boolImp" : value]
            ]
        ]
        let notValidJSONString = ["object" : ["object" : ["bool" : "value",
                                                          "boolOpt" : "value",
                                                          "boolImp" : "value"]
            ]
        ]
        let emptyJSONString =  ["object" : [[:]]
                                ]
        
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, ValidMappableObjectModel>!
        
        dictionaryObjectsImplicitlyUnwrappedOptional <~ validMap["object"]
        
        /// Valid Dictionary
        XCTAssertNotNil(dictionaryObjectsImplicitlyUnwrappedOptional["object"])
        
        /// Empty Dictionary
        guardNegativeException { dictionaryObjectsImplicitlyUnwrappedOptional <~ emptyMap["object"] }

        /// Not Valid Dictionary
        guardNegativeException { dictionaryObjectsImplicitlyUnwrappedOptional <~ notValidMap["object"] }

        /// Not Valid Key
        guardNegativeException { dictionaryObjectsImplicitlyUnwrappedOptional <~ validMap["notValidKey"] }
        
    }
}

// ----------------------------------------------------------------------------
