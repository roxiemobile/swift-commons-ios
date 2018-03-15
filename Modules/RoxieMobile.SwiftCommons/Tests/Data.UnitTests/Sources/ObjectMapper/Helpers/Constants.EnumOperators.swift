// ----------------------------------------------------------------------------
//
//  Constants.EnumOperators.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Constants
{
// MARK: - RawRepresentable Types

    static let enumRawValues = [
        JsonKeys.validObject: EnumType.typeValue.rawValue
    ]

    static let enumInvalidRawValues = [
        JsonKeys.validObject: true
    ]

    static let enumEmptyRawValues: [String: Any] = [:]

// MARK: - Array of RawRepresentable Types

    static let enumArrayOfRawValues = [
        JsonKeys.validObject: [
            EnumType.typeValue.rawValue
        ]
    ]

    static let enumArrayOfInvalidRawValues = [
        JsonKeys.validObject: [
            true
        ]
    ]

    static let enumEmptyArrayOfRawValues: [String: Any] = [:]

// MARK: - Dictionary with RawRepresentable Types

    static let enumDictionaryWithRawValues = [
        JsonKeys.validObject: [
            JsonKeys.enumObject: EnumType.typeValue.rawValue
        ]
    ]

    static let enumDictionaryWithInvalidRawValues = [
        JsonKeys.validObject: [
            JsonKeys.enumObject: true
        ]
    ]

    static let enumEmptyDictionaryWithRawValues: [String: Any] = [:]
}

// ----------------------------------------------------------------------------
