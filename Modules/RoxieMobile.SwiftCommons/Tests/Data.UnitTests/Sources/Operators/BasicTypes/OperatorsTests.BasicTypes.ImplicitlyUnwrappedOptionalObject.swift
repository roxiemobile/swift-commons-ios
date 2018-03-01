//
//  BasicTypesTests.ImplicitlyUnwrappedOptionalObject.swift
//  SwiftCommons.Data.UnitTests
//
//  Created by Мамунина Наталья Вадимовна on 3/1/18.
//  Copyright © 2018 Alexander Bragin. All rights reserved.
//

@testable import SwiftCommonsData
import XCTest

extension OperatorsTests
{
    
    func testImplicityUnwrappedOptionalObjectBoolValueToJSON()  {
        
        let JSONString = ["bool" : true]
        let mapFromJSON = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotBool = Map(mappingType: .fromJSON, JSON: ["notBool" : "notBool"])
        mapFromJSON.JSON["noValue"] = nil
        
        /// Bool Positive results
        let bool: Bool! = Bool(JSONString["bool"]!)
        var boolValueFromJSON: Bool! = false
        boolValueFromJSON <~ mapFromJSON["bool"]
        XCTAssertEqual(boolValueFromJSON, bool)
        
        /// Bool Negative results
        guardNegativeException { boolValueFromJSON <~ mapNotBool["notBool"] }
        guardNegativeException { boolValueFromJSON <~ mapFromJSON["NoSuchKey"] }
        guardNegativeException { boolValueFromJSON <~ mapFromJSON["noValue"] }
        
    }
    
    func testImplicityUnwrappedOptionalObjectBoolValueFromJSON() {
        let mapToJSON = Map(mappingType: .toJSON, JSON: [:])
        
        /// Bool Positive results
        let boolValueToJSON: Bool! = true
        boolValueToJSON >>> mapToJSON["bool"]
        XCTAssertNotNil(mapToJSON.JSON["bool"])
        
        /// Bool Negative results
        let someDateTime: Date! = Date(timeIntervalSinceReferenceDate: -123456789.0)
        guardNegativeException { someDateTime >>> mapToJSON["notBoolValue"] }
    }
    
}
