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

// MARK: - TypedStreamCoder models

    // Basic Types
    static let bool = "bool"
    static let double = "double"
    static let float32 = "float32"
    static let float64 = "float64"
    static let float = "float"
    static let string = "string"

// MARK: - Other Keys

    static let noSuchKey = "no_such_key"
}

// ----------------------------------------------------------------------------
