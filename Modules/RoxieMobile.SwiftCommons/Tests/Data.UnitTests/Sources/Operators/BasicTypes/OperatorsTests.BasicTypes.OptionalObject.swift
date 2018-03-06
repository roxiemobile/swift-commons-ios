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
        
        let JSONString = [CodingKeys.bool : Constants.boolTrue]
        let mapFromJSON = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotBool = Map(mappingType: .fromJSON, JSON: [CodingKeys.notValidValue : Constants.notValidValue])
        mapFromJSON.JSON[CodingKeys.nilValue] = nil
        
        /// Bool Positive results
        let bool: Bool? = Bool(JSONString[CodingKeys.bool]!)
        var boolValueFromJSON: Bool? = Constants.boolFalse
        boolValueFromJSON <~ mapFromJSON[CodingKeys.bool]
        XCTAssertEqual(boolValueFromJSON, bool)
        
        /// Bool Negative results
        boolValueFromJSON <~ mapFromJSON[CodingKeys.noSuchKey]
        XCTAssertEqual(boolValueFromJSON, nil)
        boolValueFromJSON <~ mapFromJSON[CodingKeys.nilValue]
        XCTAssertEqual(boolValueFromJSON, nil)
        guardNegativeException { boolValueFromJSON <~ mapNotBool[CodingKeys.notValidValue] }
        
    }
    
    func testOptionalObjectBoolValueFromJSON() {
        let mapToJSON = Map(mappingType: .toJSON, JSON: [:])
        
        /// Bool Positive results
        let boolValueToJSON: Bool? = Constants.boolTrue
        boolValueToJSON >>> mapToJSON[CodingKeys.bool]
        XCTAssertNotNil(mapToJSON.JSON[CodingKeys.bool])
        
        /// Bool Negative results
        guardNegativeException { Constants.dateValue >>> mapToJSON[CodingKeys.notValidValue] }
    }
    
}

// ----------------------------------------------------------------------------
