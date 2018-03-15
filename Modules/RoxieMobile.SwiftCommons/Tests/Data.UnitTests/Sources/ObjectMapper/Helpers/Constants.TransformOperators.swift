// ----------------------------------------------------------------------------
//
//  Constants.TransformOperators.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Constants
{
// MARK: -  Transforms BasicTypes

    static let transformBasicTypes = [
        JsonKeys.int: "\(Int.min)"
    ]

    static let transformInvalidBasicTypes = [
        JsonKeys.invalidValue: Constants.invalidValue
    ]

// MARK: -  Transforms Array of BasicTypes

    static let transformArrayOfBasicTypes = [
        JsonKeys.int: [
            "\(Int.min)", "\(Int.max)"
        ]
    ]

    static let transformArrayOfInvalidBasicTypes = [
        JsonKeys.invalidValue: [
            Int.min, Int.max
        ]
    ]

// MARK: -  Transforms Dictionary with BasicTypes

    static let transformDictionaryWithBasicTypes = [
        JsonKeys.validObject: [
            JsonKeys.validObject: "\(Int.min)"
        ]
    ]

    static let transformDictionaryWithInvalidBasicTypes = [
        JsonKeys.validObject: [
            JsonKeys.validObject: Int.min
        ]
    ]

// MARK: -  Transforms Mappable Objects

    static let transformMappableObjects = [
        JsonKeys.validObject: [
            JsonKeys.x: "\(Int.max)",
            JsonKeys.y: "\(Int.max)",
            JsonKeys.z: "\(Int.max)"
        ]
    ]

    static let transformInvalidMappableObjects = [
        JsonKeys.validObject: [
            JsonKeys.x: Int.max,
            JsonKeys.y: Int.max,
            JsonKeys.z: Int.max
        ]
    ]

    static let transformEmptyMappableObjects = [
        JsonKeys.emptyValue: [:]
    ]

// MARK: -  Transforms Array of Mappable Objects

    static let transformArrayOfMappableObjects = [
        JsonKeys.validObject: [
            [
                JsonKeys.x: "\(Int.max)",
                JsonKeys.y: "\(Int.max)",
                JsonKeys.z: "\(Int.max)"
            ]
        ]
    ]

    static let transformArrayOfInvalidMappableObject = [
        JsonKeys.validObject: [
            [
                JsonKeys.x: Int.max,
                JsonKeys.y: Int.max,
                JsonKeys.z: Int.max
            ]
        ]
    ]

    static let transformEmptyArrayOfMappableObjects = [
        JsonKeys.validObject: [
            [:]
        ]
    ]

// MARK: -  Transforms Dictionary with Mappable Objects

    static let transformDictionaryWithMappableObjects = [
        JsonKeys.validObject: [
            JsonKeys.validObject: [
                JsonKeys.x: "\(Int.max)",
                JsonKeys.y: "\(Int.max)",
                JsonKeys.z: "\(Int.max)"
            ]
        ]
    ]

    static let transformDictionaryWithInvalidMappableObjects = [
        JsonKeys.validObject: [
            JsonKeys.validObject: [
                JsonKeys.x: Int.max,
                JsonKeys.y: Int.max,
                JsonKeys.z: Int.max
            ]
        ]
    ]

    static let transformEmptyDictionaryWithMappableObjects = [
        JsonKeys.validObject: [:]
    ]

// MARK: -  Transforms Set of Mappable Objects

    static let transformSetOfMappableObjects = [
        JsonKeys.validObject: [
            [
                JsonKeys.x: "\(Int.max)",
                JsonKeys.y: "\(Int.max)",
                JsonKeys.z: "\(Int.max)"
            ]
        ]
    ]

    static let transformSetOfInvalidMappableObjects = [
        JsonKeys.validObject: [
            [
                JsonKeys.x: Int.max,
                JsonKeys.y: Int.max,
                JsonKeys.z: Int.max
            ]
        ]
    ]

    static let transformEmptySetOfMappableObjects = [
        JsonKeys.validObject: [
            [:]
        ]
    ]
}

// ----------------------------------------------------------------------------
