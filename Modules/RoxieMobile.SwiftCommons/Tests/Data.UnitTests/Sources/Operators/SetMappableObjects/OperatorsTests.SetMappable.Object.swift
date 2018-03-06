// ----------------------------------------------------------------------------
//
//  OperatorsTests.SetMappable.Object.swift
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
    
    func testSetMappableObjectsToJSON() {
        let validObject = SetValidMappableObjectModel()
        let notValidObject = SetNotValidMappableObjectModel()
        let map = Map(mappingType: .toJSON, JSON: [:])

        let setObjects: Set<SetValidMappableObjectModel> = [validObject]
        
        let notValidSet: Set<SetNotValidMappableObjectModel> = [notValidObject]
        let emptySet: Set<SetValidMappableObjectModel> = []
        let nilSet: Set<SetValidMappableObjectModel>? = nil

        setObjects >>> map[CodingKeys.validSetObjects]

        XCTAssertNotNil(map.JSON[CodingKeys.validSetObjects])

        guardNegativeException { notValidSet >>> map[CodingKeys.notValidValue] }

        emptySet >>> map[CodingKeys.emptyValue]
        XCTAssertNotNil(map.JSON[CodingKeys.emptyValue])

        nilSet >>> map[CodingKeys.nilValue]
        XCTAssertNil(map.JSON[CodingKeys.nilValue])
    }
    
    func testSetMappableObjectsFromJSON() {
        let validJSONString = [
            CodingKeys.validSetObjects : [
                [CodingKeys.x : Constants.intMax,
                 CodingKeys.y : Constants.intMax,
                 CodingKeys.z : Constants.intMax]
            ]
        ]
        let notValidJSONString = [
            CodingKeys.notValidValue : [
                [CodingKeys.x : Constants.notValidValue,
                 CodingKeys.y : Constants.notValidValue,
                 CodingKeys.z : Constants.notValidValue]
            ]
        ]
        let emptyJSONString =  [
            CodingKeys.emptyValue : [[:]]
        ]

        var validObject = SetValidMappableObjectModel()
        let validMap = Map(mappingType: .fromJSON, JSON: validJSONString)
        let notValidMap = Map(mappingType: .fromJSON, JSON: notValidJSONString)
        let emptyMap = Map(mappingType: .fromJSON, JSON: emptyJSONString)

        var setObjects: Set<SetValidMappableObjectModel> = []

        setObjects <~ validMap[CodingKeys.validSetObjects]

        /// Valid Set
        XCTAssertNotNil(setObjects.first)
        
        /// Empty Set
        guardNegativeException { setObjects <~ emptyMap[CodingKeys.emptyValue] }

        /// Not Valid Set
        guardNegativeException { setObjects <~ notValidMap[CodingKeys.notValidValue] }

        /// Not Valid Key
        guardNegativeException { setObjects <~ validMap[CodingKeys.noSuchKey] }

    }
}

// ----------------------------------------------------------------------------
