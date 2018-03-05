// ----------------------------------------------------------------------------
//
//  OperatorsTests.BasicTypes.Object.swift
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

    func testObjectBoolValueToJSON()  {

        let JSONString = ["bool" : true]
        let mapFromJSON = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotBool = Map(mappingType: .fromJSON, JSON: ["notBool" : "notBool"])
        mapFromJSON.JSON["noValue"] = nil
        
        /// Bool Positive results
        let bool: Bool = Bool(JSONString["bool"]!)
        var boolValueFromJSON: Bool = false
        boolValueFromJSON <~ mapFromJSON["bool"]
        XCTAssertEqual(boolValueFromJSON, bool)
        
        /// Bool Negative results
        guardNegativeException { boolValueFromJSON <~ mapNotBool["notBool"] }
        guardNegativeException { boolValueFromJSON <~ mapFromJSON["NoSuchKey"] }
        guardNegativeException { boolValueFromJSON <~ mapFromJSON["noValue"] }
        
    }
    
    func testObjectBoolValueFromJSON() {
        let mapToJSON = Map(mappingType: .toJSON, JSON: [:])
        
        /// Bool Positive results
        let boolValueToJSON: Bool = true
        boolValueToJSON >>> mapToJSON["bool"]
        XCTAssertNotNil(mapToJSON.JSON["bool"])
        
        /// Bool Negative results
        let someDateTime: Date = Date(timeIntervalSinceReferenceDate: -123456789.0)
        guardNegativeException { someDateTime >>> mapToJSON["notBoolValue"] }
    }
    
}

// ----------------------------------------------------------------------------
