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
        
        arrayObjects >>> map["validArrayObjects"]
        
        
        XCTAssertNotNil(map.JSON["validArrayObjects"])
        
        
        guardNegativeException { notValidArray >>> map["notValidArray"] }
        
        emptyArray >>> map["emptyArray"]
        XCTAssertNotNil(map.JSON["emptyArray"])
        
        nilArray >>> map["nilValidArray"]
        XCTAssertNil(map.JSON["nilArray"])
    }
    
    func testArrayMappableObjectsFromJSON() {
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

        var arrayObjects: Array<ValidMappableObjectModel> = []
        
        arrayObjects <~ validMap["object"]

        /// Valid Array
        XCTAssertNotNil(arrayObjects.first)
        
        /// Empty Array
        guardNegativeException { arrayObjects <~ emptyMap["object"] }
        
        /// Not Valid Array
        guardNegativeException { arrayObjects <~ notValidMap["object"] }
        
        /// Not Valid Key
        guardNegativeException { arrayObjects <~ validMap["notValidKey"] }
        
    }
}

// ----------------------------------------------------------------------------
