//
//  OperatorsTests.ArrayMappable.OptionalObject.swift
//  SwiftCommons.Data.UnitTests
//
//  Created by Мамунина Наталья Вадимовна on 3/5/18.
//  Copyright © 2018 Alexander Bragin. All rights reserved.
//

@testable import SwiftCommonsData
import XCTest

extension OperatorsTests
{
    
    func testArrayMappableOptionalObjectsToJSON() {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        let arrayObjectsOptional: Array<ValidModel>? = [validObject]
        
        let notValidArray: Array<NotValidModel> = [notValidObject]
        let emptyArray: Array<ValidModel> = []
        let nilArray: Array<ValidModel>? = nil
        
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
        
        let validObject = ValidModel()
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var arrayObjectsOptional: Array<ValidModel>? = nil
        
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
