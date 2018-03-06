// ----------------------------------------------------------------------------
//
//  JSONKeys.swift
//
//  @author     Natalia Mamunina <___EMAIL___>
//  @copyright  Copyright (c) 2018, ___COMPANY___. All rights reserved.
//  @link       ___WEBSITE___
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

final class JSONKeys
{
// MARK: - Properties

    static let forIntValues = [
        CodingKeys.int8 : Constants.intMax,
        CodingKeys.int16 : Constants.intMin,
        CodingKeys.int32 : Constants.intMax,
        CodingKeys.int64 : Constants.intMin,
        CodingKeys.int : Constants.intMax,
        ]
    static let forUIntValues = [
        CodingKeys.uint8 : Constants.uintMax,
        CodingKeys.uint16 : Constants.uintMin,
        CodingKeys.uint32 : Constants.uintMax,
        CodingKeys.uint64 : Constants.uintMin,
        CodingKeys.uint : Constants.uintMax,
        ]
    static let forIntValuesNotValid = [CodingKeys.notValidValue : Constants.notValidValue]
    
    static let forBasicTypes = [CodingKeys.bool : Constants.boolTrue]
    static let forNotValidBasicTypes = [CodingKeys.notValidValue : Constants.notValidValue]

    static let forMappableObjects = [
        CodingKeys.validObject: [
            CodingKeys.bool : Constants.boolTrue,
            CodingKeys.boolOptional : Constants.boolTrue,
            CodingKeys.boolImplicityUnwrapped : Constants.boolTrue
        ]
    ]
    static let forMappableObjectsNotValid = [
        CodingKeys.validObject: [
            CodingKeys.notValidValue: Constants.notValidValue
        ]
    ]

    static let forArrayMappableObjects =  [
        CodingKeys.validArrayObjects : [[
            CodingKeys.bool : Constants.boolTrue,
            CodingKeys.boolOptional : Constants.boolTrue,
            CodingKeys.boolImplicityUnwrapped : Constants.boolTrue]
        ]
    ]
    static let forArrayMappableOptionalObjects = [
        CodingKeys.validArrayOptionalObjects : [[
            CodingKeys.bool : Constants.boolTrue,
            CodingKeys.boolOptional : Constants.boolTrue,
            CodingKeys.boolImplicityUnwrapped : Constants.boolTrue]
        ]
    ]
    static let forArrayMappableImplicitlyUnwrappedOptionalObjects = [
        CodingKeys.validArrayImplicitlyUnwrappedObjects : [[
            CodingKeys.bool : Constants.boolTrue,
            CodingKeys.boolOptional : Constants.boolTrue,
            CodingKeys.boolImplicityUnwrapped : Constants.boolTrue]
        ]
    ]
    static let forArrayMappableObjectsNotValid = [
        CodingKeys.notValidValue : [
            [CodingKeys.bool : Constants.notValidValue,
             CodingKeys.boolOptional : Constants.notValidValue,
             CodingKeys.boolImplicityUnwrapped : Constants.notValidValue]
        ]
    ]
    static let forArrayMappableObjectsEmpty = [
        CodingKeys.emptyValue : [[]]
    ]

    static let forSetMappableObject = [
        CodingKeys.validSetObjects : [
            [CodingKeys.x : Constants.intMax,
             CodingKeys.y : Constants.intMax,
             CodingKeys.z : Constants.intMax]
        ]
    ]
    static let forSetMappableOptionalObjects = [
            CodingKeys.validSetOptionalObjects : [
                [CodingKeys.x : Constants.intMin,
                 CodingKeys.y : Constants.intMin,
                 CodingKeys.z : Constants.intMin]
            ]
    ]
    static let forSetMappableImplicitlyUnwrappedOptionalObjects = [
        CodingKeys.validSetImplicitlyUnwrappedObjects: [
            [CodingKeys.x : Constants.intMax,
             CodingKeys.y : Constants.intMax,
             CodingKeys.z : Constants.intMax]
        ]
    ]
    static let forSetMappableObjectsNotValid = [
        CodingKeys.notValidValue : [
            [CodingKeys.x : Constants.notValidValue,
             CodingKeys.y : Constants.notValidValue,
             CodingKeys.z : Constants.notValidValue]
        ]
    ]
    static let forSetMappableObjectsEmpty = [
        CodingKeys.emptyValue : [[:]]
    ]

    static let forDictionaryMappableObjects = [
        CodingKeys.validDictionaryObjects : [
            CodingKeys.validDictionaryObjects : [
                CodingKeys.bool : Constants.boolTrue,
                CodingKeys.boolOptional : Constants.boolTrue,
                CodingKeys.boolImplicityUnwrapped : Constants.boolTrue
            ]
        ]
    ]
    static let forDictionaryMappableOptionalObjects = [
        CodingKeys.validDictionaryOptionalObjects : [
            CodingKeys.validDictionaryOptionalObjects : [
                CodingKeys.bool : Constants.boolTrue,
                CodingKeys.boolOptional : Constants.boolTrue,
                CodingKeys.boolImplicityUnwrapped : Constants.boolTrue
            ]
        ]
    ]
    static let forDictionaryMappableImplicitlyUnwrappedOptionalObjects = [
        CodingKeys.validDictionaryImplicitlyUnwrappedObjects : [
            CodingKeys.validDictionaryImplicitlyUnwrappedObjects : [
                CodingKeys.bool : Constants.boolTrue,
                CodingKeys.boolOptional : Constants.boolTrue,
                CodingKeys.boolImplicityUnwrapped : Constants.boolTrue
            ]
        ]
    ]
    static let forDictionaryMappableObjectsNotValid = [
        CodingKeys.notValidValue : [
            CodingKeys.notValidValue : [
                CodingKeys.bool : Constants.notValidValue,
                CodingKeys.boolOptional : Constants.notValidValue,
                CodingKeys.boolImplicityUnwrapped : Constants.notValidValue
            ]
        ]
    ]
    static let forDictionaryMappableObjectsEmpty = [
        CodingKeys.emptyValue : [
            CodingKeys.emptyValue:[:]
        ]
    ]

    static let forDictionaryMappableArrayObjects = [
        CodingKeys.validDictionaryArrayObjects : [
            CodingKeys.validDictionaryArrayObjects : [
                [CodingKeys.bool : Constants.boolTrue,
                 CodingKeys.boolOptional : Constants.boolTrue,
                 CodingKeys.boolImplicityUnwrapped : Constants.boolTrue]
            ]
        ]
    ]
    static let forDictionaryMappableArrayOptionalObjects = [
        CodingKeys.validDictionaryArrayOptionalObjects : [
            CodingKeys.validDictionaryArrayOptionalObjects : [
                [CodingKeys.bool : Constants.boolTrue,
                 CodingKeys.boolOptional : Constants.boolTrue,
                 CodingKeys.boolImplicityUnwrapped : Constants.boolTrue]
            ]
        ]
    ]
    static let forDictionaryMappableArrayImplicitlyUnwrappedOptionalObjects = [
        CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects : [
            CodingKeys.validDictionaryArrayImplicitlyUnwrappedObjects : [
                [CodingKeys.bool : Constants.boolTrue,
                 CodingKeys.boolOptional : Constants.boolTrue,
                 CodingKeys.boolImplicityUnwrapped : Constants.boolTrue]
            ]
        ]
    ]
    static let forDictionaryMappableArrayObjectsNotValid = [
        CodingKeys.notValidValue : [
            CodingKeys.notValidValue : [
                [CodingKeys.bool : Constants.notValidValue,
                 CodingKeys.boolOptional : Constants.notValidValue,
                 CodingKeys.boolImplicityUnwrapped : Constants.notValidValue]
            ]
        ]
    ]
    static let forDictionaryMappableArrayObjectsEmpty = [
        CodingKeys.emptyValue : [
            CodingKeys.emptyValue : [:]
        ]
    ]

}

// ----------------------------------------------------------------------------
