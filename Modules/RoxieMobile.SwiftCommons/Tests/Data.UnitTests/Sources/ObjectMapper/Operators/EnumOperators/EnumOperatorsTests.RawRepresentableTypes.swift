// ----------------------------------------------------------------------------
//
//  EnumOperatorsTests.RawRepresentableTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
//  MARK: - Object of Raw Representable type
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testRawRepresentableTypesObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let object: EnumType = EnumType.typeValue

        object >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testRawRepresentableTypesObjectFromJSON() {

        let JSONString = Constants.enumRawValues
        let JSONStringNotValid = Constants.enumInvalidRawValues
        let JSONStringEmpty = Constants.enumEmptyRawValues

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var object: EnumType = EnumType.otherTypeValue

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object.rawValue, "Another")

        // Negative
        assertExceptionNotNil {
            object <~ mapNotValid[JsonKeys.validObject]
        }
        assertExceptionNotNil {
            object <~ mapValid[JsonKeys.noSuchKey]
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        assertExceptionNotNil {
            object <~ mapValid[JsonKeys.nilValue]
        }
        assertExceptionNotNil {
            object <~ mapEmpty[JsonKeys.validObject]
        }
    }
}

// ----------------------------------------------------------------------------
//  MARK: - Optional Object of Raw Representable type
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testRawRepresentableTypesOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let object: EnumType? = EnumType.typeValue

        object >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testRawRepresentableTypesOptionalObjectFromJSON() {

        let JSONString = Constants.enumRawValues
        let JSONStringNotValid = Constants.enumInvalidRawValues
        let JSONStringEmpty = Constants.enumEmptyRawValues

        let mapValid = Map(mappingType: .fromJSON, JSON: JSONString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JSONStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JSONStringEmpty)

        var object: EnumType? = EnumType.otherTypeValue

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object?.rawValue, "Another")

        // Negative
        assertExceptionNotNil {
            object <~ mapNotValid[JsonKeys.validObject]
        }

        object <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertNil(object)

        mapValid.JSON[JsonKeys.nilValue] = nil
        object <~ mapValid[JsonKeys.nilValue]
        XCTAssertNil(object)

        object <~ mapEmpty[JsonKeys.validObject]
        XCTAssertNil(object)
    }
}

// ----------------------------------------------------------------------------
//  MARK: - Implicitly Unwrapped Optional Object of Raw Representable type
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testRawRepresentableTypesImplicitlyUnwrappedOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        var object: EnumType! = EnumType.typeValue

        object <~ map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testRawRepresentableTypesImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = Constants.enumRawValues
        let JsonStringNotValid = Constants.enumInvalidRawValues
        let JsonStringEmpty = Constants.enumEmptyRawValues

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)
        var object: EnumType! = EnumType.otherTypeValue

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object.rawValue, "Another")

        // Negative
        assertExceptionNotNil {
            object <~ mapNotValid[JsonKeys.validObject]
        }
        assertExceptionNotNil {
            object <~ mapValid[JsonKeys.noSuchKey]
        }

        mapValid.JSON[JsonKeys.nilValue] = nil
        assertExceptionNotNil {
            object <~ mapValid[JsonKeys.nilValue]
        }
        assertExceptionNotNil {
            object <~ mapEmpty[JsonKeys.validObject]
        }
    }
}

// ----------------------------------------------------------------------------
