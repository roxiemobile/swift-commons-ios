// ----------------------------------------------------------------------------
//
//  JSONKeys.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

final class JSONKeys
{
// MARK: - Properties

// MARK: -  Integer
    static let forIntValues = [
        CodingKeys.int8: Constants.intMax,
        CodingKeys.int16: Constants.intMin,
        CodingKeys.int32: Constants.intMax,
        CodingKeys.int64: Constants.intMin,
        CodingKeys.int: Constants.intMax,
    ]
    static let forUIntValues = [
        CodingKeys.uint8: Constants.uintMax,
        CodingKeys.uint16: Constants.uintMin,
        CodingKeys.uint32: Constants.uintMax,
        CodingKeys.uint64: Constants.uintMin,
        CodingKeys.uint: Constants.uintMax,
    ]
    static let forIntValuesNotValid = [
        CodingKeys.notValidValue: Constants.notValidValue
    ]

// MARK: -  BasicTypes
    static let forBasicTypes = [
        CodingKeys.bool: Constants.boolTrue
    ]
    static let forBasicTypesNotValid = [
        CodingKeys.notValidValue: Constants.notValidValue
    ]

// MARK: -  Mappable Objects
    static let forMappableObjects = [
        CodingKeys.validObject: [
            CodingKeys.bool: Constants.boolTrue,
            CodingKeys.boolOptional: Constants.boolTrue,
            CodingKeys.boolImplicityUnwrapped: Constants.boolTrue
        ]
    ]
    static let forMappableObjectsNotValid = [
        CodingKeys.validObject: [
            CodingKeys.notValidValue: Constants.notValidValue
        ]
    ]

// MARK: - Array Mappable Objects
    static let forArrayMappableObjects = [
        CodingKeys.validArrayObjects: [
            [CodingKeys.bool: Constants.boolTrue,
             CodingKeys.boolOptional: Constants.boolTrue,
             CodingKeys.boolImplicityUnwrapped: Constants.boolTrue
            ]
        ]
    ]
    static let forArrayMappableOptionalObjects = [
        CodingKeys.validArrayOptionalObjects: [
            [CodingKeys.bool: Constants.boolTrue,
             CodingKeys.boolOptional: Constants.boolTrue,
             CodingKeys.boolImplicityUnwrapped: Constants.boolTrue
            ]
        ]
    ]
    static let forArrayMappableImplicitlyUnwrappedOptionalObjects = [
        CodingKeys.validArrayImplicitlyUnwrappedObjects: [
            [CodingKeys.bool: Constants.boolTrue,
             CodingKeys.boolOptional: Constants.boolTrue,
             CodingKeys.boolImplicityUnwrapped: Constants.boolTrue
            ]
        ]
    ]
    static let forArrayMappableObjectsNotValid = [
        CodingKeys.notValidValue: [
            [CodingKeys.bool: Constants.notValidValue,
             CodingKeys.boolOptional: Constants.notValidValue,
             CodingKeys.boolImplicityUnwrapped: Constants.notValidValue
            ]
        ]
    ]
    static let forArrayMappableObjectsEmpty = [
        CodingKeys.emptyValue: [[]]
    ]

// MARK: - Set Mappable Objects
    static let forSetMappableObject = [
        CodingKeys.validSetObjects: [
            [CodingKeys.x: Constants.intMax,
             CodingKeys.y: Constants.intMax,
             CodingKeys.z: Constants.intMax
            ]
        ]
    ]
    static let forSetMappableOptionalObjects = [
        CodingKeys.validSetOptionalObjects: [
            [CodingKeys.x: Constants.intMin,
             CodingKeys.y: Constants.intMin,
             CodingKeys.z: Constants.intMin
            ]
        ]
    ]
    static let forSetMappableImplicitlyUnwrappedOptionalObjects = [
        CodingKeys.validSetImplicitlyUnwrappedObjects: [
            [CodingKeys.x: Constants.intMax,
             CodingKeys.y: Constants.intMax,
             CodingKeys.z: Constants.intMax
            ]
        ]
    ]
    static let forSetMappableObjectsNotValid = [
        CodingKeys.notValidValue: [
            [CodingKeys.x: Constants.notValidValue,
             CodingKeys.y: Constants.notValidValue,
             CodingKeys.z: Constants.notValidValue
            ]
        ]
    ]
    static let forSetMappableObjectsEmpty = [
        CodingKeys.emptyValue: [[:]]
    ]

// MARK: - Dictionary Mappable Objects
    static let forDictionaryMappableObjects = [
        CodingKeys.validDictionaryObjects: [
            CodingKeys.validDictionaryObjects: [
                CodingKeys.bool: Constants.boolTrue,
                CodingKeys.boolOptional: Constants.boolTrue,
                CodingKeys.boolImplicityUnwrapped: Constants.boolTrue
            ]
        ]
    ]
    static let forDictionaryMappableOptionalObjects = [
        CodingKeys.validDictionaryOptionalObjects: [
            CodingKeys.validDictionaryOptionalObjects: [
                CodingKeys.bool: Constants.boolTrue,
                CodingKeys.boolOptional: Constants.boolTrue,
                CodingKeys.boolImplicityUnwrapped: Constants.boolTrue
            ]
        ]
    ]
    static let forDictionaryMappableImplicitlyUnwrappedOptionalObjects = [
        CodingKeys.validDictionaryImplicitlyUnwrappedObjects: [
            CodingKeys.validDictionaryImplicitlyUnwrappedObjects: [
                CodingKeys.bool: Constants.boolTrue,
                CodingKeys.boolOptional: Constants.boolTrue,
                CodingKeys.boolImplicityUnwrapped: Constants.boolTrue
            ]
        ]
    ]
    static let forDictionaryMappableObjectsNotValid = [
        CodingKeys.notValidValue: [
            CodingKeys.notValidValue: [
                CodingKeys.bool: Constants.notValidValue,
                CodingKeys.boolOptional: Constants.notValidValue,
                CodingKeys.boolImplicityUnwrapped: Constants.notValidValue
            ]
        ]
    ]
    static let forDictionaryMappableObjectsEmpty = [
        CodingKeys.emptyValue: [
            CodingKeys.emptyValue: [:]
        ]
    ]

// MARK: - Dictionary Array Mappable Objects
    static let forDictionaryMappableArrayObjects = [
        CodingKeys.validDictionaryArrayObjects: [
            CodingKeys.validDictionaryArrayObjects: [
                [CodingKeys.bool: Constants.boolTrue,
                 CodingKeys.boolOptional: Constants.boolTrue,
                 CodingKeys.boolImplicityUnwrapped: Constants.boolTrue
                ]
            ]
        ]
    ]
    static let forDictionaryMappableArrayOptionalObjects = [
        CodingKeys.validDictionaryArrayOptionalObjects: [
            CodingKeys.validDictionaryArrayOptionalObjects: [
                [CodingKeys.bool: Constants.boolTrue,
                 CodingKeys.boolOptional: Constants.boolTrue,
                 CodingKeys.boolImplicityUnwrapped: Constants.boolTrue
                ]
            ]
        ]
    ]
    static let forDictionaryMappableArrayImplicitlyUnwrappedOptionalObjects = [
        CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects: [
            CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects: [
                [CodingKeys.bool: Constants.boolTrue,
                 CodingKeys.boolOptional: Constants.boolTrue,
                 CodingKeys.boolImplicityUnwrapped: Constants.boolTrue
                ]
            ]
        ]
    ]
    static let forDictionaryMappableArrayObjectsNotValid = [
        CodingKeys.notValidValue: [
            CodingKeys.notValidValue: [
                [CodingKeys.bool: Constants.notValidValue,
                 CodingKeys.boolOptional: Constants.notValidValue,
                 CodingKeys.boolImplicityUnwrapped: Constants.notValidValue
                ]
            ]
        ]
    ]
    static let forDictionaryMappableArrayObjectsEmpty = [
        CodingKeys.emptyValue: [
            CodingKeys.emptyValue: [:]
        ]
    ]
}

// ----------------------------------------------------------------------------
