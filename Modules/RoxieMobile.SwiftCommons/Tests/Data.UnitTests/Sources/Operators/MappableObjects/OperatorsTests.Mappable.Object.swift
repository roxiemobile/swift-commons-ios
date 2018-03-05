// ----------------------------------------------------------------------------
//
//  OperatorsTests.Mappable.Object.swift
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
    
    func testObjectMappableToJSON() {
        let JSONString = ["bool" : true,
                          "boolOpt" : true,
                          "boolImp" : true]
                            
        
        var object: SomeBoolObject = Mapper<SomeBoolObject>().map(JSON: JSONString)!
        var map = Map(mappingType: .toJSON, JSON: [:])
        object >>> map["object"]
        let someDictionary = map.JSON["object"]! as! [String : Bool]
        let bool = someDictionary["bool"]!
        
        /// Positive results
        XCTAssertEqual(object.bool, bool)
        
        /// Negative results
        let someDateTime = SomeDateObject(map: map)
        guardNegativeException { someDateTime >>> map ["some"] }
    }
    
    func testObjectMappableFromJSON() {
        let JSONString = [
            "object": [
                "bool" : true,
               "boolOpt" : true,
               "boolImp" : true
            ]
        ]
        let notBoolValueJson = ["object": ["bool": "notBoolValue"]]
        let mapSet = Map(mappingType: .fromJSON, JSON: [:])
        let map = Map(mappingType: .fromJSON, JSON: JSONString)
        map.JSON["noValue"] = nil
        let mapNotBoolValue = Map(mappingType: .toJSON, JSON: notBoolValueJson)
        var object: SomeBoolObject = SomeBoolObject(map: mapSet)!
        object <~ map["object"]
        print(object.bool)
        
        /// Positive results
        XCTAssertTrue(object.bool)
        
        /// Negative results
        object <~ mapNotBoolValue["object"]
        print(object.bool)
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
        boolImp <~ map["boolImp"]
    }
}

// ----------------------------------------------------------------------------
