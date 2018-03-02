//
//  OperatorsTests.Mappable.ImplicitlyUnwrappedOptionalObject.swift
//  SwiftCommons.Data.UnitTests
//
//  Created by Мамунина Наталья Вадимовна on 3/1/18.
//  Copyright © 2018 Alexander Bragin. All rights reserved.
//

@testable import SwiftCommonsData
import XCTest

extension OperatorsTests
{

    
//    func testObjectImplicitlyUnwrappedOptionalMappableToJSON() {
//        let JSONString = ["bool" : true,
//                          "boolOpt" : true,
//                          "boolImp" : true]
//
//
//        var object: SomeBoolObject! = Mapper<SomeBoolObject>().map(JSON: JSONString)!
//        print(object.bool)
//        var map = Map(mappingType: .toJSON, JSON: [:])
//        object >>> map["object"]
//        let someDictionary = map.JSON["object"]! as! [String : Bool]
//        let bool = someDictionary["bool"]!
//
//        XCTAssertEqual(object.bool, bool)
//    }
    
    func testObjectImplicitlyUnwrappedOptionalMappableFromJSON() {
        let JSONString = ["object": ["bool" : true,
                                     "boolOpt" : true,
                                     "boolImp" : true]
        ]
        let notBoolValueJson = ["object": ["bool": "notBoolValue"]]
        let mapSet = Map(mappingType: .fromJSON, JSON: [:])
        let map = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotBoolValue = Map(mappingType: .toJSON, JSON: notBoolValueJson)
        map.JSON["noValue"] = nil
        var object: SomeBoolObject! = SomeBoolObject(map: mapSet)!
        object <~ map["object"]
        print(object.bool)
        XCTAssertTrue(object.bool)
        
        /// Positive results
        XCTAssertTrue(object.bool)
        
        /// Negative results
        object <~ mapNotBoolValue["object"]
        XCTAssertTrue(object.bool)
        guardNegativeException { object <~ map["noSuchKey"] }
        guardNegativeException { object <~ map["noValue"]}
    }
    
    
}

fileprivate class SomeDateObject: Mappable {
    var date: Date = Date(timeIntervalSinceReferenceDate: -123456789.0)
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        date        <~ map["date"]
    }
}

fileprivate class SomeBoolObject: Mappable {
    var bool: Bool = false
    var boolOpt: Bool? = false
    var boolImp: Bool! = false
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        bool        <~ map["bool"]
        boolOpt     <~ map["boolOpt"]
        boolImp     <~ map["boolImp"]
    }
}
