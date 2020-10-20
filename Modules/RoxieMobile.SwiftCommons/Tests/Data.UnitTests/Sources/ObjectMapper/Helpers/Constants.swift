// ----------------------------------------------------------------------------
//
//  Constants.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommonsLang

// ----------------------------------------------------------------------------

final class Constants: NonCreatable
{
// MARK: - Basic types

    static let booleanBasicTypes: [String: Any] = [
        JsonKeys.value: true,
        JsonKeys.invalidValue: Constants.invalidValue,
        JsonKeys.nilValue: Constants.nilValue
    ]

    static let integerBasicTypes: [String: Any] = [
        JsonKeys.value: "\(Int.max)",
        JsonKeys.invalidValue: Constants.invalidValue,
        JsonKeys.nilValue: Constants.nilValue
    ]

// MARK: - Mappable objects

    static let mappableObjects: [String: Any] = [
        JsonKeys.object: Constants.dictionaryOfInt8,
        JsonKeys.invalidObject: Constants.invalidObject,
        JsonKeys.nilObject: Constants.nilValue
    ]

// MARK: - Arrays of objects

    static let arrayOfIntegerBasicTypes: [String: Any] = [
        JsonKeys.array: [
            "\(Int32.max)"
        ],
        JsonKeys.invalidArray: [
            Constants.invalidValue
        ],
        JsonKeys.emptyArray: [],
        JsonKeys.nilArray: Constants.nilValue
    ]

    static let arrayOfMappableObjects: [String: Any] = [
        JsonKeys.array: [
            Constants.dictionaryOfInt8
        ],
        JsonKeys.invalidArray: [
            Constants.invalidObject
        ],
        JsonKeys.emptyArray: [],
        JsonKeys.nilArray: Constants.nilValue
    ]

    static let arrayOfStringRawValues: [String: Any] = [
        JsonKeys.array: [
            StringRawType.value.rawValue
        ],
        JsonKeys.invalidArray: [
            Constants.invalidValue
        ],
        JsonKeys.emptyArray: [],
        JsonKeys.nilArray: Constants.nilValue
    ]

// MARK: - Dictionaries of objects

    static let dictionaryOfIntegerBasicTypes: [String: Any] = [
        JsonKeys.dictionary: [
            JsonKeys.value: "\(Int16.max)"
        ],
        JsonKeys.invalidDictionary: [
            JsonKeys.value: Constants.invalidValue
        ],
        JsonKeys.emptyDictionary: [:],
        JsonKeys.nilDictionary: Constants.nilValue
    ]

    static let dictionaryOfMappableObjects: [String: Any] = [
        JsonKeys.dictionary: [
            JsonKeys.object: Constants.dictionaryOfInt8
        ],
        JsonKeys.invalidDictionary: [
            JsonKeys.object: Constants.invalidObject
        ],
        JsonKeys.emptyDictionary: [:],
        JsonKeys.nilDictionary: Constants.nilValue
    ]

    static let dictionaryOfStringRawValues: [String: Any] = [
        JsonKeys.dictionary: [
            JsonKeys.value: StringRawType.value.rawValue
        ],
        JsonKeys.invalidDictionary: [
            JsonKeys.value: Constants.invalidValue
        ],
        JsonKeys.emptyDictionary: [:],
        JsonKeys.nilDictionary: Constants.nilValue
    ]

// MARK: - Numbers

    static let integerValues: [String: Any] = [
        JsonKeys.int8: Int(Int8.max),
        JsonKeys.int16: Int(Int16.max),
        JsonKeys.int32: Int(Int32.max),
        JsonKeys.int64: Int(Int64.max),
        JsonKeys.int: Int.max,
        JsonKeys.invalidValue: Constants.invalidValue,
        JsonKeys.nilValue: Constants.nilValue
    ]

    static let unsignedIntegerValues: [String: Any] = [
        JsonKeys.uint8: UInt(Int8.max),
        JsonKeys.uint16: UInt(Int16.max),
        JsonKeys.uint32: UInt(Int32.max),
        JsonKeys.uint64: UInt(Int64.max),
        JsonKeys.uint: UInt(Int.max),
        JsonKeys.invalidValue: Constants.invalidValue,
        JsonKeys.nilValue: Constants.nilValue
    ]

    static let floatValues: [String: Any] = [
        JsonKeys.value: Float.pi,
        JsonKeys.invalidValue: Constants.invalidValue,
        JsonKeys.nilValue: Constants.nilValue
    ]

// MARK: - Vector3D models

    static let dictionaryOfInt8: [String: Any] = [
        JsonKeys.x: "\(Int8.max)",
        JsonKeys.y: "\(Int8.max)",
        JsonKeys.z: "\(Int8.max)"
    ]

    static let dictionaryOfInt16: [String: Any] = [
        JsonKeys.x: "\(Int16.max)",
        JsonKeys.y: "\(Int16.max)",
        JsonKeys.z: "\(Int16.max)"
    ]

    static let dictionaryOfInt32: [String: Any] = [
        JsonKeys.x: "\(Int32.max)",
        JsonKeys.y: "\(Int32.max)",
        JsonKeys.z: "\(Int32.max)"
    ]

// MARK: - RawRepresentable types

    static let stringRawValues: [String: Any] = [
        JsonKeys.value: StringRawType.value.rawValue,
        JsonKeys.invalidValue: Constants.invalidValue,
        JsonKeys.nilValue: Constants.nilValue
    ]

// MARK: - Other Values

    static let invalidObject: [String: Any] = [
        JsonKeys.x: Constants.invalidValue,
        JsonKeys.y: Constants.invalidValue,
        JsonKeys.z: Constants.invalidValue,
        JsonKeys.invalidValue: Constants.invalidValue
    ]

    static let invalidValue = UUID()

    static let nilValue = NSNull()

    static let float32Value: Float32 = 0.15

    static let float64Value: Float64 = 0.25

    static let floatValue: Float = 0.35

    static let doubleValue = 0.45

    static let stringValue = "value"
}

// ----------------------------------------------------------------------------
