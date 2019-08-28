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
        JsonKeys.string: Constants.stringValue,
        JsonKeys.serializableBool: STCBoolModel.shared,
        JsonKeys.serializableCharacter: STCCharacterModel.shared,
        JsonKeys.serializableDouble: STCDoubleModel.shared,
        JsonKeys.serializableFloat: STCFloatModel.shared,
        JsonKeys.serializableFloat32: STCFloat32Model.shared,
        JsonKeys.serializableFloat64: STCFloat64Model.shared,
        JsonKeys.serializableUInt8: STCUnsignedInteger8Model.shared,
        JsonKeys.serializableUInt16: STCUnsignedInteger16Model.shared,
        JsonKeys.serializableUInt32: STCUnsignedInteger32Model.shared,
        JsonKeys.serializableUInt64: STCUnsignedInteger64Model.shared,
        JsonKeys.serializableUInt: STCUnsignedIntegerModel.shared,
        JsonKeys.serializableInt8: STCSignedInteger8Model.shared,
        JsonKeys.serializableInt16: STCSignedInteger16Model.shared,
        JsonKeys.serializableInt32: STCSignedInteger32Model.shared,
        JsonKeys.serializableInt64: STCSignedInteger64Model.shared,
        JsonKeys.serializableInt: STCSignedIntegerModel.shared,
        JsonKeys.serializableString: STCStringModel.shared,
        JsonKeys.boolArray: [true],
        JsonKeys.characterArray: [Constants.characterValue],
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
        JsonKeys.serializableBoolArray: [STCBoolModel.shared],
        JsonKeys.serializableCharacterArray: [STCCharacterModel.shared],
        JsonKeys.serializableDoubleArray: [STCDoubleModel.shared],
        JsonKeys.serializableFloatArray: [STCFloatModel.shared],
        JsonKeys.serializableFloat32Array: [STCFloat32Model.shared],
        JsonKeys.serializableFloat64Array: [STCFloat64Model.shared],
        JsonKeys.serializableUInt8Array: [STCUnsignedInteger8Model.shared],
        JsonKeys.serializableUInt16Array: [STCUnsignedInteger16Model.shared],
        JsonKeys.serializableUInt32Array: [STCUnsignedInteger32Model.shared],
        JsonKeys.serializableUInt64Array: [STCUnsignedInteger64Model.shared],
        JsonKeys.serializableUIntArray: [STCUnsignedIntegerModel.shared],
        JsonKeys.serializableInt8Array: [STCSignedInteger8Model.shared],
        JsonKeys.serializableInt16Array: [STCSignedInteger16Model.shared],
        JsonKeys.serializableInt32Array: [STCSignedInteger32Model.shared],
        JsonKeys.serializableInt64Array: [STCSignedInteger64Model.shared],
        JsonKeys.serializableIntArray: [STCSignedIntegerModel.shared],
        JsonKeys.serializableStringArray: [STCStringModel.shared],
        JsonKeys.boolDictionary: [JsonKeys.value: true],
        JsonKeys.characterDictionary: [JsonKeys.value: Constants.characterValue],
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
        JsonKeys.serializableBoolDictionary: [JsonKeys.object: STCBoolModel.shared],
        JsonKeys.serializableCharacterDictionary: [JsonKeys.object: STCCharacterModel.shared],
        JsonKeys.serializableDoubleDictionary: [JsonKeys.object: STCDoubleModel.shared],
        JsonKeys.serializableFloatDictionary: [JsonKeys.object: STCFloatModel.shared],
        JsonKeys.serializableFloat32Dictionary: [JsonKeys.object: STCFloat32Model.shared],
        JsonKeys.serializableFloat64Dictionary: [JsonKeys.object: STCFloat64Model.shared],
        JsonKeys.serializableUInt8Dictionary: [JsonKeys.object: STCUnsignedInteger8Model.shared],
        JsonKeys.serializableUInt16Dictionary: [JsonKeys.object: STCUnsignedInteger16Model.shared],
        JsonKeys.serializableUInt32Dictionary: [JsonKeys.object: STCUnsignedInteger32Model.shared],
        JsonKeys.serializableUInt64Dictionary: [JsonKeys.object: STCUnsignedInteger64Model.shared],
        JsonKeys.serializableUIntDictionary: [JsonKeys.object: STCUnsignedIntegerModel.shared],
        JsonKeys.serializableInt8Dictionary: [JsonKeys.object: STCSignedInteger8Model.shared],
        JsonKeys.serializableInt16Dictionary: [JsonKeys.object: STCSignedInteger16Model.shared],
        JsonKeys.serializableInt32Dictionary: [JsonKeys.object: STCSignedInteger32Model.shared],
        JsonKeys.serializableInt64Dictionary: [JsonKeys.object: STCSignedInteger64Model.shared],
        JsonKeys.serializableIntDictionary: [JsonKeys.object: STCSignedIntegerModel.shared],
        JsonKeys.serializableStringDictionary: [JsonKeys.object: STCStringModel.shared],
        JsonKeys.boolSet: Set<Bool>([true]),
        JsonKeys.characterSet: Set<Character>([Constants.characterValue]),
        JsonKeys.doubleSet: Set<Double>([Constants.doubleValue]),
        JsonKeys.floatSet: Set<Float>([Constants.floatValue]),
        JsonKeys.float32Set: Set<Float32>([Constants.float32Value]),
        JsonKeys.float64Set: Set<Float64>([Constants.doubleValue]),
        JsonKeys.uinteger8Set: Set<UInt8>([UInt8.max]),
        JsonKeys.uinteger16Set: Set<UInt16>([UInt16.max]),
        JsonKeys.uinteger32Set: Set<UInt32>([UInt32.max]),
        JsonKeys.uinteger64Set: Set<UInt64>([UInt64.max]),
        JsonKeys.uintegerSet: Set<UInt>([UInt.max]),
        JsonKeys.integer8Set: Set<Int8>([Int8.max]),
        JsonKeys.integer16Set: Set<Int16>([Int16.max]),
        JsonKeys.integer32Set: Set<Int32>([Int32.max]),
        JsonKeys.integer64Set: Set<Int64>([Int64.max]),
        JsonKeys.integerSet: Set<Int>([Int.max]),
        JsonKeys.stringSet: Set<String>([Constants.stringValue]),
        JsonKeys.serializableBoolSet: Set<STCBoolModel>([STCBoolModel.shared]),
        JsonKeys.serializableCharacterSet: Set<STCCharacterModel>([STCCharacterModel.shared]),
        JsonKeys.serializableDoubleSet: Set<STCDoubleModel>([STCDoubleModel.shared]),
        JsonKeys.serializableFloatSet: Set<STCFloatModel>([STCFloatModel.shared]),
        JsonKeys.serializableFloat32Set: Set<STCFloat32Model>([STCFloat32Model.shared]),
        JsonKeys.serializableFloat64Set: Set<STCFloat64Model>([STCFloat64Model.shared]),
        JsonKeys.serializableUInt8Set: Set<STCUnsignedInteger8Model>([STCUnsignedInteger8Model.shared]),
        JsonKeys.serializableUInt16Set: Set<STCUnsignedInteger16Model>([STCUnsignedInteger16Model.shared]),
        JsonKeys.serializableUInt32Set: Set<STCUnsignedInteger32Model>([STCUnsignedInteger32Model.shared]),
        JsonKeys.serializableUInt64Set: Set<STCUnsignedInteger64Model>([STCUnsignedInteger64Model.shared]),
        JsonKeys.serializableUIntSet: Set<STCUnsignedIntegerModel>([STCUnsignedIntegerModel.shared]),
        JsonKeys.serializableInt8Set: Set<STCSignedInteger8Model>([STCSignedInteger8Model.shared]),
        JsonKeys.serializableInt16Set: Set<STCSignedInteger16Model>([STCSignedInteger16Model.shared]),
        JsonKeys.serializableInt32Set: Set<STCSignedInteger32Model>([STCSignedInteger32Model.shared]),
        JsonKeys.serializableInt64Set: Set<STCSignedInteger64Model>([STCSignedInteger64Model.shared]),
        JsonKeys.serializableIntSet: Set<STCSignedIntegerModel>([STCSignedIntegerModel.shared]),
        JsonKeys.serializableStringSet: Set<STCStringModel>([STCStringModel.shared]),
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
