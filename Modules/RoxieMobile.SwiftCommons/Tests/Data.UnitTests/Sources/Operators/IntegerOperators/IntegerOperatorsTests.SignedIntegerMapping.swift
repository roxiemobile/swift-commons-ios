// ----------------------------------------------------------------------------
//
//  IntegerOperatorsTests.SignedIntegerMapping.swift
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

        let JsonString = JsonKeys.intValues
        let JsonStringNotValid = JsonKeys.intValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        mapValid.JSON[CodingKeys.nilValue] = nil

        // --

        let value8: Int8 = Int8(JsonString[CodingKeys.int8]!)
        var int8Value: Int8 = 0

        int8Value <~ mapValid[CodingKeys.int8]

        // Positive
        XCTAssertEqual(int8Value, value8)

        // Negative
        guardNegativeException {
            int8Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            int8Value <~ mapValid[CodingKeys.noSuchKey]
        }

        guardNegativeException {
            int8Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let value16: Int16 = Int16(JsonString[CodingKeys.int16]!)
        var int16Value: Int16 = 0

        int16Value <~ mapValid[CodingKeys.int16]

        // Positive
        XCTAssertEqual(int16Value, value16)

        // Negative
        guardNegativeException {
            int16Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            int16Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            int16Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let value32: Int32 = Int32(JsonString[CodingKeys.int32]!)
        var int32Value: Int32 = 0

        int32Value <~ mapValid[CodingKeys.int32]

        // Positive
        XCTAssertEqual(int32Value, value32)

        // Negative
        guardNegativeException {
            int32Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            int32Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            int32Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let value64: Int64 = Int64(JsonString[CodingKeys.int64]!)
        var int64Value: Int64 = 0

        int64Value <~ mapValid[CodingKeys.int64]

        // Positive
        XCTAssertEqual(int64Value, value64)

        // Negative
        guardNegativeException {
            int64Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            int64Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            int64Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let value: Int = Int(JsonString[CodingKeys.int]!)
        var intValue: Int = 0

        intValue <~ mapValid[CodingKeys.int]

        // Positive
        XCTAssertEqual(intValue, value)

        // Negative
        guardNegativeException {
            intValue <~ mapValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            intValue <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            intValue <~ mapValid[CodingKeys.nilValue]
        }
    }

    func testSignetIntegerMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var intValue = Int(Constants.minInt)
        var int8Value = Int8(Constants.minInt)
        var int16Value = Int16(Constants.maxInt)
        var int32Value = Int32(Constants.minInt)
        var int64Value = Int64(Constants.maxInt)

        // Positive
        int8Value <~ map[CodingKeys.int8]
        XCTAssertNotNil(map.JSON[CodingKeys.int8])

        int16Value <~ map[CodingKeys.int16]
        XCTAssertNotNil(map.JSON[CodingKeys.int16])

        int32Value <~ map[CodingKeys.int32]
        XCTAssertNotNil(map.JSON[CodingKeys.int32])

        int64Value <~ map[CodingKeys.int64]
        XCTAssertNotNil(map.JSON[CodingKeys.int64])

        intValue <~ map[CodingKeys.int]
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        // Negative
        guardNegativeException {
            Constants.dateValue <~ map[CodingKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - Optional SignedInteger mapping
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
// MARK: - Tests

    func testOptionalSignedIntegerMappingFromJSON() {

        let JsonString = JsonKeys.intValues
        let JsonStringNotValid = JsonKeys.intValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        mapValid.JSON[CodingKeys.nilValue] = nil

        // --

        let value8: Int8? = Int8(JsonString[CodingKeys.int8]!)
        var int8Value: Int8? = 0

        int8Value <~ mapValid[CodingKeys.int8]

        // Positive
        XCTAssertEqual(int8Value, value8)

        // Negative
        int8Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(int8Value, nil)

        int8Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(int8Value, nil)

        guardNegativeException {
            int8Value <~ mapNotValid[CodingKeys.notValidValue]
        }

        // --

        let value16: Int16? = Int16(JsonString[CodingKeys.int16]!)
        var int16Value: Int16? = 0

        int16Value <~ mapValid[CodingKeys.int16]

        // Positive
        XCTAssertEqual(int16Value, value16)

        // Negative
        int16Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(int8Value, nil)

        int16Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(int16Value, nil)

        guardNegativeException {
            int16Value <~ mapNotValid[CodingKeys.notValidValue]
        }

        // --

        let value32: Int32? = Int32(JsonString[CodingKeys.int32]!)
        var int32Value: Int32? = 0

        int32Value <~ mapValid[CodingKeys.int32]

        // Positive
        XCTAssertEqual(int32Value, value32)

        // Negative
        int32Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(int32Value, nil)

        int32Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(int32Value, nil)

        guardNegativeException {
            int32Value <~ mapNotValid[CodingKeys.notValidValue]
        }

        // --

        let value64: Int64? = Int64(JsonString[CodingKeys.int64]!)
        var int64Value: Int64? = 0

        int64Value <~ mapValid[CodingKeys.int64]

        // Positive
        XCTAssertEqual(int64Value, value64)

        // Negative
        int64Value <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(int64Value, nil)

        int64Value <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(int64Value, nil)

        guardNegativeException {
            int64Value <~ mapNotValid[CodingKeys.notValidValue]
        }

        // --

        let value: Int? = Int(JsonString[CodingKeys.int]!)
        var intValue: Int? = 0

        intValue <~ mapValid[CodingKeys.int]

        // Positive
        XCTAssertEqual(intValue, value)

        // Negative
        intValue <~ mapValid[CodingKeys.noSuchKey]
        XCTAssertEqual(intValue, nil)

        intValue <~ mapValid[CodingKeys.nilValue]
        XCTAssertEqual(intValue, nil)

        guardNegativeException {
            intValue <~ mapNotValid[CodingKeys.notValidValue]
        }
    }

    func testOptionalSignetIntegerMappingToJSON() {

        var map = Map(mappingType: .toJSON, JSON: [:])

        var int8Value: Int8? = Int8(Constants.maxInt)
        var int16Value: Int16? = Int16(Constants.minInt)
        var int32Value: Int32? = Int32(Constants.maxInt)
        var int64Value: Int64? = Int64(Constants.minInt)
        var intValue: Int? = Int(Constants.maxInt)

        // Positive
        int8Value <~ map[CodingKeys.int8]
        XCTAssertNotNil(map.JSON[CodingKeys.int8])

        int16Value <~ map[CodingKeys.int16]
        XCTAssertNotNil(map.JSON[CodingKeys.int16])

        int32Value <~ map[CodingKeys.int32]
        XCTAssertNotNil(map.JSON[CodingKeys.int32])

        int64Value <~ map[CodingKeys.int64]
        XCTAssertNotNil(map.JSON[CodingKeys.int64])

        intValue <~ map[CodingKeys.int]
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        // Negative
        guardNegativeException {
            Constants.dateValue <~ map[CodingKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
// MARK: - ImplicitlyUnwrappedOptional SignedInteger mapping
// ----------------------------------------------------------------------------

extension IntegerOperatorsTests
{
// MARK: - Tests

    func testImplicityUnwrappedOptionalSignedIntegerMappingFromJSON() {

        let JsonString = JsonKeys.intValues
        let JsonStringNotValid = JsonKeys.intValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        mapValid.JSON[CodingKeys.nilValue] = nil

        // --

        let value8: Int8! = Int8(JsonString[CodingKeys.int8]!)
        var int8Value: Int8! = 0

        int8Value <~ mapValid[CodingKeys.int8]

        // Positive
        XCTAssertEqual(int8Value, value8)

        // Negative
        guardNegativeException {
            int8Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            int8Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            int8Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let value16: Int16! = Int16(JsonString[CodingKeys.int16]!)
        var int16Value: Int16! = 0

        int16Value <~ mapValid[CodingKeys.int16]

        // Positive
        XCTAssertEqual(int16Value, value16)

        // Negative
        guardNegativeException {
            int16Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            int16Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            int16Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let value32: Int32! = Int32(JsonString[CodingKeys.int32]!)
        var int32Value: Int32! = 0

        int32Value <~ mapValid[CodingKeys.int32]

        // Positive
        XCTAssertEqual(int32Value, value32)

        // Negative
        guardNegativeException {
            int32Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            int32Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            int32Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let value64: Int64! = Int64(JsonString[CodingKeys.int64]!)
        var int64Value: Int64! = 0

        int64Value <~ mapValid[CodingKeys.int64]

        // Positive
        XCTAssertEqual(int64Value, value64)

        // Negative
        guardNegativeException {
            int64Value <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            int64Value <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            int64Value <~ mapValid[CodingKeys.nilValue]
        }

        // --

        let value: Int! = Int(JsonString[CodingKeys.int]!)
        var intValue: Int! = 0

        intValue <~ mapValid[CodingKeys.int]

        // Positive
        XCTAssertEqual(intValue, value)

        // Negative
        guardNegativeException {
            intValue <~ mapNotValid[CodingKeys.notValidValue]
        }
        guardNegativeException {
            intValue <~ mapValid[CodingKeys.noSuchKey]
        }
        guardNegativeException {
            intValue <~ mapValid[CodingKeys.nilValue]
        }
    }

    func testImplicityUnwrappedOptionalSignedIntegerMappingToJSON() {

        let map = Map(mappingType: .toJSON, JSON: [:])

        var int8Value: Int8! = Int8(Constants.minInt)
        var int16Value: Int16! = Int16(Constants.maxInt)
        var int32Value: Int32! = Int32(Constants.minInt)
        var int64Value: Int64! = Int64(Constants.maxInt)
        var intValue: Int! = Int(Constants.minInt)

        // Positive
        int8Value <~ map[CodingKeys.int8]
        XCTAssertNotNil(map.JSON[CodingKeys.int8])

        int16Value <~ map[CodingKeys.int16]
        XCTAssertNotNil(map.JSON[CodingKeys.int16])

        int32Value <~ map[CodingKeys.int32]
        XCTAssertNotNil(map.JSON[CodingKeys.int32])

        int64Value <~ map[CodingKeys.int64]
        XCTAssertNotNil(map.JSON[CodingKeys.int64])

        intValue <~ map[CodingKeys.int]
        XCTAssertNotNil(map.JSON[CodingKeys.int])

        // Negative
        guardNegativeException {
            Constants.dateValue <~ map[CodingKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
