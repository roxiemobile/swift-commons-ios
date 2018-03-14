// ----------------------------------------------------------------------------
//
//  Constants.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

internal final class Constants
{
// MARK: -  Invalid Values

    static let invalidValue = "invalidValue"
    static var invalidDateValue = Date(timeIntervalSinceReferenceDate: -123456789.0)

// MARK: -  Integer

    static let maxInt = Int8.max
    static let minInt = Int8.min

    static let maxUInt = UInt8.max
    static let minUInt = UInt8.min

    static let intValues = [
        JsonKeys.int8: Constants.maxInt,
        JsonKeys.int16: Constants.minInt,
        JsonKeys.int32: Constants.maxInt,
        JsonKeys.int64: Constants.minInt,
        JsonKeys.int: Constants.maxInt,
    ]

    static let uintValues = [
        JsonKeys.uint8: Constants.maxUInt,
        JsonKeys.uint16: Constants.minUInt,
        JsonKeys.uint32: Constants.maxUInt,
        JsonKeys.uint64: Constants.minUInt,
        JsonKeys.uint: Constants.maxUInt,
    ]

    static let intValuesNotValid = [
        JsonKeys.notValidValue: Constants.invalidValue
    ]

// MARK: -  BasicTypes

    static let basicTypes = [
        JsonKeys.bool: true
    ]

    static let basicTypesNotValid = [
        JsonKeys.notValidValue: Constants.invalidValue
    ]

// MARK: -  Mappable Objects

    static let mappableObjects = [
        JsonKeys.validObject: [
            JsonKeys.bool: true,
            JsonKeys.boolOptional: true,
            JsonKeys.boolImplicitlyUnwrapped: true
        ]
    ]

    static let mappableObjectsNotValid = [
        JsonKeys.validObject: [
            JsonKeys.notValidValue: Constants.invalidValue
        ]
    ]

// MARK: - Array Mappable Objects

    static let arrayMappableObjects = [
        JsonKeys.validObject: [
            [JsonKeys.bool: true,
             JsonKeys.boolOptional: true,
             JsonKeys.boolImplicitlyUnwrapped: true
            ]
        ]
    ]

    static let arrayMappableObjectsNotValid = [
        JsonKeys.notValidValue: [
            [JsonKeys.bool: Constants.invalidValue,
             JsonKeys.boolOptional: Constants.invalidValue,
             JsonKeys.boolImplicitlyUnwrapped: Constants.invalidValue
            ]
        ]
    ]

    static let arrayMappableObjectsEmpty = [
        JsonKeys.emptyValue: [[]]
    ]

// MARK: - Set Mappable Objects

    static let setMappableObject = [
        JsonKeys.validObject: [
            [JsonKeys.x: Constants.maxInt,
             JsonKeys.y: Constants.maxInt,
             JsonKeys.z: Constants.maxInt
            ]
        ]
    ]

    static let setMappableObjectsNotValid = [
        JsonKeys.notValidValue: [
            [JsonKeys.x: Constants.invalidValue,
             JsonKeys.y: Constants.invalidValue,
             JsonKeys.z: Constants.invalidValue
            ]
        ]
    ]

    static let setMappableObjectsEmpty = [
        JsonKeys.emptyValue: [[:]]
    ]

// MARK: - Dictionary Mappable Objects

    static let dictionaryMappableObjects = [
        JsonKeys.validObject: [
            JsonKeys.validObject: [
                JsonKeys.bool: true,
                JsonKeys.boolOptional: true,
                JsonKeys.boolImplicitlyUnwrapped: true
            ]
        ]
    ]

    static let dictionaryMappableObjectsNotValid = [
        JsonKeys.notValidValue: [
            JsonKeys.notValidValue: [
                JsonKeys.bool: Constants.invalidValue,
                JsonKeys.boolOptional: Constants.invalidValue,
                JsonKeys.boolImplicitlyUnwrapped: Constants.invalidValue
            ]
        ]
    ]

    static let dictionaryMappableObjectsEmpty = [
        JsonKeys.emptyValue: [
            JsonKeys.emptyValue: [:]
        ]
    ]

// MARK: - Dictionary Array Mappable Objects

    static let dictionaryMappableArrayObjects = [
        JsonKeys.validObject: [
            JsonKeys.validObject: [
                [JsonKeys.bool: true,
                 JsonKeys.boolOptional: true,
                 JsonKeys.boolImplicitlyUnwrapped: true
                ]
            ]
        ]
    ]

    static let dictionaryMappableArrayObjectsNotValid = [
        JsonKeys.notValidValue: [
            JsonKeys.notValidValue: [
                [JsonKeys.bool: Constants.invalidValue,
                 JsonKeys.boolOptional: Constants.invalidValue,
                 JsonKeys.boolImplicitlyUnwrapped: Constants.invalidValue
                ]
            ]
        ]
    ]

    static let dictionaryMappableArrayObjectsEmpty = [
        JsonKeys.emptyValue: [
            JsonKeys.emptyValue: [:]
        ]
    ]

// MARK: -  Transforms BasicTypes

    static let transformBasicTypes = [
        JsonKeys.int: "\(Constants.minInt)"
    ]

    static let transformBasicTypesNotValid = [
        JsonKeys.notValidValue: Constants.invalidValue
    ]

// MARK: -  Transforms Array BasicTypes

    static let transformArrayBasicTypes = [
        JsonKeys.int: [
            "\(Constants.minInt)", "\(Constants.maxInt)"
        ]
    ]

    static let transformArrayBasicTypesNotValid = [
        JsonKeys.notValidValue: [
            Constants.minInt, Constants.maxInt
        ]
    ]

// MARK: -  Transforms Dictionary BasicTypes

    static let transformDictionaryBasicTypes = [
        JsonKeys.validObject: [
            JsonKeys.validObject: "\(Constants.minInt)"
        ]
    ]

    static let transformDictionaryBasicTypesNotValid = [
        JsonKeys.validObject: [
            JsonKeys.validObject: Constants.minInt
        ]
    ]

// MARK: -  Transforms Mappable Object

    static let transformMappableObject = [
        JsonKeys.validObject: [
            JsonKeys.x: "\(Constants.maxInt)",
            JsonKeys.y: "\(Constants.maxInt)",
            JsonKeys.z: "\(Constants.maxInt)"
        ]
    ]

    static let transformMappableObjectNotValid = [
        JsonKeys.validObject: [
            JsonKeys.x: Constants.maxInt,
            JsonKeys.y: Constants.maxInt,
            JsonKeys.z: Constants.maxInt
        ]
    ]

    static let transformMappableObjectEmpty = [
        JsonKeys.emptyValue: [:]
    ]

// MARK: -  Transforms Array of Mappable Object

    static let transformArrayMappableObject = [
        JsonKeys.validObject: [
            [JsonKeys.x: "\(Constants.maxInt)",
             JsonKeys.y: "\(Constants.maxInt)",
             JsonKeys.z: "\(Constants.maxInt)"
            ]
        ]
    ]

    static let transformArrayMappableObjectNotValid = [
        JsonKeys.validObject: [
            [JsonKeys.x: Constants.maxInt,
             JsonKeys.y: Constants.maxInt,
             JsonKeys.z: Constants.maxInt
            ]
        ]
    ]

    static let transformArrayMappableObjectEmpty = [
        JsonKeys.validObject: [
            [
            ]
        ]
    ]

// MARK: -  Transforms Dictionary of Mappable Object

    static let transformDictionaryMappableObject = [
        JsonKeys.validObject: [
            JsonKeys.validObject: [
                JsonKeys.x: "\(Constants.maxInt)",
                JsonKeys.y: "\(Constants.maxInt)",
                JsonKeys.z: "\(Constants.maxInt)"
            ]
        ]
    ]

    static let transformDictionaryMappableObjectNotValid = [
        JsonKeys.validObject: [
            JsonKeys.validObject: [
                JsonKeys.x: Constants.maxInt,
                JsonKeys.y: Constants.maxInt,
                JsonKeys.z: Constants.maxInt
            ]
        ]
    ]

    static let transformDictionaryMappableObjectEmpty = [
        JsonKeys.validObject: [:]
    ]

// MARK: -  Transforms Set of Mappable Object

    static let transformSetMappableObject = [
        JsonKeys.validObject: [
            [JsonKeys.x: "\(Constants.maxInt)",
             JsonKeys.y: "\(Constants.maxInt)",
             JsonKeys.z: "\(Constants.maxInt)"
            ]
        ]
    ]

    static let transformSetMappableObjectNotValid = [
        JsonKeys.validObject: [
            [JsonKeys.x: Constants.maxInt,
             JsonKeys.y: Constants.maxInt,
             JsonKeys.z: Constants.maxInt
            ]
        ]
    ]

    static let transformSetMappableObjectEmpty = [
        JsonKeys.validObject: [[:]]
    ]

// MARK: - Enum Operators Object

    static let enumOperatorsObject = [
        JsonKeys.validObject: EnumObject.Another.rawValue
    ]

    static let enumOperatorsObjectNotValid = [
        JsonKeys.validObject: true
    ]

    static let enumOperatorsObjectEmpty: [String: Any] = [:]

// MARK: - Enum Operators Array Object

    static let enumOperatorsArrayObject = [
        JsonKeys.validObject: [EnumObject.Another.rawValue]
    ]

    static let enumOperatorsArrayObjectNotValid = [
        JsonKeys.validObject: [true]
    ]

    static let enumOperatorsArrayObjectEmpty: [String: [Any]] = [:]

// MARK: - Enum Operators Dictionary Object

    static let enumOperatorsDictionaryObject = [
        JsonKeys.validObject: [JsonKeys.enumObject: EnumObject.Another.rawValue]
    ]

    static let enumOperatorsDictionaryObjectNotValid = [
        JsonKeys.validObject: [JsonKeys.enumObject: true]
    ]

    static let enumOperatorsDictionaryObjectEmpty: [String: [Any]] = [:]
}

// ----------------------------------------------------------------------------
