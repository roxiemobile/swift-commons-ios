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
        let validObject = ValidModel()
        let notValidObject = NotValidModel()
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        let arrayObjectsImplicitlyUnwrappedOptional: Array<ValidModel>! = [validObject]
        
        let notValidArray: Array<NotValidModel> = [notValidObject]
        let emptyArray: Array<ValidModel> = []
        let nilArray: Array<ValidModel>? = nil
        
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
        
        let validObject = ValidModel()
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var arrayObjectsImplicitlyUnwrappedOptional: Array<ValidModel>!
        
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


fileprivate class NotValidModel: Mappable {
    var date: Date = Date(timeIntervalSinceReferenceDate: -123456789.0)
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        date        <~ map["date"]
    }
}

fileprivate class ValidModel: Mappable {
    var bool: Bool = false
    var boolOpt: Bool? = false
    var boolImp: Bool! = false
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        bool        <~ map["bool"]
        boolOpt     <~ map["boolOpt"]
        boolImp     <~ map["boolImp"]
    }
}

// ----------------------------------------------------------------------------
