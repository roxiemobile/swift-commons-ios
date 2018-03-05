// ----------------------------------------------------------------------------
//
//  OperatorsTests.BasicTypes.OptionalObject.swift
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
    
    func testOptionalObjectBoolValueToJSON()  {
        
        let JSONString = ["bool" : true]
        let mapFromJSON = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotBool = Map(mappingType: .fromJSON, JSON: ["notBool" : "notBool"])
        mapFromJSON.JSON["noValue"] = nil
        
        /// Bool Positive results
        let bool: Bool? = Bool(JSONString["bool"]!)
        var boolValueFromJSON: Bool? = false
        boolValueFromJSON <~ mapFromJSON["bool"]
        XCTAssertEqual(boolValueFromJSON, bool)
        
        /// Bool Negative results
        boolValueFromJSON <~ mapFromJSON["NoSuchKey"]
        XCTAssertEqual(boolValueFromJSON, nil)
        boolValueFromJSON <~ mapFromJSON["noValue"]
        XCTAssertEqual(boolValueFromJSON, nil)
        guardNegativeException { boolValueFromJSON <~ mapNotBool["notBool"] }
        
    }
    
    func testOptionalObjectBoolValueFromJSON() {
        let mapToJSON = Map(mappingType: .toJSON, JSON: [:])
        
        /// Bool Positive results
        let boolValueToJSON: Bool? = true
        boolValueToJSON >>> mapToJSON["bool"]
        XCTAssertNotNil(mapToJSON.JSON["bool"])
        
        /// Bool Negative results
        let someDateTime: Date? = Date(timeIntervalSinceReferenceDate: -123456789.0)
        guardNegativeException { someDateTime >>> mapToJSON["notBoolValue"] }
    }
    
}

// ----------------------------------------------------------------------------
