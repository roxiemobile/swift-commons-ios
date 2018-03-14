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

        let JsonString = Constants.intValues
        let JsonStringNotValid = Constants.intValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        mapValid.JSON[JsonKeys.nilValue] = nil

        // --

        let value8: Int8 = Int8(JsonString[JsonKeys.int8]!)
        var int8Value: Int8 = 0

        int8Value <~ mapValid[JsonKeys.int8]

        // Positive
        XCTAssertEqual(int8Value, value8)

        // Negative
        guardNegativeException {
            int8Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            int8Value <~ mapValid[JsonKeys.noSuchKey]
        }

        guardNegativeException {
            int8Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let value16: Int16 = Int16(JsonString[JsonKeys.int16]!)
        var int16Value: Int16 = 0

        int16Value <~ mapValid[JsonKeys.int16]

        // Positive
        XCTAssertEqual(int16Value, value16)

        // Negative
        guardNegativeException {
            int16Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            int16Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            int16Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let value32: Int32 = Int32(JsonString[JsonKeys.int32]!)
        var int32Value: Int32 = 0

        int32Value <~ mapValid[JsonKeys.int32]

        // Positive
        XCTAssertEqual(int32Value, value32)

        // Negative
        guardNegativeException {
            int32Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            int32Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            int32Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let value64: Int64 = Int64(JsonString[JsonKeys.int64]!)
        var int64Value: Int64 = 0

        int64Value <~ mapValid[JsonKeys.int64]

        // Positive
        XCTAssertEqual(int64Value, value64)

        // Negative
        guardNegativeException {
            int64Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            int64Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            int64Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let value: Int = Int(JsonString[JsonKeys.int]!)
        var intValue: Int = 0

        intValue <~ mapValid[JsonKeys.int]

        // Positive
        XCTAssertEqual(intValue, value)

        // Negative
        guardNegativeException {
            intValue <~ mapValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            intValue <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            intValue <~ mapValid[JsonKeys.nilValue]
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
        int8Value <~ map[JsonKeys.int8]
        XCTAssertNotNil(map.JSON[JsonKeys.int8])

        int16Value <~ map[JsonKeys.int16]
        XCTAssertNotNil(map.JSON[JsonKeys.int16])

        int32Value <~ map[JsonKeys.int32]
        XCTAssertNotNil(map.JSON[JsonKeys.int32])

        int64Value <~ map[JsonKeys.int64]
        XCTAssertNotNil(map.JSON[JsonKeys.int64])

        intValue <~ map[JsonKeys.int]
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue <~ map[JsonKeys.notValidValue]
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

        let JsonString = Constants.intValues
        let JsonStringNotValid = Constants.intValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        mapValid.JSON[JsonKeys.nilValue] = nil

        // --

        let value8: Int8? = Int8(JsonString[JsonKeys.int8]!)
        var int8Value: Int8? = 0

        int8Value <~ mapValid[JsonKeys.int8]

        // Positive
        XCTAssertEqual(int8Value, value8)

        // Negative
        int8Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertEqual(int8Value, nil)

        int8Value <~ mapValid[JsonKeys.nilValue]
        XCTAssertEqual(int8Value, nil)

        guardNegativeException {
            int8Value <~ mapNotValid[JsonKeys.notValidValue]
        }

        // --

        let value16: Int16? = Int16(JsonString[JsonKeys.int16]!)
        var int16Value: Int16? = 0

        int16Value <~ mapValid[JsonKeys.int16]

        // Positive
        XCTAssertEqual(int16Value, value16)

        // Negative
        int16Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertEqual(int8Value, nil)

        int16Value <~ mapValid[JsonKeys.nilValue]
        XCTAssertEqual(int16Value, nil)

        guardNegativeException {
            int16Value <~ mapNotValid[JsonKeys.notValidValue]
        }

        // --

        let value32: Int32? = Int32(JsonString[JsonKeys.int32]!)
        var int32Value: Int32? = 0

        int32Value <~ mapValid[JsonKeys.int32]

        // Positive
        XCTAssertEqual(int32Value, value32)

        // Negative
        int32Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertEqual(int32Value, nil)

        int32Value <~ mapValid[JsonKeys.nilValue]
        XCTAssertEqual(int32Value, nil)

        guardNegativeException {
            int32Value <~ mapNotValid[JsonKeys.notValidValue]
        }

        // --

        let value64: Int64? = Int64(JsonString[JsonKeys.int64]!)
        var int64Value: Int64? = 0

        int64Value <~ mapValid[JsonKeys.int64]

        // Positive
        XCTAssertEqual(int64Value, value64)

        // Negative
        int64Value <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertEqual(int64Value, nil)

        int64Value <~ mapValid[JsonKeys.nilValue]
        XCTAssertEqual(int64Value, nil)

        guardNegativeException {
            int64Value <~ mapNotValid[JsonKeys.notValidValue]
        }

        // --

        let value: Int? = Int(JsonString[JsonKeys.int]!)
        var intValue: Int? = 0

        intValue <~ mapValid[JsonKeys.int]

        // Positive
        XCTAssertEqual(intValue, value)

        // Negative
        intValue <~ mapValid[JsonKeys.noSuchKey]
        XCTAssertEqual(intValue, nil)

        intValue <~ mapValid[JsonKeys.nilValue]
        XCTAssertEqual(intValue, nil)

        guardNegativeException {
            intValue <~ mapNotValid[JsonKeys.notValidValue]
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
        int8Value <~ map[JsonKeys.int8]
        XCTAssertNotNil(map.JSON[JsonKeys.int8])

        int16Value <~ map[JsonKeys.int16]
        XCTAssertNotNil(map.JSON[JsonKeys.int16])

        int32Value <~ map[JsonKeys.int32]
        XCTAssertNotNil(map.JSON[JsonKeys.int32])

        int64Value <~ map[JsonKeys.int64]
        XCTAssertNotNil(map.JSON[JsonKeys.int64])

        intValue <~ map[JsonKeys.int]
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue <~ map[JsonKeys.notValidValue]
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

        let JsonString = Constants.intValues
        let JsonStringNotValid = Constants.intValuesNotValid

        let mapValid = Map(mappingType: .fromJSON, JSON: JsonString)
        let mapNotValid = Map(mappingType: .fromJSON, JSON: JsonStringNotValid)

        mapValid.JSON[JsonKeys.nilValue] = nil

        // --

        let value8: Int8! = Int8(JsonString[JsonKeys.int8]!)
        var int8Value: Int8! = 0

        int8Value <~ mapValid[JsonKeys.int8]

        // Positive
        XCTAssertEqual(int8Value, value8)

        // Negative
        guardNegativeException {
            int8Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            int8Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            int8Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let value16: Int16! = Int16(JsonString[JsonKeys.int16]!)
        var int16Value: Int16! = 0

        int16Value <~ mapValid[JsonKeys.int16]

        // Positive
        XCTAssertEqual(int16Value, value16)

        // Negative
        guardNegativeException {
            int16Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            int16Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            int16Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let value32: Int32! = Int32(JsonString[JsonKeys.int32]!)
        var int32Value: Int32! = 0

        int32Value <~ mapValid[JsonKeys.int32]

        // Positive
        XCTAssertEqual(int32Value, value32)

        // Negative
        guardNegativeException {
            int32Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            int32Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            int32Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let value64: Int64! = Int64(JsonString[JsonKeys.int64]!)
        var int64Value: Int64! = 0

        int64Value <~ mapValid[JsonKeys.int64]

        // Positive
        XCTAssertEqual(int64Value, value64)

        // Negative
        guardNegativeException {
            int64Value <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            int64Value <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            int64Value <~ mapValid[JsonKeys.nilValue]
        }

        // --

        let value: Int! = Int(JsonString[JsonKeys.int]!)
        var intValue: Int! = 0

        intValue <~ mapValid[JsonKeys.int]

        // Positive
        XCTAssertEqual(intValue, value)

        // Negative
        guardNegativeException {
            intValue <~ mapNotValid[JsonKeys.notValidValue]
        }
        guardNegativeException {
            intValue <~ mapValid[JsonKeys.noSuchKey]
        }
        guardNegativeException {
            intValue <~ mapValid[JsonKeys.nilValue]
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
        int8Value <~ map[JsonKeys.int8]
        XCTAssertNotNil(map.JSON[JsonKeys.int8])

        int16Value <~ map[JsonKeys.int16]
        XCTAssertNotNil(map.JSON[JsonKeys.int16])

        int32Value <~ map[JsonKeys.int32]
        XCTAssertNotNil(map.JSON[JsonKeys.int32])

        int64Value <~ map[JsonKeys.int64]
        XCTAssertNotNil(map.JSON[JsonKeys.int64])

        intValue <~ map[JsonKeys.int]
        XCTAssertNotNil(map.JSON[JsonKeys.int])

        // Negative
        guardNegativeException {
            Constants.invalidDateValue <~ map[JsonKeys.notValidValue]
        }
    }
}

// ----------------------------------------------------------------------------
