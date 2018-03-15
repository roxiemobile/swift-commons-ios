// ----------------------------------------------------------------------------
//
//  EnumOperatorsTests.ArrayOfRawRepresentableTypes.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
//  MARK: - Array of Raw Representable object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testArrayRawRepresentableTypesObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let object: [EnumType] = [EnumType.typeValue]

        // Positive
        object >>> map[JsonKeys.validObject]
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testArrayRawRepresentableTypesObjectFromJSON() {

        let JsonString = Constants.enumArrayOfRawValues
        let JsonStringNotValid = Constants.enumArrayOfInvalidRawValues
        let JsonStringEmpty = Constants.enumEmptyArrayOfRawValues

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [EnumType] = [EnumType.otherTypeValue]

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object.first?.rawValue, "Another")

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
//  MARK: - Optional Array of Raw Representable  object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testArrayRawRepresentableTypesOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        let object: [EnumType]? = [EnumType.typeValue]

        object >>> map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testArrayRawRepresentableTypesOptionalObjectFromJSON() {

        let JsonString = Constants.enumArrayOfRawValues
        let JsonStringNotValid = Constants.enumArrayOfInvalidRawValues
        let JsonStringEmpty = Constants.enumEmptyArrayOfRawValues

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)

        var object: [EnumType]? = nil

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object?.first?.rawValue, "Another")

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
//  MARK: - Implicitly Unwrapped Optional Array of Raw Representable object
// ----------------------------------------------------------------------------

extension EnumOperatorsTests
{
// MARK: - Tests

    func testArrayRawRepresentableTypesImplicitlyUnwrappedOptionalObjectToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])
        var object: [EnumType]! = [EnumType.typeValue]

        object <~ map[JsonKeys.validObject]

        // Positive
        XCTAssertNotNil(map.JSON[JsonKeys.validObject])

        // Negative
        assertExceptionNotNil {
            Constants.invalidDateObject >>> map[JsonKeys.invalidValue]
        }
    }

    func testArrayRawRepresentableTypesImplicitlyUnwrappedOptionalObjectFromJSON() {

        let JsonString = Constants.enumArrayOfRawValues
        let JsonStringNotValid = Constants.enumArrayOfInvalidRawValues
        let JsonStringEmpty = Constants.enumEmptyArrayOfRawValues

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)
        let mapEmpty = Map(mappingType: .fromJSON, JSON: JsonStringEmpty)
        var object: [EnumType]! = [EnumType.otherTypeValue]

        object <~ mapValid[JsonKeys.validObject]

        // Positive
        XCTAssertEqual(object.first?.rawValue, "Another")

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
