// ----------------------------------------------------------------------------
//
//  OperatorsTests.ArrayMappable.ImplicitlyUnwrappedOptionalObject.swift
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
    
    func testArrayMappableImplicitlyUnwrappedOptionalObjectsToJSON() {
        let validObject = ValidMappableObjectModel()
        let notValidObject = NotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        let arrayObjectsImplicitlyUnwrappedOptional: Array<ValidMappableObjectModel>! = [validObject]
        
        let notValidArray: Array<NotValidMappableObjectModel> = [notValidObject]
        let emptyArray: Array<ValidMappableObjectModel> = []
        let nilArray: Array<ValidMappableObjectModel>? = nil
        
        arrayObjectsImplicitlyUnwrappedOptional >>> map["validImplicitlyUnwrappedObjects"]
        
        
        XCTAssertNotNil(map.JSON["validImplicitlyUnwrappedObjects"])
        
        
        guardNegativeException { notValidArray >>> map["notValidArray"] }
        
        emptyArray >>> map["emptyArray"]
        XCTAssertNotNil(map.JSON["emptyArray"])
        
        nilArray >>> map["nilValidArray"]
        XCTAssertNil(map.JSON["nilArray"])
    }
    
    func testArrayMappableImplicitlyUnwrappedOptionalFromJSON() {
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
        
        var arrayObjectsImplicitlyUnwrappedOptional: Array<ValidMappableObjectModel>!
        
        arrayObjectsImplicitlyUnwrappedOptional <~ validMap["object"]
        
        /// Valid Array
        XCTAssertNotNil(arrayObjectsImplicitlyUnwrappedOptional.first)
        
        /// Empty Array
        guardNegativeException {
            arrayObjectsImplicitlyUnwrappedOptional <~ emptyMap["object"]
        }
        
        /// Not Valid Array
        guardNegativeException { arrayObjectsImplicitlyUnwrappedOptional <~ notValidMap["object"] }
        
        /// Not Valid Key
        guardNegativeException { arrayObjectsImplicitlyUnwrappedOptional <~ validMap["notValidKey"] }
        
    }
}

// ----------------------------------------------------------------------------
