// ----------------------------------------------------------------------------
//
//  JsonKeys.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsLang

// ----------------------------------------------------------------------------

final class JsonKeys: NonCreatable
{
// MARK: - Values

    static let value = "value"
    static let otherValue = "other_value"
    static let invalidValue = "invalid_value"
    static let nilValue = "nil_value"

// MARK: - Objects

    static let object = "object"
    static let otherObject = "other_object"
    static let invalidObject = "invalid_object"
    static let nilObject = "nil_object"

// MARK: - Arrays of objects

    static let array = "array"
    static let otherArray = "other_array"
    static let invalidArray = "invalid_array"
    static let emptyArray = "empty_array"
    static let nilArray = "nil_array"

// MARK: - Dictionaries of objects

    static let dictionary = "dictionary"
    static let otherDictionary = "other_dictionary"
    static let invalidDictionary = "invalid_dictionary"
    static let emptyDictionary = "empty_dictionary"
    static let nilDictionary = "nil_dictionary"

// MARK: - Sets of objects

    static let set = "set"
    static let otherSet = "other_set"
    static let invalidSet = "invalid_set"
    static let emptySet = "empty_set"
    static let nilSet = "nil_set"

// MARK: - Signed Integers

    static let int = "int"
    static let int8 = "int8"
    static let int16 = "int16"
    static let int32 = "int32"
    static let int64 = "int64"

// MARK: - Unsigned Integers

    static let uint = "uint"
    static let uint8 = "uint8"
    static let uint16 = "uint16"
    static let uint32 = "uint32"
    static let uint64 = "uint64"

// MARK: - Vector3D models

    static let x = "x"
    static let y = "y"
    static let z = "z"

// MARK: - StreamTypedCoder models

    //Basic Types
    static let bool = "bool"
    static let character = "character"
    static let double = "double"
    static let float32 = "float32"
    static let float64 = "float64"
    static let float = "float"
    static let string = "string"

    // Serializable Objects
    static let serializableBool = "serializableBool"
    static let serializableCharacter = "serializableCharacter"
    static let serializableDouble = "serializableDouble"
    static let serializableFloat = "serializableFloat"
    static let serializableFloat32 = "serializableFloat32"
    static let serializableFloat64 = "serializableFloat64"
    static let serializableUInt8 = "serializableUInt8"
    static let serializableUInt16 = "serializableUInt16"
    static let serializableUInt32 = "serializableUInt32"
    static let serializableUInt64 = "serializableUInt64"
    static let serializableUInt = "serializableUInt"
    static let serializableInt8 = "serializableInt8"
    static let serializableInt16 = "serializableInt16"
    static let serializableInt32 = "serializableInt32"
    static let serializableInt64 = "serializableInt64"
    static let serializableInt = "serializableInt"
    static let serializableString = "serializableString"

    // Array of Basic Types
    static let boolArray = "boolArray"
    static let characterArray = "characterArray"
    static let doubleArray = "doubleArray"
    static let floatArray = "floatArray"
    static let float32Array = "float32Array"
    static let float64Array = "float64Array"
    static let uinteger8Array = "uinteger8Array"
    static let uinteger16Array = "uinteger16Array"
    static let uinteger32Array = "uinteger32Array"
    static let uinteger64Array = "uinteger64Array"
    static let uintegerArray = "uintegerArray"
    static let integer8Array = "integer8Array"
    static let integer16Array = "integer16Array"
    static let integer32Array = "integer32Array"
    static let integer64Array = "integer64Array"
    static let integerArray = "integerArray"
    static let stringArray = "stringArray"

    // Array of Serializable Objects
    static let serializableBoolArray = "serializableBoolArray"
    static let serializableCharacterArray = "serializableCharacterArray"
    static let serializableDoubleArray = "serializableDoubleArray"
    static let serializableFloatArray = "serializableFloatArray"
    static let serializableFloat32Array = "serializableFloat32Array"
    static let serializableFloat64Array = "serializableFloat64Array"
    static let serializableUInt8Array = "serializableUInt8Array"
    static let serializableUInt16Array = "serializableUInt16Array"
    static let serializableUInt32Array = "serializableUInt32Array"
    static let serializableUInt64Array = "serializableUInt64Array"
    static let serializableUIntArray = "serializableUIntArray"
    static let serializableInt8Array = "serializableInt8Array"
    static let serializableInt16Array = "serializableInt16Array"
    static let serializableInt32Array = "serializableInt32Array"
    static let serializableInt64Array = "serializableInt64Array"
    static let serializableIntArray = "serializableIntArray"
    static let serializableStringArray = "serializableStringArray"

    // Dictionary of Basic Types
    static let boolDictionary = "boolDictionary"
    static let characterDictionary = "characterDictionary"
    static let doubleDictionary = "doubleDictionary"
    static let floatDictionary = "floatDictionary"
    static let float32Dictionary = "float32Dictionary"
    static let float64Dictionary = "float64Dictionary"
    static let uinteger8Dictionary = "uinteger8Dictionary"
    static let uinteger16Dictionary = "uinteger16Dictionary"
    static let uinteger32Dictionary = "uinteger32Dictionary"
    static let uinteger64Dictionary = "uinteger64Dictionary"
    static let uintegerDictionary = "uintegerDictionary"
    static let integer8Dictionary = "integer8Dictionary"
    static let integer16Dictionary = "integer16Dictionary"
    static let integer32Dictionary = "integer32Dictionary"
    static let integer64Dictionary = "integer64Dictionary"
    static let integerDictionary = "integerDictionary"
    static let stringDictionary = "stringDictionary"

    // Dictionary of Serializable Objects
    static let serializableBoolDictionary = "serializableBoolDictionary"
    static let serializableCharacterDictionary = "serializableCharacterDictionary"
    static let serializableDoubleDictionary = "serializableDoubleDictionary"
    static let serializableFloatDictionary = "serializableFloatDictionary"
    static let serializableFloat32Dictionary = "serializableFloat32Dictionary"
    static let serializableFloat64Dictionary = "serializableFloat64Dictionary"
    static let serializableUInt8Dictionary = "serializableUInt8Dictionary"
    static let serializableUInt16Dictionary = "serializableUInt16Dictionary"
    static let serializableUInt32Dictionary = "serializableUInt32Dictionary"
    static let serializableUInt64Dictionary = "serializableUInt64Dictionary"
    static let serializableUIntDictionary = "serializableUIntDictionary"
    static let serializableInt8Dictionary = "serializableInt8Dictionary"
    static let serializableInt16Dictionary = "serializableInt16Dictionary"
    static let serializableInt32Dictionary = "serializableInt32Dictionary"
    static let serializableInt64Dictionary = "serializableInt64Dictionary"
    static let serializableIntDictionary = "serializableIntDictionary"
    static let serializableStringDictionary = "serializableStringDictionary"

    // Set of Basic Types
    static let boolSet = "boolSet"
    static let characterSet = "characterSet"
    static let doubleSet = "doubleSet"
    static let floatSet = "floatSet"
    static let float32Set = "float32Set"
    static let float64Set = "float64Set"
    static let uinteger8Set = "uinteger8Set"
    static let uinteger16Set = "uinteger16Set"
    static let uinteger32Set = "uinteger32Set"
    static let uinteger64Set = "uinteger64Set"
    static let uintegerSet = "uintegerSet"
    static let integer8Set = "integer8Set"
    static let integer16Set = "integer16Set"
    static let integer32Set = "integer32Set"
    static let integer64Set = "integer64Set"
    static let integerSet = "integerSet"
    static let stringSet = "stringSet"

    // Set of Serializable Objects
    static let serializableBoolSet = "serializableBoolSet"
    static let serializableCharacterSet = "serializableCharacterSet"
    static let serializableDoubleSet = "serializableDoubleSet"
    static let serializableFloatSet = "serializableFloatSet"
    static let serializableFloat32Set = "serializableFloat32Set"
    static let serializableFloat64Set = "serializableFloat64Set"
    static let serializableUInt8Set = "serializableUInt8Set"
    static let serializableUInt16Set = "serializableUInt16Set"
    static let serializableUInt32Set = "serializableUInt32Set"
    static let serializableUInt64Set = "serializableUInt64Set"
    static let serializableUIntSet = "serializableUIntSet"
    static let serializableInt8Set = "serializableInt8Set"
    static let serializableInt16Set = "serializableInt16Set"
    static let serializableInt32Set = "serializableInt32Set"
    static let serializableInt64Set = "serializableInt64Set"
    static let serializableIntSet = "serializableIntSet"
    static let serializableStringSet = "serializableStringSet"

// MARK: - Other Keys

    static let noSuchKey = "no_such_key"
}

// ----------------------------------------------------------------------------
