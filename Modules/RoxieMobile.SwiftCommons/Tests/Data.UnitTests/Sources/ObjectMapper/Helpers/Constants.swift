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

    static let dictionaryOfSTCBool: [String: Any] = [
        JsonKeys.bool: false
    ]

    static let dictionaryOfSTCCharacter: [String: Character] = [
        JsonKeys.character: Constants.characterValue
    ]

    static let dictionaryOfSTCDouble: [String: Double] = [
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

    static let dictionaryOfSTCString: [String: String] = [
        JsonKeys.string: Constants.stringValue
    ]

    static let dictionarySTCMixed: [String: Any] = [
        JsonKeys.bool: false,
//        JsonKeys.character: Constants.characterValue,
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
        JsonKeys.string: Constants.stringValue,
        JsonKeys.serializableBool: Constants.dictionaryOfSTCBool,
//        JsonKeys.serializableCharacter: Constants.dictionaryForSTCCharacter,
        JsonKeys.serializableDouble: Constants.dictionaryOfSTCDouble,
        JsonKeys.serializableFloat: Constants.dictionaryOfSTCFloat,
        JsonKeys.serializableFloat32: Constants.dictionaryOfSTCFloat32,
        JsonKeys.serializableFloat64: Constants.dictionaryOfSTCFloat64,
        JsonKeys.serializableUInt8: Constants.dictionaryOfSTCUnsignedInteger8,
        JsonKeys.serializableUInt16: Constants.dictionaryOfSTCUnsignedInteger16,
        JsonKeys.serializableUInt32: Constants.dictionaryOfSTCUnsignedInteger32,
        JsonKeys.serializableUInt64: Constants.dictionaryOfSTCUnsignedInteger64,
        JsonKeys.serializableUInt: Constants.dictionaryOfSTCUnsignedInteger,
        JsonKeys.serializableInt8: Constants.dictionaryOfSTCSignedInteger8,
        JsonKeys.serializableInt16: Constants.dictionaryOfSTCSignedInteger16,
        JsonKeys.serializableInt32: Constants.dictionaryOfSTCSignedInteger32,
        JsonKeys.serializableInt64: Constants.dictionaryOfSTCSignedInteger64,
        JsonKeys.serializableInt: Constants.dictionaryOfSTCSignedInteger,
        JsonKeys.serializableString: Constants.dictionaryOfSTCString,
        JsonKeys.boolArray: [true],
//        JsonKeys.characterArray: [Constants.characterValue],
        JsonKeys.doubleArray: [Constants.doubleValue],
        JsonKeys.floatArray: [Constants.floatValue],
        JsonKeys.float32Array: [Constants.float32Value],
        JsonKeys.float64Array: [Constants.float64Value],
        JsonKeys.uinteger8Array: [UInt8.max],
        JsonKeys.uinteger16Array: [UInt16.max],
        JsonKeys.uinteger32Array: [UInt32.max],
        JsonKeys.uinteger64Array:[UInt64.max],
        JsonKeys.uintegerArray: [UInt.max],
        JsonKeys.integer8Array: [Int8.max],
        JsonKeys.integer16Array: [Int16.max],
        JsonKeys.integer32Array: [Int32.max],
        JsonKeys.integer64Array: [Int64.max],
        JsonKeys.integerArray: [Int.max],
        JsonKeys.stringArray: [Constants.stringValue],
        JsonKeys.serializableBoolArray: [Constants.dictionaryOfSTCBool],
//        JsonKeys.serializableCharacterArray: [Constants.dictionaryOfSTCCharacter],
        JsonKeys.serializableDoubleArray: [Constants.dictionaryOfSTCDouble],
        JsonKeys.serializableFloatArray: [Constants.dictionaryOfSTCFloat],
        JsonKeys.serializableFloat32Array: [Constants.dictionaryOfSTCFloat32],
        JsonKeys.serializableFloat64Array: [Constants.dictionaryOfSTCFloat64],
        JsonKeys.serializableUInt8Array: [Constants.dictionaryOfSTCUnsignedInteger8],
        JsonKeys.serializableUInt16Array: [Constants.dictionaryOfSTCUnsignedInteger16],
        JsonKeys.serializableUInt32Array: [Constants.dictionaryOfSTCUnsignedInteger32],
        JsonKeys.serializableUInt64Array: [Constants.dictionaryOfSTCUnsignedInteger64],
        JsonKeys.serializableUIntArray: [Constants.dictionaryOfSTCUnsignedInteger],
        JsonKeys.serializableInt8Array: [Constants.dictionaryOfSTCSignedInteger8],
        JsonKeys.serializableInt16Array: [Constants.dictionaryOfSTCSignedInteger16],
        JsonKeys.serializableInt32Array: [Constants.dictionaryOfSTCSignedInteger32],
        JsonKeys.serializableInt64Array: [Constants.dictionaryOfSTCSignedInteger64],
        JsonKeys.serializableIntArray: [Constants.dictionaryOfSTCSignedInteger],
        JsonKeys.serializableStringArray: [Constants.dictionaryOfSTCString],
        JsonKeys.boolDictionary: [JsonKeys.value: true],
//        JsonKeys.characterDictionary: [JsonKeys.value: Constants.characterValue],
        JsonKeys.doubleDictionary: [JsonKeys.value: Constants.doubleValue],
        JsonKeys.floatDictionary: [JsonKeys.value: Constants.floatValue],
        JsonKeys.float32Dictionary: [JsonKeys.value: Constants.float32Value],
        JsonKeys.float64Dictionary: [JsonKeys.value: Constants.float64Value],
        JsonKeys.uinteger8Dictionary: [JsonKeys.value: UInt8.max],
        JsonKeys.uinteger16Dictionary: [JsonKeys.value: UInt16.max],
        JsonKeys.uinteger32Dictionary: [JsonKeys.value: UInt32.max],
        JsonKeys.uinteger64Dictionary: [JsonKeys.value: UInt64.max],
        JsonKeys.uintegerDictionary: [JsonKeys.value: UInt.max],
        JsonKeys.integer8Dictionary: [JsonKeys.value: Int8.max],
        JsonKeys.integer16Dictionary: [JsonKeys.value: Int16.max],
        JsonKeys.integer32Dictionary: [JsonKeys.value: Int32.max],
        JsonKeys.integer64Dictionary: [JsonKeys.value: Int64.max],
        JsonKeys.integerDictionary: [JsonKeys.value: Int.max],
        JsonKeys.stringDictionary: [JsonKeys.value: Constants.stringValue],
        JsonKeys.serializableBoolDictionary: [JsonKeys.object: Constants.dictionaryOfSTCBool],
//        JsonKeys.serializableCharacterDictionary: [JsonKeys.object: STCCharacterModel.shared],
        JsonKeys.serializableDoubleDictionary: [JsonKeys.object: Constants.dictionaryOfSTCDouble],
        JsonKeys.serializableFloatDictionary: [JsonKeys.object: Constants.dictionaryOfSTCFloat],
        JsonKeys.serializableFloat32Dictionary: [JsonKeys.object: Constants.dictionaryOfSTCFloat32],
        JsonKeys.serializableFloat64Dictionary: [JsonKeys.object: Constants.dictionaryOfSTCFloat64],
        JsonKeys.serializableUInt8Dictionary: [JsonKeys.object: Constants.dictionaryOfSTCUnsignedInteger8],
        JsonKeys.serializableUInt16Dictionary: [JsonKeys.object: Constants.dictionaryOfSTCUnsignedInteger16],
        JsonKeys.serializableUInt32Dictionary: [JsonKeys.object: Constants.dictionaryOfSTCUnsignedInteger32],
        JsonKeys.serializableUInt64Dictionary: [JsonKeys.object: Constants.dictionaryOfSTCUnsignedInteger64],
        JsonKeys.serializableUIntDictionary: [JsonKeys.object: Constants.dictionaryOfSTCUnsignedInteger],
        JsonKeys.serializableInt8Dictionary: [JsonKeys.object: Constants.dictionaryOfSTCSignedInteger8],
        JsonKeys.serializableInt16Dictionary: [JsonKeys.object: Constants.dictionaryOfSTCSignedInteger16],
        JsonKeys.serializableInt32Dictionary: [JsonKeys.object: Constants.dictionaryOfSTCSignedInteger32],
        JsonKeys.serializableInt64Dictionary: [JsonKeys.object: Constants.dictionaryOfSTCSignedInteger64],
        JsonKeys.serializableIntDictionary: [JsonKeys.object: Constants.dictionaryOfSTCSignedInteger],
        JsonKeys.serializableStringDictionary: [JsonKeys.object: Constants.dictionaryOfSTCString],
//        JsonKeys.boolSet: Set([true]),
//        JsonKeys.characterSet: Set([Constants.characterValue]),
//        JsonKeys.doubleSet: Set([Constants.doubleValue]),
//        JsonKeys.floatSet: Set([Constants.floatValue]),
//        JsonKeys.float32Set: Set([Constants.float32Value]),
//        JsonKeys.float64Set: Set([Constants.doubleValue]),
//        JsonKeys.uinteger8Set: Set([UInt8.max]),
//        JsonKeys.uinteger16Set: Set([UInt16.max]),
//        JsonKeys.uinteger32Set: Set([UInt32.max]),
//        JsonKeys.uinteger64Set: Set([UInt64.max]),
//        JsonKeys.uintegerSet: Set([UInt.max]),
//        JsonKeys.integer8Set: Set([Int8.max]),
//        JsonKeys.integer16Set: Set([Int16.max]),
//        JsonKeys.integer32Set: Set([Int32.max]),
//        JsonKeys.integer64Set: Set([Int64.max]),
//        JsonKeys.integerSet: Set([Int.max]),
//        JsonKeys.stringSet: Set([Constants.stringValue]),
//        JsonKeys.serializableBoolSet: Set([Constants.dictionaryOfSTCBool]),
//        JsonKeys.serializableCharacterSet: Set([Constants.dictionaryOfSTCCharacter]),
//        JsonKeys.serializableDoubleSet: Set([Constants.dictionaryOfSTCDouble]),
//        JsonKeys.serializableFloatSet: Set([Constants.dictionaryOfSTCFloat]),
//        JsonKeys.serializableFloat32Set: Set([Constants.dictionaryOfSTCFloat32]),
//        JsonKeys.serializableFloat64Set: Set([Constants.dictionaryOfSTCFloat64]),
//        JsonKeys.serializableUInt8Set: Set([Constants.dictionaryOfSTCUnsignedInteger8]),
//        JsonKeys.serializableUInt16Set: Set([Constants.dictionaryOfSTCUnsignedInteger16]),
//        JsonKeys.serializableUInt32Set: Set([Constants.dictionaryOfSTCUnsignedInteger32]),
//        JsonKeys.serializableUInt64Set: Set([Constants.dictionaryOfSTCUnsignedInteger64]),
//        JsonKeys.serializableUIntSet: Set([Constants.dictionaryOfSTCUnsignedInteger]),
//        JsonKeys.serializableInt8Set: Set([Constants.dictionaryOfSTCSignedInteger8]),
//        JsonKeys.serializableInt16Set: Set([Constants.dictionaryOfSTCSignedInteger16]),
//        JsonKeys.serializableInt32Set: Set([Constants.dictionaryOfSTCSignedInteger32]),
//        JsonKeys.serializableInt64Set: Set([Constants.dictionaryOfSTCSignedInteger64]),
//        JsonKeys.serializableIntSet: Set([Constants.dictionaryOfSTCSignedInteger]),
//        JsonKeys.serializableStringSet: Set([Constants.dictionaryOfSTCString])
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
