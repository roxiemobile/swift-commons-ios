// ----------------------------------------------------------------------------
//
//  OperatorsTests.SetMappable.OptionalObject.swift
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
    
    func testSetMappableOptionalObjectsToJSON() {
        let validObject = SetValidMappableObjectModel()
        let notValidObject = SetNotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        let setObjectsOptional: Set<SetValidMappableObjectModel>? = [validObject]
        
        let notValidSet: Set<SetNotValidMappableObjectModel> = [notValidObject]
        let emptySet: Set<SetValidMappableObjectModel> = []
        let nilSet: Set<SetValidMappableObjectModel>? = nil
        
        setObjectsOptional >>> map["validSetOptionalObjects"]
        
        
        XCTAssertNotNil(map.JSON["validSetOptionalObjects"])
        
        
        guardNegativeException { notValidSet >>> map["notValidSet"] }
        
        emptySet >>> map["emptySet"]
        XCTAssertNotNil(map.JSON["emptySet"])
        
        nilSet >>> map["nilValidSet"]
        XCTAssertNil(map.JSON["nilSet"])
    }
    
    func testSetMappableOptionalObjectsFromJSON() {
        let value: Int = 10
        let validJSONString = ["object" : [["x" : value,
                                            "y" : value,
                                            "z" : value]
                                            ]
                                ]
        let notValidJSONString = ["object" : [["x" : "value",
                                               "y" : "value",
                                               "z" : "value"]
                                                ]
                                    ]
        let emptyJSONString =  ["object" : [[:]]
                                ]
        
        var validObject = SetValidMappableObjectModel()
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var setObjectsOptional: Set<SetValidMappableObjectModel>? = []
        
        setObjectsOptional <~ validMap["object"]
        
        /// Valid Set
        XCTAssertNotNil(setObjectsOptional?.first)
        
        /// Empty Set
        guardNegativeException { setObjectsOptional <~ emptyMap["object"] }
        
        /// Not Valid Set
        guardNegativeException { setObjectsOptional <~ notValidMap["object"] }
        
        /// Not Valid Key
        guardNegativeException { setObjectsOptional <~ validMap["notValidKey"] }
        
    }
}

// ----------------------------------------------------------------------------
