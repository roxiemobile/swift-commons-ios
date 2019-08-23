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

// MARK: - StreamTypedCoder Models

    static let dictionaryForSTCBool: [String: Any] = [
        JsonKeys.bool: false
    ]

    static let dictionaryForSTCCharacter: [String: Character] = [
        JsonKeys.character: Constants.characterValue
    ]

    static let dictionaryForSTCDouble: [String: Double] = [
        JsonKeys.double: Constants.doubleValue
    ]

    static let dictionaryOfSTCFloat32: [String: Float32] = [
        JsonKeys.float32: Constants.float32Value
    ]

    static let dictionaryOfSTCFloat64: [String: Float64] = [
        JsonKeys.float64: Constants.float64Value
    ]

    static let dictionaryOfSTCFloat: [String: Float] = [
        JsonKeys.float: Constants.floatValue
    ]

    static let dictionaryOfSTCUnsignedInteger8: [String: UInt8] = [
        JsonKeys.uint8: UInt8.max
    ]

    static let dictionaryOfSTCUnsignedInteger16: [String: UInt16] = [
        JsonKeys.uint16: UInt16.max
    ]

    static let dictionaryOfSTCUnsignedInteger32: [String: UInt32] = [
        JsonKeys.uint32: UInt32.max
    ]

    static let dictionaryOfSTCUnsignedInteger64: [String: UInt64] = [
        JsonKeys.uint64: UInt64.max
    ]

    static let dictionaryOfSTCUnsignedInteger: [String: UInt] = [
        JsonKeys.uint: UInt.max
    ]

    static let dictionaryOfSTCSignedInteger8: [String: Int8] = [
        JsonKeys.int8: Int8.max
    ]

    static let dictionaryOfSTCSignedInteger16: [String: Int16] = [
        JsonKeys.int16: Int16.max
    ]

    static let dictionaryOfSTCSignedInteger32: [String: Int32] = [
        JsonKeys.int32: Int32.max
    ]

    static let dictionaryOfSTCSignedInteger64: [String: Int64] = [
        JsonKeys.int64: Int64.max
    ]

    static let dictionaryOfSTCSignedInteger: [String: Int] = [
        JsonKeys.int: Int.max
    ]

    static let dictionaryForSTCString: [String: String] = [
        JsonKeys.string: Constants.stringValue
    ]

    static let dictionarySTCMixed: [String: Any] = [
        JsonKeys.bool: false,
        JsonKeys.character: Constants.characterValue,
        JsonKeys.double: Constants.doubleValue,
        JsonKeys.float: Constants.floatValue,
        JsonKeys.float32: Constants.float32Value,
        JsonKeys.float64: Constants.float64Value,
        JsonKeys.uint8: UInt8.max,
        JsonKeys.uint16: UInt16.max,
        JsonKeys.uint32: UInt32.max,
        JsonKeys.uint64: UInt64.max,
        JsonKeys.uint: UInt.max,
        JsonKeys.int8: Int8.max,
        JsonKeys.int16: Int16.max,
        JsonKeys.int32: Int32.max,
        JsonKeys.int64: Int64.max,
        JsonKeys.int: Int.max,
        JsonKeys.string: Constants.stringValue
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

    static let doubleValue = 0.25

    static let stringValue = "quality"

    static let float32Value: Float32 = 0.25

    static let float64Value: Float64 = 0.25

    static let floatValue: Float = 0.25

    static let characterValue: Character = "q"
}

// ----------------------------------------------------------------------------
