// ----------------------------------------------------------------------------
//
//  OperatorsTests.SetMappable.ImplicitlyUnwrappedOptionalObject.swift
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
    
    func testSetMappableImplicitlyUnwrappedOptionalObjectsToJSON() {
        let validObject = SetValidMappableObjectModel()
        let notValidObject = SetNotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])
        
        let setObjectsImplicitlyUnwrappedOptional: Set<SetValidMappableObjectModel>! = [validObject]
        
        let notValidSet: Set<SetNotValidMappableObjectModel> = [notValidObject]
        let emptySet: Set<SetValidMappableObjectModel> = []
        let nilSet: Set<SetValidMappableObjectModel>? = nil
        
        setObjectsImplicitlyUnwrappedOptional >>> map[CodingKeys.validSetImplicitlyUnwrappedObjects]
        
        
        XCTAssertNotNil(map.JSON[CodingKeys.validSetImplicitlyUnwrappedObjects])
        
        
        guardNegativeException { notValidSet >>> map[CodingKeys.notValidValue] }
        
        emptySet >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])
        
        nilSet >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }
    
    func testSetMappableImplicitlyUnwrappedOptionalObjectsFromJSON() {
        let validJSONString = JSONKeys.forSetMappableImplicitlyUnwrappedOptionalObjects
        let notValidJSONString = JSONKeys.forSetMappableObjectsNotValid
        let emptyJSONString =  JSONKeys.forSetMappableObjectsEmpty
        
        var validObject = SetValidMappableObjectModel()
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)
        
        var setObjectsImplicitlyUnwrappedOptional: Set<SetValidMappableObjectModel>!
        
        setObjectsImplicitlyUnwrappedOptional <~ validMap[CodingKeys.validSetImplicitlyUnwrappedObjects]
        
        /// Valid Set
        XCTAssertNotNil(setObjectsImplicitlyUnwrappedOptional.first)

        /// Empty Set
        guardNegativeException { setObjectsImplicitlyUnwrappedOptional <~ emptyMap[CodingKeys.emptyValue] }
        
        /// Not Valid Set
        guardNegativeException { setObjectsImplicitlyUnwrappedOptional <~ notValidMap[CodingKeys.notValidValue] }
        
        /// Not Valid Key
        guardNegativeException { setObjectsImplicitlyUnwrappedOptional <~ validMap[CodingKeys.noSuchKey] }
        
    }
}

// ----------------------------------------------------------------------------
