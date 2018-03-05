// ----------------------------------------------------------------------------
//
//  OperatorsTests.SetMappable.Object.swift
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
    
    func testSetMappableObjectsToJSON() {
        let validObject = SetValidMappableObjectModel()
        let notValidObject = SetNotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let setObjects: Set<SetValidMappableObjectModel> = [validObject]
        
        let notValidSet: Set<SetNotValidMappableObjectModel> = [notValidObject]
        let emptySet: Set<SetValidMappableObjectModel> = []
        let nilSet: Set<SetValidMappableObjectModel>? = nil

        setObjects >>> map["validSetObjects"]

        XCTAssertNotNil(map.JSON["validSetObjects"])

        guardNegativeException { notValidSet >>> map["notValidSet"] }

        emptySet >>> map["emptySet"]
        XCTAssertNotNil(map.JSON["emptySet"])

        nilSet >>> map["nilValidSet"]
        XCTAssertNil(map.JSON["nilSet"])
    }
    
    func testSetMappableObjectsFromJSON() {
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

        var setObjects: Set<SetValidMappableObjectModel> = []

        setObjects <~ validMap["object"]

        /// Valid Set
        XCTAssertNotNil(setObjects.first)
        
        /// Empty Set
        guardNegativeException { setObjects <~ emptyMap["object"] }

        /// Not Valid Set
        guardNegativeException { setObjects <~ notValidMap["object"] }

        /// Not Valid Key
        guardNegativeException { setObjects <~ validMap["notValidKey"] }

    }
}

// ----------------------------------------------------------------------------
