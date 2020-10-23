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

final class Constants: NonCreatable {

// MARK: - Basic types

    static let booleanValues: [String: Any] = [
        JsonKeys.bool: true,
        JsonKeys.invalidValue: Constants.invalidValue,
        JsonKeys.nilValue: Constants.nullValue
    ]

    // TODO
    static let doubleValues: [String: Any] = [
        JsonKeys.double: Double.pi,
        JsonKeys.invalidValue: Constants.invalidValue,
        JsonKeys.nilValue: Constants.nullValue
    ]

    static let floatValues: [String: Any] = [
        JsonKeys.float: Float.pi,
        JsonKeys.float32: Float32.pi,
        JsonKeys.float64: Float64.pi,
        JsonKeys.invalidValue: Constants.invalidValue,
        JsonKeys.nilValue: Constants.nullValue
    ]

    static let integerValues: [String: Any] = [
        JsonKeys.int: Int.max,
        JsonKeys.int8: Int8.max,
        JsonKeys.int16: Int16.max,
        JsonKeys.int32: Int32.max,
        JsonKeys.int64: Int64.max,
        JsonKeys.invalidValue: Constants.invalidValue,
        JsonKeys.nilValue: Constants.nullValue,
        JsonKeys.string: "\(Int.max)",
    ]

    static let unsignedIntegerValues: [String: Any] = [
        JsonKeys.uint: UInt.max,
        JsonKeys.uint8: Int8.max,
        JsonKeys.uint16: Int16.max,
        JsonKeys.uint32: Int32.max,
        JsonKeys.uint64: Int64.max,
        JsonKeys.invalidValue: Constants.invalidValue,
        JsonKeys.nilValue: Constants.nullValue
    ]

    static let stringValues: [String: Any] = [
        JsonKeys.string: Constants.stringValue,
        JsonKeys.invalidValue: Constants.invalidValue,
        JsonKeys.nilValue: Constants.nullValue,
        JsonKeys.rawTypeValue: StringRawType.value.rawValue,
    ]

// MARK: - Mappable objects

    static let mappableObjects: [String: Any] = [
        JsonKeys.object: Constants.dictionaryOfInt8,
        JsonKeys.invalidObject: Constants.invalidObject,
        JsonKeys.nilObject: Constants.nullValue
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
        JsonKeys.nilArray: Constants.nullValue
    ]

    static let arrayOfMappableObjects: [String: Any] = [
        JsonKeys.array: [
            Constants.dictionaryOfInt8
        ],
        JsonKeys.invalidArray: [
            Constants.invalidObject
        ],
        JsonKeys.emptyArray: [],
        JsonKeys.nilArray: Constants.nullValue
    ]

    static let arrayOfStringRawValues: [String: Any] = [
        JsonKeys.array: [
            StringRawType.value.rawValue
        ],
        JsonKeys.invalidArray: [
            Constants.invalidValue
        ],
        JsonKeys.emptyArray: [],
        JsonKeys.nilArray: Constants.nullValue
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
        JsonKeys.nilDictionary: Constants.nullValue
    ]

    static let dictionaryOfMappableObjects: [String: Any] = [
        JsonKeys.dictionary: [
            JsonKeys.object: Constants.dictionaryOfInt8
        ],
        JsonKeys.invalidDictionary: [
            JsonKeys.object: Constants.invalidObject
        ],
        JsonKeys.emptyDictionary: [:],
        JsonKeys.nilDictionary: Constants.nullValue
    ]

    static let dictionaryOfStringRawValues: [String: Any] = [
        JsonKeys.dictionary: [
            JsonKeys.value: StringRawType.value.rawValue
        ],
        JsonKeys.invalidDictionary: [
            JsonKeys.value: Constants.invalidValue
        ],
        JsonKeys.emptyDictionary: [:],
        JsonKeys.nilDictionary: Constants.nullValue
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

// MARK: - Other values

    static let invalidObject: [String: Any] = [
        JsonKeys.x: Constants.invalidValue,
        JsonKeys.y: Constants.invalidValue,
        JsonKeys.z: Constants.invalidValue,
        JsonKeys.invalidValue: Constants.invalidValue
    ]

    static let invalidValue = UUID()

    static let nullValue = NSNull()

    static let stringValue = "string_value"
}
