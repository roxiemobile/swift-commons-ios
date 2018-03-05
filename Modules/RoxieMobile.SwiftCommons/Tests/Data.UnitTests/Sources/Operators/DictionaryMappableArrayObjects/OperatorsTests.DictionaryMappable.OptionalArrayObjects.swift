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
        
        let dictionaryObjectsOptional: Dictionary<String, [ValidMappableObjectModel]>? = ["object" : [validObject]]
        
        let notValidDictionary: Dictionary<String, [NotValidMappableObjectModel]> = ["object" : [notValidObject]]
        let emptyDictionary: Dictionary<String, ValidMappableObjectModel> = [:]
        let nilDictionary: Dictionary<String, ValidMappableObjectModel>? = nil
        
        dictionaryObjectsOptional >>> map["validDictionaryOptionalObjects"]
        
        
        XCTAssertNotNil(map.JSON["validDictionaryOptionalObjects"])
        
        guardNegativeException { notValidDictionary >>> map["notValidDictionary"] }

        emptyDictionary >>> map["emptyDictionary"]
        XCTAssertNotNil(map.JSON["emptyDictionary"])

        nilDictionary >>> map["nilValidDictionary"]
        XCTAssertNil(map.JSON["nilValidDictionary"])
    }
    
    func testDictionaryMappableOptionalArrayObjectsFromJSON() {
        let value: Bool = true
        let validJSONString = ["object" : ["object" : [["bool" : value,
                                                        "boolOpt" : value,
                                                        "boolImp" : value]]
            ]
        ]
        let notValidJSONString = ["object" : ["object" : [["bool" : "value",
                                                           "boolOpt" : "value",
                                                           "boolImp" : "value"]]
            ]
        ]
        let emptyJSONString =  ["object" : ["object" : [:]]
                                ]

        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var dictionaryObjectsOptional: Dictionary<String, [ValidMappableObjectModel]>? = nil
        
        dictionaryObjectsOptional <~ validMap["object"]
        
        /// Valid Dictionary
        XCTAssertNotNil(dictionaryObjectsOptional?["object"])
        
        /// Empty Dictionary
        guardNegativeException { dictionaryObjectsOptional <~ emptyMap["object"] }
        
        /// Not Valid Dictionary
        guardNegativeException { dictionaryObjectsOptional <~ notValidMap["object"] }
        
        /// Not Valid Key
        dictionaryObjectsOptional <~ validMap["notValidKey"]
        XCTAssertNil(dictionaryObjectsOptional)
        
    }
}

// ----------------------------------------------------------------------------
