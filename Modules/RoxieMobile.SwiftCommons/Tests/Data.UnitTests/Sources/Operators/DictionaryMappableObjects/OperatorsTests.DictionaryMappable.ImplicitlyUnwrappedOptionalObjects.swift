//
//  OperatorsTests.DictionaryMappable.ImplicitlyUnwrappedOptionalObjects.swift
//  SwiftCommons.Data.UnitTests
//
//  Created by Мамунина Наталья Вадимовна on 3/5/18.
//  Copyright © 2018 Alexander Bragin. All rights reserved.
//

@testable import SwiftCommonsData
import XCTest

extension OperatorsTests
{
    
    func testDictionaryMappableImplicitlyUnwrappedOptionalObjectsToJSON() {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        let dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, ValidModel>! = ["object" : validObject]
        
        let notValidDictionary: Dictionary<String, NotValidModel> = ["object" : notValidObject]
        let emptyDictionary: Dictionary<String, ValidModel> = [:]
        let nilDictionary: Dictionary<String, ValidModel>? = nil
        
        dictionaryObjectsImplicitlyUnwrappedOptional >>> map["validImplicitlyUnwrappedObjects"]
        
        
        XCTAssertNotNil(map.JSON["validImplicitlyUnwrappedObjects"])
        
        
        guardNegativeException { notValidDictionary >>> map["notValidDictionary"] }
        
        emptyDictionary >>> map["emptyDictionary"]
        XCTAssertNotNil(map.JSON["emptyDictionary"])
        
        nilDictionary >>> map["nilDictionary"]
        XCTAssertNil(map.JSON["nilDictionary"])
    }
    
    func testDictionaryMappableImplicitlyUnwrappedOptionalObjectsFromJSON() {
        let value: Int = 10
        let validJSONString = ["object" : ["object" : ["x" : value,
                                            "y" : value,
                                            "z" : value]
                                    ]
                                ]
        let notValidJSONString = ["object" : ["object" : ["x" : "value",
                                               "y" : "value",
                                               "z" : "value"]
                                        ]
                                    ]
        let emptyJSONString =  ["object" : [[:]]
                                ]
        
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var dictionaryObjectsImplicitlyUnwrappedOptional: Dictionary<String, ValidModel>!
        
        dictionaryObjectsImplicitlyUnwrappedOptional <~ validMap["object"]
        
        /// Valid Set
        XCTAssertNotNil(dictionaryObjectsImplicitlyUnwrappedOptional["object"])
        
        /// Empty Set
        guardNegativeException { dictionaryObjectsImplicitlyUnwrappedOptional <~ emptyMap["object"] }

        /// Not Valid Set
        guardNegativeException { dictionaryObjectsImplicitlyUnwrappedOptional <~ notValidMap["object"] }

        /// Not Valid Key
        guardNegativeException { dictionaryObjectsImplicitlyUnwrappedOptional <~ validMap["notValidKey"] }
        
    }
}


fileprivate struct NotValidModel: Mappable, Hashable, Equatable {
    var date: Date = Date(timeIntervalSinceReferenceDate: -123456789.0)
    var x: Int = 1
    var y: Int = 2
    var z: Int = 3
    
    var hashValue: Int {
        return self.x^self.y^self.z
    }
    
    init() {
        
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        date        <~ map["date"]
    }
}

fileprivate func ==(lhs: NotValidModel, rhs: NotValidModel) -> Bool {
    return lhs.date == rhs.date
}


fileprivate struct ValidModel: Mappable, Hashable, Equatable {
    var x: Int = 1
    var y: Int = 2
    var z: Int = 3
    //    var bool: Bool = false
    //    var boolOpt: Bool? = false
    //    var boolImp: Bool! = false
    
    var hashValue: Int {
        return self.x^self.y^self.z
    }
    
    init() {
        
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        x       <~ map["x"]
        y       <~ map["y"]
        z       <~ map["z"]
        //        bool        <~ map["bool"]
        //        boolOpt     <~ map["boolOpt"]
        //        boolImp     <~ map["boolImp"]
    }
}

fileprivate func ==(lhs: ValidModel, rhs: ValidModel) -> Bool {
    return lhs.z == rhs.z
}
