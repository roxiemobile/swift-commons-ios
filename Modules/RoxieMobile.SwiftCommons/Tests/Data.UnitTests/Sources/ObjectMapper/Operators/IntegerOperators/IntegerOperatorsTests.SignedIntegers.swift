// ----------------------------------------------------------------------------
//
//  IntegerOperatorsTests.SignedIntegers.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@testable import SwiftCommonsData
import XCTest

// ----------------------------------------------------------------------------
// MARK: - SignedInteger mapping
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
// MARK: - Tests

    func testSignedIntegerMappingFromJSON() {

        let mapValid = Map(mappingType: .fromJSON, JSON: Constants.intValues)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: Constants.invalidIntValues)

        mapNotValid.JSON[JsonKeys.nilValue] = NSNull()

        // --

        let int8Const: Int8 = Int8(Constants.intValues[JsonKeys.int8]!)
        var int8Value: Int8 = 0

        // Positive
        int8Value <~ mapValid[JsonKeys.int8]
        XCTAssertEqual(int8Value, int8Const)

        // Negative
        assertExceptionNotNil {
            int8Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            int8Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            int8Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let int16Const: Int16 = Int16(Constants.intValues[JsonKeys.int16]!)
        var int16Value: Int16 = 0

        // Positive
        int16Value <~ mapValid[JsonKeys.int16]
        XCTAssertEqual(int16Value, int16Const)

        // Negative
        assertExceptionNotNil {
            int16Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            int16Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            int16Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let int32Const: Int32 = Int32(Constants.intValues[JsonKeys.int32]!)
        var int32Value: Int32 = 0

        // Positive
        int32Value <~ mapValid[JsonKeys.int32]
        XCTAssertEqual(int32Value, int32Const)

        // Negative
        assertExceptionNotNil {
            int32Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            int32Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            int32Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let int64Const: Int64 = Int64(Constants.intValues[JsonKeys.int64]!)
        var int64Value: Int64 = 0

        // Positive
        int64Value <~ mapValid[JsonKeys.int64]
        XCTAssertEqual(int64Value, int64Const)

        // Negative
        assertExceptionNotNil {
            int64Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            int64Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            int64Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let intConst: Int = Int(Constants.intValues[JsonKeys.int]!)
        var intValue: Int = 0

        // Positive
        intValue <~ mapValid[JsonKeys.int]
        XCTAssertEqual(intValue, intConst)

        // Negative
        assertExceptionNotNil {
            intValue <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            intValue <~ mapValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            intValue <~ mapNotValid[JsonKeys.nilValue]
        }
    }

    func testSignedIntegerMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var int8Value = Int8.max
        var int16Value = Int16.max
        var int32Value = Int32.max
        var int64Value = Int64.max
        var intValue = Int.max

        // Positive
        int8Value <~ map[JsonKeys.int8]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int8).value)

        int16Value <~ map[JsonKeys.int16]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int16).value)

        int32Value <~ map[JsonKeys.int32]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int32).value)

        int64Value <~ map[JsonKeys.int64]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int64).value)

        intValue <~ map[JsonKeys.int]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int).value)
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional SignedInteger mapping
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
// MARK: - Tests

    func testOptionalSignedIntegerMappingFromJSON() {

        let mapValid = Map(mappingType: .fromJSON, JSON: Constants.intValues)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: Constants.invalidIntValues)

        mapNotValid.JSON[JsonKeys.nilValue] = NSNull()

        // --

        let int8Const: Int8? = Int8(Constants.intValues[JsonKeys.int8]!)
        var int8Value: Int8? = 0

        // Positive
        int8Value <~ mapValid[JsonKeys.int8]
        XCTAssertEqual(int8Value, int8Const)

        int8Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertNil(int8Value)

        int8Value <~ mapNotValid[JsonKeys.nilValue]
        XCTAssertNil(int8Value)

        // Negative
        assertExceptionNotNil {
            int8Value <~ mapNotValid[JsonKeys.invalidValue]
        }

        // --

        let int16Const: Int16? = Int16(Constants.intValues[JsonKeys.int16]!)
        var int16Value: Int16? = 0

        // Positive
        int16Value <~ mapValid[JsonKeys.int16]
        XCTAssertEqual(int16Value, int16Const)

        int16Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertNil(int8Value)

        int16Value <~ mapNotValid[JsonKeys.nilValue]
        XCTAssertNil(int16Value)

        // Negative
        assertExceptionNotNil {
            int16Value <~ mapNotValid[JsonKeys.invalidValue]
        }

        // --

        let int32Const: Int32? = Int32(Constants.intValues[JsonKeys.int32]!)
        var int32Value: Int32? = 0

        // Positive
        int32Value <~ mapValid[JsonKeys.int32]
        XCTAssertEqual(int32Value, int32Const)

        int32Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertNil(int32Value)

        int32Value <~ mapNotValid[JsonKeys.nilValue]
        XCTAssertNil(int32Value)

        // Negative
        assertExceptionNotNil {
            int32Value <~ mapNotValid[JsonKeys.invalidValue]
        }

        // --

        let int64Const: Int64? = Int64(Constants.intValues[JsonKeys.int64]!)
        var int64Value: Int64? = 0

        // Positive
        int64Value <~ mapValid[JsonKeys.int64]
        XCTAssertEqual(int64Value, int64Const)

        int64Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertNil(int64Value)

        int64Value <~ mapNotValid[JsonKeys.nilValue]
        XCTAssertNil(int64Value)

        // Negative
        assertExceptionNotNil {
            int64Value <~ mapNotValid[JsonKeys.invalidValue]
        }

        // --

        let intConst: Int? = Int(Constants.intValues[JsonKeys.int]!)
        var intValue: Int? = 0

        // Positive
        intValue <~ mapValid[JsonKeys.int]
        XCTAssertEqual(intValue, intConst)

        intValue <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertNil(intValue)

        intValue <~ mapNotValid[JsonKeys.nilValue]
        XCTAssertNil(intValue)

        // Negative
        assertExceptionNotNil {
            intValue <~ mapNotValid[JsonKeys.invalidValue]
        }
    }

    func testOptionalSignedIntegerMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var int8Value: Int8? = Int8.max
        var int16Value: Int16? = Int16.max
        var int32Value: Int32? = Int32.max
        var int64Value: Int64? = Int64.max
        var intValue: Int? = Int.max

        // Positive
        int8Value <~ map[JsonKeys.int8]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int8).value)

        int16Value <~ map[JsonKeys.int16]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int16).value)

        int32Value <~ map[JsonKeys.int32]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int32).value)

        int64Value <~ map[JsonKeys.int64]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int64).value)

        intValue <~ map[JsonKeys.int]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int).value)
    }
}

// ----------------------------------------------------------------------------
// MARK: - ImplicitlyUnwrappedOptional SignedInteger mapping
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
// MARK: - Tests

    func testImplicitlyUnwrappedOptionalSignedIntegerMappingFromJSON() {

        let mapValid = Map(mappingType: .fromJSON, JSON: Constants.intValues)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: Constants.invalidIntValues)

        mapNotValid.JSON[JsonKeys.nilValue] = NSNull()

        // --

        let int8Const: Int8! = Int8(Constants.intValues[JsonKeys.int8]!)
        var int8Value: Int8! = 0

        // Positive
        int8Value <~ mapValid[JsonKeys.int8]
        XCTAssertEqual(int8Value, int8Const)

        // Negative
        assertExceptionNotNil {
            int8Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            int8Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            int8Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let int16Const: Int16! = Int16(Constants.intValues[JsonKeys.int16]!)
        var int16Value: Int16! = 0

        // Positive
        int16Value <~ mapValid[JsonKeys.int16]
        XCTAssertEqual(int16Value, int16Const)

        // Negative
        assertExceptionNotNil {
            int16Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            int16Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            int16Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let int32Const: Int32! = Int32(Constants.intValues[JsonKeys.int32]!)
        var int32Value: Int32! = 0

        // Positive
        int32Value <~ mapValid[JsonKeys.int32]
        XCTAssertEqual(int32Value, int32Const)

        // Negative
        assertExceptionNotNil {
            int32Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            int32Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            int32Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let int64Const: Int64! = Int64(Constants.intValues[JsonKeys.int64]!)
        var int64Value: Int64! = 0

        // Positive
        int64Value <~ mapValid[JsonKeys.int64]
        XCTAssertEqual(int64Value, int64Const)

        // Negative
        assertExceptionNotNil {
            int64Value <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            int64Value <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            int64Value <~ mapNotValid[JsonKeys.nilValue]
        }

        // --

        let intConst: Int! = Int(Constants.intValues[JsonKeys.int]!)
        var intValue: Int! = 0

        // Positive
        intValue <~ mapValid[JsonKeys.int]
        XCTAssertEqual(intValue, intConst)

        // Negative
        assertExceptionNotNil {
            intValue <~ mapValid[JsonKeys.noSuchKey]
        }
        assertExceptionNotNil {
            intValue <~ mapNotValid[JsonKeys.invalidValue]
        }
        assertExceptionNotNil {
            intValue <~ mapNotValid[JsonKeys.nilValue]
        }
    }

    func testImplicitlyUnwrappedOptionalSignedIntegerMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var int8Value: Int8! = Int8.max
        var int16Value: Int16! = Int16.max
        var int32Value: Int32! = Int32.max
        var int64Value: Int64! = Int64.max
        var intValue: Int! = Int.max

        // Positive
        int8Value <~ map[JsonKeys.int8]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int8).value)

        int16Value <~ map[JsonKeys.int16]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int16).value)

        int32Value <~ map[JsonKeys.int32]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int32).value)

        int64Value <~ map[JsonKeys.int64]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int64).value)

        intValue <~ map[JsonKeys.int]
        XCTAssertNotNil(map.fetch(valueFor: JsonKeys.int).value)
    }
}

// ----------------------------------------------------------------------------
