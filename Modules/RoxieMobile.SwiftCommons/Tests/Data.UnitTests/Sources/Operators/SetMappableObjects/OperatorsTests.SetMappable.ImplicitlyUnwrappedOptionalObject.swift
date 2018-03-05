//
//  OperatorsTests.SetMappable.ImplicitlyUnwrappedOptionalObject.swift
//  SwiftCommons.Data.UnitTests
//
//  Created by Мамунина Наталья Вадимовна on 3/5/18.
//  Copyright © 2018 Alexander Bragin. All rights reserved.
//

@testable import SwiftCommonsData
import XCTest

extension OperatorsTests
{
    
    func testSetMappableImplicitlyUnwrappedOptionalObjectsToJSON() {
        let validObject = ValidModel()
        let notValidObject = NotValidModel()
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        let setObjects: Set<ValidModel> = [validObject]
        let setObjectsOptional: Set<ValidModel>? = [validObject]
        let setObjectsImplicitlyUnwrappedOptional: Set<ValidModel>! = [validObject]
        
        let notValidSet: Set<NotValidModel> = [notValidObject]
        let emptySet: Set<ValidModel> = []
        let nilSet: Set<ValidModel>? = nil
        
        setObjects >>> map["validSetObjects"]
        setObjectsOptional >>> map["validSetOptionalObjects"]
        setObjectsImplicitlyUnwrappedOptional >>> map["validImplicitlyUnwrappedObjects"]
        
        
        XCTAssertNotNil(map.JSON["validSetObjects"])
        XCTAssertNotNil(map.JSON["validSetOptionalObjects"])
        XCTAssertNotNil(map.JSON["validImplicitlyUnwrappedObjects"])
        
        
        guardNegativeException { notValidSet >>> map["notValidSet"] }
        
        emptySet >>> map["emptySet"]
        XCTAssertNotNil(map.JSON["emptySet"])
        
        nilSet >>> map["nilValidSet"]
        XCTAssertNil(map.JSON["nilSet"])
    }
    
    func testSetMappableImplicitlyUnwrappedOptionalObjectsFromJSON() {
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
        
        var validObject = ValidModel()
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var setObjectsImplicitlyUnwrappedOptional: Set<ValidModel>!
        
        setObjectsImplicitlyUnwrappedOptional <~ validMap["object"]
        
        /// Valid Set
        XCTAssertNotNil(setObjectsImplicitlyUnwrappedOptional.first)

        /// Empty Set
        guardNegativeException { setObjectsImplicitlyUnwrappedOptional <~ emptyMap["object"] }
        
        /// Not Valid Set
        guardNegativeException { setObjectsImplicitlyUnwrappedOptional <~ notValidMap["object"] }
        
        /// Not Valid Key
        guardNegativeException { setObjectsImplicitlyUnwrappedOptional <~ validMap["notValidKey"] }
        
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
