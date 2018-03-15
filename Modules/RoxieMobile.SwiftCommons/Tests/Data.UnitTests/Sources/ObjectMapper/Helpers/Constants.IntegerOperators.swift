// ----------------------------------------------------------------------------
//
//  Constants.IntegerOperators.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Constants
{
// MARK: -  Integers

    static let intValues = [
        JsonKeys.int8: Int(Int8.max),
        JsonKeys.int16: Int(Int16.min),
        JsonKeys.int32: Int(Int32.max),
        JsonKeys.int64: Int(Int64.min),
        JsonKeys.int: Int.max
    ]

    static let uintValues = [
        JsonKeys.uint8: UInt(UInt8.max),
        JsonKeys.uint16: UInt(UInt16.max),
        JsonKeys.uint32: UInt(UInt32.max),
        JsonKeys.uint64: UInt(UInt64.max),
        JsonKeys.uint: UInt.max,
    ]

    static let invalidIntValues = [
        JsonKeys.invalidValue: Constants.invalidValue
    ]
}

// ----------------------------------------------------------------------------
