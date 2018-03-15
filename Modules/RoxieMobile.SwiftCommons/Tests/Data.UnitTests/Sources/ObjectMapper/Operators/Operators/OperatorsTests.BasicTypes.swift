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

        mapValid.JSON[JsonKeys.nilValue] = nil

        // --

        let boolConst = Bool(Constants.basicTypes[JsonKeys.bool]!)
        var boolValue = false

        // Positive
        boolValue <~ mapValid[JsonKeys.bool]
        XCTAssertEqual(boolValue, boolConst)

        /// Bool Negative results
        assertExceptionNotNil {
            boolValue <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            boolValue <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            boolValue <~ mapValid[JsonKeys.nilValue]
        }
    }

    func testBasicTypeMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let boolValue = true

        // Positive
        boolValue >>> map[JsonKeys.bool]
        XCTAssertNotNil(map.JSON[JsonKeys.bool])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
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

        mapValid.JSON[JsonKeys.nilValue] = nil

        // --

        let boolConst: Bool? = Bool(Constants.basicTypes[JsonKeys.bool]!)
        var boolValue: Bool? = false

        // Positive
        boolValue <~ mapValid[JsonKeys.bool]
        XCTAssertEqual(boolValue, boolConst)

        // Negative
        boolValue <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertNotNil(boolValue)

        boolValue <~ mapValid[JsonKeys.nilValue]
        XCTAssertNotNil(boolValue)

        assertExceptionNotNil {
            boolValue <~ mapNotValid[JsonKeys.invalidValue]
        }
    }

    func testOptionalBasicTypeMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let boolValue: Bool? = true

        // Positive
        boolValue >>> map[JsonKeys.bool]
        XCTAssertNotNil(map.JSON[JsonKeys.bool])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
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

        mapValid.JSON[JsonKeys.nilValue] = nil

        // --

        let boolConst: Bool! = Bool(Constants.basicTypes[JsonKeys.bool]!)
        var boolValue: Bool! = false

        // Positive
        boolValue <~ mapValid[JsonKeys.bool]
        XCTAssertEqual(boolValue, boolConst)

        // Negative
        assertExceptionNotNil {
            boolValue <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            boolValue <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            boolValue <~ mapValid[JsonKeys.nilValue]
        }
    }

    func testImplicitlyUnwrappedOptionalBasicTypeMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        let boolValue: Bool! = true

        // Positive
        boolValue >>> map[JsonKeys.bool]
        XCTAssertNotNil(map.JSON[JsonKeys.bool])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }
}

// ----------------------------------------------------------------------------
