// ----------------------------------------------------------------------------
//
//  Constants.Operators.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Constants
{
// MARK: -  BasicTypes

    static let basicTypes = [
        JsonKeys.bool: true
    ]

    static let invalidBasicTypes = [
        JsonKeys.invalidValue: Constants.invalidValue
    ]

// MARK: -  Mappable Objects

    static let mappableObjects = [
        JsonKeys.validObject: [
            JsonKeys.bool: true,
            JsonKeys.boolOptional: true,
            JsonKeys.boolImplicitlyUnwrapped: true
        ]
    ]

    static let invalidMappableObjects = [
        JsonKeys.validObject: [
            JsonKeys.invalidValue: Constants.invalidValue
        ]
    ]

// MARK: - Array of Mappable Objects

    static let arrayOfMappableObjects = [
        JsonKeys.validObject: [
            [
                JsonKeys.bool: true,
                JsonKeys.boolOptional: true,
                JsonKeys.boolImplicitlyUnwrapped: true
            ]
        ]
    ]

    static let arrayOfInvalidMappableObjects = [
        JsonKeys.invalidValue: [
            [
                JsonKeys.bool: Constants.invalidValue,
                JsonKeys.boolOptional: Constants.invalidValue,
                JsonKeys.boolImplicitlyUnwrapped: Constants.invalidValue
            ]
        ]
    ]

    static let emptyArrayOfMappableObjects = [
        JsonKeys.emptyValue: [
            [:]
        ]
    ]

// MARK: - Dictionary with Mappable Objects

    static let dictionaryWithMappableObjects = [
        JsonKeys.validObject: [
            JsonKeys.validObject: [
                JsonKeys.bool: true,
                JsonKeys.boolOptional: true,
                JsonKeys.boolImplicitlyUnwrapped: true
            ]
        ]
    ]

    static let dictionaryWithInvalidMappableObjects = [
        JsonKeys.invalidValue: [
            JsonKeys.invalidValue: [
                JsonKeys.bool: Constants.invalidValue,
                JsonKeys.boolOptional: Constants.invalidValue,
                JsonKeys.boolImplicitlyUnwrapped: Constants.invalidValue
            ]
        ]
    ]

    static let emptyDictionaryWithMappableObjects = [
        JsonKeys.emptyValue: [
            JsonKeys.emptyValue: [:]
        ]
    ]

// MARK: - Dictionary with Array of Mappable Objects

    static let dictionaryWithArrayOfMappableObjects = [
        JsonKeys.validObject: [
            JsonKeys.validObject: [
                [
                    JsonKeys.bool: true,
                    JsonKeys.boolOptional: true,
                    JsonKeys.boolImplicitlyUnwrapped: true
                ]
            ]
        ]
    ]

    static let dictionaryWithArrayOfInvalidMappableObjects = [
        JsonKeys.invalidValue: [
            JsonKeys.invalidValue: [
                [
                    JsonKeys.bool: Constants.invalidValue,
                    JsonKeys.boolOptional: Constants.invalidValue,
                    JsonKeys.boolImplicitlyUnwrapped: Constants.invalidValue
                ]
            ]
        ]
    ]

    static let emptyDictionaryWithArrayOfMappableObjects = [
        JsonKeys.emptyValue: [
            JsonKeys.emptyValue: [:]
        ]
    ]

// MARK: - Set of Mappable Objects

    static let setOfMappableObjects = [
        JsonKeys.validObject: [
            [
                JsonKeys.x: Int.max,
                JsonKeys.y: Int.max,
                JsonKeys.z: Int.max
            ]
        ]
    ]

    static let setOfInvalidMappableObjects = [
        JsonKeys.invalidValue: [
            [
                JsonKeys.x: Constants.invalidValue,
                JsonKeys.y: Constants.invalidValue,
                JsonKeys.z: Constants.invalidValue
            ]
        ]
    ]

    static let emptySetOfMappableObjects = [
        JsonKeys.emptyValue: [
            [:]
        ]
    ]
}

// ----------------------------------------------------------------------------
