// ----------------------------------------------------------------------------
//
//  OperatorsTests.SetMappable.OptionalObject.swift
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
    
    func testSetMappableOptionalObjectsToJSON() {
        let validObject = SetValidMappableObjectModel()
        let notValidObject = SetNotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        let setObjectsOptional: Set<SetValidMappableObjectModel>? = [validObject]
        
        let notValidSet: Set<SetNotValidMappableObjectModel> = [notValidObject]
        let emptySet: Set<SetValidMappableObjectModel> = []
        let nilSet: Set<SetValidMappableObjectModel>? = nil
        
        setObjectsOptional >>> map[CodingKeys.validSetOptionalObjects]
        
        
        XCTAssertNotNil(map.JSON[CodingKeys.validSetOptionalObjects])
        
        
        guardNegativeException { notValidSet >>> map[CodingKeys.notValidValue] }
        
        emptySet >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])
        
        nilSet >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }
    
    func testSetMappableOptionalObjectsFromJSON() {
        let validJSONString = JSONKeys.forSetMappableOptionalObjects
        let notValidJSONString = JSONKeys.forSetMappableObjectsNotValid
        let emptyJSONString =  JSONKeys.forSetMappableObjectsEmpty
        
        var validObject = SetValidMappableObjectModel()
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var setObjectsOptional: Set<SetValidMappableObjectModel>? = []
        
        setObjectsOptional <~ validMap[CodingKeys.validSetOptionalObjects]
        
        /// Valid Set
        XCTAssertNotNil(setObjectsOptional?.first)
        
        /// Empty Set
        guardNegativeException { setObjectsOptional <~ emptyMap[CodingKeys.emptyValue] }
        
        /// Not Valid Set
        guardNegativeException { setObjectsOptional <~ notValidMap[CodingKeys.notValidValue] }
        
        /// Not Valid Key
        guardNegativeException { setObjectsOptional <~ validMap[CodingKeys.noSuchKey] }
        
    }
}

// ----------------------------------------------------------------------------
