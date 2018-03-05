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

        let dictionaryObjects: Dictionary<String, ValidMappableObjectModel> = ["validObject" : validObject]

        let notValidDictionary: Dictionary<String, SetNotValidMappableObjectModel> = ["validObject" : notValidObject]
        let emptyDictionary: Dictionary<String, ValidMappableObjectModel> = [:]
        let nilDictionary: Dictionary<String, ValidMappableObjectModel>? = nil

        dictionaryObjects >>> map["validDictionaryObjects"]

        XCTAssertNotNil(map.JSON["validDictionaryObjects"])

        guardNegativeException { notValidDictionary >>> map["notValidDictionary"] }

        emptyDictionary >>> map["emptyDictionary"]
        XCTAssertNotNil(map.JSON["emptyDictionary"])

        nilDictionary >>> map["nilDictionary"]
        XCTAssertNil(map.JSON["nilDictionary"])
    }
    
    func testDictionaryMappableObjectsFromJSON() {
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
        
        let emptyJSONString =  ["object" : ["object":[:]]
                                ]

        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var dictionaryObjects: Dictionary<String, ValidMappableObjectModel> = [:]
        
        dictionaryObjects <~ validMap["object"]
        
        
        /// Valid Dictionary
        XCTAssertNotNil(dictionaryObjects["object"])

        /// Empty Dictionary
        guardNegativeException { dictionaryObjects <~ emptyMap["object"] }

        /// Not Valid Dictionary
        guardNegativeException { dictionaryObjects <~ notValidMap["object"] }

        /// Not Valid Key
        guardNegativeException { dictionaryObjects <~ validMap["notValidKey"] }
        
    }
}

// ----------------------------------------------------------------------------
