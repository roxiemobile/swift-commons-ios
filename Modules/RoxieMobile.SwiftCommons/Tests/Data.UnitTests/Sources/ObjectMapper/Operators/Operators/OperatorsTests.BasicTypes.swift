// ----------------------------------------------------------------------------
//
//  OperatorsTests.BasicTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - Object of Basic type
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testBasicTypeMappingFromJSON() {

        let mapValid = Map(mappingType: .fromJSON, JSON: Constants.basicTypes)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: Constants.invalidBasicTypes)

        mapNotValid.JSON[JsonKeys.nilValue] = NSNull()

        let boolConst = Bool(Constants.basicTypes[JsonKeys.bool]!)
        var boolValue = false

        // Positive
        boolValue <~ mapValid[JsonKeys.bool]
        XCTAssertEqual(boolValue, boolConst)

        // Negative
        assertExceptionNotNil {
            boolValue <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            boolValue <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            boolValue <~ mapNotValid[JsonKeys.nilValue]
        }
    }

    func testBasicTypeMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let boolValue = true
        let invalidValue = Constants.invalidDateObject

        // Positive
        boolValue >>> map[JsonKeys.bool]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.bool).value)

        // Negative
        assertExceptionNotNil {
            invalidValue >>> map[JsonKeys.invalidValue]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional object of basic type
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testOptionalBasicTypeMappingFromJSON() {

        let mapValid = Map(mappingType: .fromJSON, JSON: Constants.basicTypes)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: Constants.invalidBasicTypes)

        mapNotValid.JSON[JsonKeys.nilValue] = NSNull()

        let boolConst: Bool? = Bool(Constants.basicTypes[JsonKeys.bool]!)
        var boolValue: Bool? = false

        // Positive
        boolValue <~ mapValid[JsonKeys.bool]
        XCTAssertEqual(boolValue, boolConst)

        boolValue <~ mapNotValid[JsonKeys.noSuchKey]
        XCTAssertNil(boolValue)

        boolValue <~ mapNotValid[JsonKeys.nilValue]
        XCTAssertNil(boolValue)

        // Negative
        assertExceptionNotNil {
            boolValue <~ mapNotValid[JsonKeys.invalidValue]
        }
    }

    func testOptionalBasicTypeMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let boolValue: Bool? = true
        let invalidValue: Date? = Constants.invalidDateObject

        // Positive
        boolValue >>> map[JsonKeys.bool]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.bool).value)

        // Negative
        assertExceptionNotNil {
            invalidValue >>> map[JsonKeys.invalidValue]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Implicitly unwrapped optional object of basic type
// ----------------------------------------------------------------------------

extension OperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalBasicTypeMappingFromJSON() {

        let mapValid = Map(mappingType: .fromJSON, JSON: Constants.basicTypes)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: Constants.invalidBasicTypes)

        mapNotValid.JSON[JsonKeys.nilValue] = NSNull()

        let boolConst: Bool! = Bool(Constants.basicTypes[JsonKeys.bool]!)
        var boolValue: Bool! = false

        // Positive
        boolValue <~ mapValid[JsonKeys.bool]
        XCTAssertEqual(boolValue, boolConst)

        // Negative
        assertExceptionNotNil {
            boolValue <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            boolValue <~ mapNotValid[JsonKeys.nilValue]
        }
        assertExceptionNotNil {
            boolValue <~ mapNotValid[JsonKeys.invalidValue]
        }
    }

    func testImplicitlyUnwrappedOptionalBasicTypeMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var boolValue: Bool! = true
        var invalidValue: Date! = Constants.invalidDateObject

        // Positive
        boolValue <~ map[JsonKeys.bool]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.bool).value)

        // Negative
        assertExceptionNotNil {
            invalidValue <~ map[JsonKeys.invalidValue]
        }
    }
}

// ----------------------------------------------------------------------------
