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
        
        arrayObjectsOptional >>> map["validArrayOptionalObjects"]
        
        
        XCTAssertNotNil(map.JSON["validArrayOptionalObjects"])
        
        
        guardNegativeException { notValidArray >>> map["notValidArray"] }
        
        emptyArray >>> map["emptyArray"]
        XCTAssertNotNil(map.JSON["emptyArray"])
        
        nilArray >>> map["nilValidArray"]
        XCTAssertNil(map.JSON["nilArray"])
    }
    
    func testArrayMappableOptionalObjectsFromJSON() {
        let value: Bool = true
        let validJSONString = ["object" : [["bool" : value,
                                            "boolOpt" : value,
                                            "boolImp" : value]
                                        ]
                                ]
        let notValidJSONString = ["object" : [["bool" : "value",
                                               "boolOpt" : "value",
                                               "boolImp" : "value"]
                                            ]
                                    ]
        let emptyJSONString =  ["object" : [[]]
                                ]
        
        let validObject = ValidMappableObjectModel()
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var arrayObjectsOptional: Array<ValidMappableObjectModel>? = nil
        
        arrayObjectsOptional <~ validMap["object"]
        
        /// Valid Array
        XCTAssertNotNil(arrayObjectsOptional?.first)
        
        /// Empty Array
        guardNegativeException { arrayObjectsOptional <~ emptyMap["object"] }
        
        /// Not Valid Array
        guardNegativeException { arrayObjectsOptional <~ notValidMap["object"] }
        
        /// Not Valid Key
        arrayObjectsOptional <~ validMap["notValidKey"]
        XCTAssertNil(arrayObjectsOptional)
        
    }
}

// ----------------------------------------------------------------------------
