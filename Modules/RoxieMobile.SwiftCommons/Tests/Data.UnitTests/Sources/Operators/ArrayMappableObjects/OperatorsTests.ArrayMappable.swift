//
//  OperatorsTestsArrayMappableObject.swift
//  SwiftCommons.Data.UnitTests
//
//  Created by Мамунина Наталья Вадимовна on 3/2/18.
//  Copyright © 2018 Alexander Bragin. All rights reserved.
//

@testable import SwiftCommonsData
import XCTest

extension OperatorsTests
{
    
    func testArrayMappableObjectsToJSON() {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let arrayObjects: Array<ValidModel> = [validObject]
        let arrayObjectsOptional: Array<ValidModel>? = [validObject]
        let arrayObjectsImplicitlyUnwrappedOptional: Array<ValidModel>! = [validObject]
        
        let notValidArray: Array<NotValidModel> = [notValidObject]
        let emptyArray: Array<ValidModel> = []
        let nilArray: Array<ValidModel>? = nil
        
        arrayObjects >>> map["validArrayObjects"]
        arrayObjectsOptional >>> map["validArrayOptionalObjects"]
        arrayObjectsImplicitlyUnwrappedOptional >>> map["validImplicitlyUnwrappedObjects"]
        
        
        XCTAssertNotNil(map.JSON["validArrayObjects"])
        XCTAssertNotNil(map.JSON["validArrayOptionalObjects"])
        XCTAssertNotNil(map.JSON["validImplicitlyUnwrappedObjects"])
        
        
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

        let validObject = ValidModel()
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)

        var arrayObjects: Array<ValidModel> = []
        var arrayObjectsOptional: Array<ValidModel>? = nil
        var arrayObjectsImplicitlyUnwrappedOptional: Array<ValidModel>!
        
        arrayObjects <~ validMap["object"]
        arrayObjectsOptional <~ validMap["object"]
        arrayObjectsImplicitlyUnwrappedOptional <~ validMap["object"]

        /// Valid Array
        XCTAssertNotNil(arrayObjects.first)
        XCTAssertNotNil(arrayObjectsOptional?.first)
        XCTAssertNotNil(arrayObjectsImplicitlyUnwrappedOptional.first)
        
        /// Empty Array
        guardNegativeException { arrayObjects <~ emptyMap["object"] }
        guardNegativeException { arrayObjectsOptional <~ emptyMap["object"] }
        guardNegativeException { arrayObjectsImplicitlyUnwrappedOptional <~ emptyMap["object"] }
        
        /// Not Valid Array
        guardNegativeException { arrayObjects <~ notValidMap["object"] }
        guardNegativeException { arrayObjectsOptional <~ notValidMap["object"] }
        guardNegativeException { arrayObjectsImplicitlyUnwrappedOptional <~ notValidMap["object"] }
        
        /// Not Valid Key
        guardNegativeException { arrayObjects <~ validMap["notValidKey"] }
        arrayObjectsOptional <~ validMap["notValidKey"]
        XCTAssertNil(arrayObjectsOptional)
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

