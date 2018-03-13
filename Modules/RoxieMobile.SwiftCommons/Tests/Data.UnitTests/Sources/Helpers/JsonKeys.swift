// ----------------------------------------------------------------------------
//
//  JsonKeys.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

internal final class JsonKeys
{
// MARK: -  Integer

    static let intValues = [
        CodingKeys.int8: Constants.maxInt,
        CodingKeys.int16: Constants.minInt,
        CodingKeys.int32: Constants.maxInt,
        CodingKeys.int64: Constants.minInt,
        CodingKeys.int: Constants.maxInt,
    ]

    static let uintValues = [
        CodingKeys.uint8: Constants.maxUInt,
        CodingKeys.uint16: Constants.minUInt,
        CodingKeys.uint32: Constants.maxUInt,
        CodingKeys.uint64: Constants.minUInt,
        CodingKeys.uint: Constants.maxUInt,
    ]

    static let intValuesNotValid = [
        CodingKeys.notValidValue: Constants.notValidValue
    ]

// MARK: -  BasicTypes

    static let basicTypes = [
        CodingKeys.bool: true
    ]

    static let basicTypesNotValid = [
        CodingKeys.notValidValue: Constants.notValidValue
    ]

// MARK: -  Mappable Objects

    static let mappableObjects = [
        CodingKeys.validObject: [
            CodingKeys.bool: true,
            CodingKeys.boolOptional: true,
            CodingKeys.boolImplicityUnwrapped: true
        ]
    ]

    static let mappableObjectsNotValid = [
        CodingKeys.validObject: [
            CodingKeys.notValidValue: Constants.notValidValue
        ]
    ]

// MARK: - Array Mappable Objects

    static let arrayMappableObjects = [
        CodingKeys.validObject: [
            [CodingKeys.bool: true,
             CodingKeys.boolOptional: true,
             CodingKeys.boolImplicityUnwrapped: true
            ]
        ]
    ]

    static let arrayMappableObjectsNotValid = [
        CodingKeys.notValidValue: [
            [CodingKeys.bool: Constants.notValidValue,
             CodingKeys.boolOptional: Constants.notValidValue,
             CodingKeys.boolImplicityUnwrapped: Constants.notValidValue
            ]
        ]
    ]

    static let arrayMappableObjectsEmpty = [
        CodingKeys.emptyValue: [[]]
    ]

// MARK: - Set Mappable Objects

    static let setMappableObject = [
        CodingKeys.validObject: [
            [CodingKeys.x: Constants.maxInt,
             CodingKeys.y: Constants.maxInt,
             CodingKeys.z: Constants.maxInt
            ]
        ]
    ]

    static let setMappableObjectsNotValid = [
        CodingKeys.notValidValue: [
            [CodingKeys.x: Constants.notValidValue,
             CodingKeys.y: Constants.notValidValue,
             CodingKeys.z: Constants.notValidValue
            ]
        ]
    ]

    static let setMappableObjectsEmpty = [
        CodingKeys.emptyValue: [[:]]
    ]

// MARK: - Dictionary Mappable Objects

    static let dictionaryMappableObjects = [
        CodingKeys.validObject: [
            CodingKeys.validObject: [
                CodingKeys.bool: true,
                CodingKeys.boolOptional: true,
                CodingKeys.boolImplicityUnwrapped: true
            ]
        ]
    ]

    static let dictionaryMappableObjectsNotValid = [
        CodingKeys.notValidValue: [
            CodingKeys.notValidValue: [
                CodingKeys.bool: Constants.notValidValue,
                CodingKeys.boolOptional: Constants.notValidValue,
                CodingKeys.boolImplicityUnwrapped: Constants.notValidValue
            ]
        ]
    ]

    static let dictionaryMappableObjectsEmpty = [
        CodingKeys.emptyValue: [
            CodingKeys.emptyValue: [:]
        ]
    ]

// MARK: - Dictionary Array Mappable Objects

    static let dictionaryMappableArrayObjects = [
        CodingKeys.validObject: [
            CodingKeys.validObject: [
                [CodingKeys.bool: true,
                 CodingKeys.boolOptional: true,
                 CodingKeys.boolImplicityUnwrapped: true
                ]
            ]
        ]
    ]

    static let dictionaryMappableArrayObjectsNotValid = [
        CodingKeys.notValidValue: [
            CodingKeys.notValidValue: [
                [CodingKeys.bool: Constants.notValidValue,
                 CodingKeys.boolOptional: Constants.notValidValue,
                 CodingKeys.boolImplicityUnwrapped: Constants.notValidValue
                ]
            ]
        ]
    ]

    static let dictionaryMappableArrayObjectsEmpty = [
        CodingKeys.emptyValue: [
            CodingKeys.emptyValue: [:]
        ]
    ]

// MARK: -  Transforms BasicTypes

    static let transformBasicTypes = [
        CodingKeys.int: "\(Constants.minInt)"
    ]

    static let transformBasicTypesNotValid = [
        CodingKeys.notValidValue: Constants.notValidValue
    ]

// MARK: -  Transforms Array BasicTypes

    static let transformArrayBasicTypes = [
        CodingKeys.int: [
            "\(Constants.minInt)", "\(Constants.maxInt)"
        ]
    ]

    static let transformArrayBasicTypesNotValid = [
        CodingKeys.notValidValue: [
            Constants.minInt, Constants.maxInt
        ]
    ]

// MARK: -  Transforms Dictionary BasicTypes

    static let transformDictionaryBasicTypes = [
        CodingKeys.validObject: [
            CodingKeys.validObject: "\(Constants.minInt)"
        ]
    ]

    static let transformDictionaryBasicTypesNotValid = [
        CodingKeys.validObject: [
            CodingKeys.validObject: Constants.minInt
        ]
    ]

// MARK: -  Transforms Mappable Object

    static let transformMappableObject = [
        CodingKeys.validObject: [
            CodingKeys.x: "\(Constants.maxInt)",
            CodingKeys.y: "\(Constants.maxInt)",
            CodingKeys.z: "\(Constants.maxInt)"
        ]
    ]

    static let transformMappableObjectNotValid = [
        CodingKeys.validObject: [
            CodingKeys.x: Constants.maxInt,
            CodingKeys.y: Constants.maxInt,
            CodingKeys.z: Constants.maxInt
        ]
    ]

    static let transformMappableObjectEmpty = [
        CodingKeys.emptyValue: [:]
    ]

// MARK: -  Transforms Array of Mappable Object

    static let transformArrayMappableObject = [
        CodingKeys.validObject: [
            [CodingKeys.x: "\(Constants.maxInt)",
             CodingKeys.y: "\(Constants.maxInt)",
             CodingKeys.z: "\(Constants.maxInt)"
            ]
        ]
    ]

    static let transformArrayMappableObjectNotValid = [
        CodingKeys.validObject: [
            [CodingKeys.x: Constants.maxInt,
             CodingKeys.y: Constants.maxInt,
             CodingKeys.z: Constants.maxInt
            ]
        ]
    ]

    static let transformArrayMappableObjectEmpty = [
        CodingKeys.validObject: [
            [
            ]
        ]
    ]

// MARK: -  Transforms Dictionary of Mappable Object

    static let transformDictionaryMappableObject = [
        CodingKeys.validObject: [
            CodingKeys.validObject: [
                CodingKeys.x: "\(Constants.maxInt)",
                CodingKeys.y: "\(Constants.maxInt)",
                CodingKeys.z: "\(Constants.maxInt)"
            ]
        ]
    ]

    static let transformDictionaryMappableObjectNotValid = [
        CodingKeys.validObject: [
            CodingKeys.validObject: [
                CodingKeys.x: Constants.maxInt,
                CodingKeys.y: Constants.maxInt,
                CodingKeys.z: Constants.maxInt
            ]
        ]
    ]

    static let transformDictionaryMappableObjectEmpty = [
        CodingKeys.validObject: [:]
    ]

// MARK: -  Transforms Set of Mappable Object

    static let transformSetMappableObject = [
        CodingKeys.validObject: [
            [CodingKeys.x: "\(Constants.maxInt)",
             CodingKeys.y: "\(Constants.maxInt)",
             CodingKeys.z: "\(Constants.maxInt)"
            ]
        ]
    ]

    static let transformSetMappableObjectNotValid = [
        CodingKeys.validObject: [
            [CodingKeys.x: Constants.maxInt,
             CodingKeys.y: Constants.maxInt,
             CodingKeys.z: Constants.maxInt
            ]
        ]
    ]

    static let transformSetMappableObjectEmpty = [
        CodingKeys.validObject: [[:]]
    ]

// MARK: - Enum Operators Object

    static let enumOperatorsObject = [
        CodingKeys.validObject: Constants.enumObjectAnother
    ]

    static let enumOperatorsObjectNotValid = [
        CodingKeys.validObject: true
    ]

    static let enumOperatorsObjectEmpty: [String: Any] = [:]

// MARK: - Enum Operators Array Object

    static let enumOperatorsArrayObject = [
        CodingKeys.validObject: [Constants.enumObjectAnother]
    ]

    static let enumOperatorsArrayObjectNotValid = [
        CodingKeys.validObject: [true]
    ]

    static let enumOperatorsArrayObjectEmpty: [String: [Any]] = [:]

// MARK: - Enum Operators Dictionary Object

    static let enumOperatorsDictionaryObject = [
        CodingKeys.validObject: [CodingKeys.enumObject: Constants.enumObjectAnother]
    ]

    static let enumOperatorsDictionaryObjectNotValid = [
        CodingKeys.validObject: [CodingKeys.enumObject: true]
    ]

    static let enumOperatorsDictionaryObjectEmpty: [String: [Any]] = [:]
}

// ----------------------------------------------------------------------------
