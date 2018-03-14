// ----------------------------------------------------------------------------
//
//  JsonKeys.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsLang

// ----------------------------------------------------------------------------

internal final class JsonKeys: NonCreatable
{
// MARK: - Bool Coding Keys

    static let bool = "bool"
    static let boolOptional = "boolOpt"
    static let boolImplicitlyUnwrapped = "boolIUOpt"

// MARK: -  Signed Integer Coding Keys

    static let int = "int"
    static let intOptional = "intOpt"
    static let intImplicitlyUnwrapped = "intIUOpt"

    static let int8 = "int8"
    static let int8Optional = "int8Opt"
    static let int8ImplicitlyUnwrapped = "int8IUOpt"

    static let int16 = "int16"
    static let int16Optional = "int16Opt"
    static let int16ImplicitlyUnwrapped = "int16IUOpt"

    static let int32 = "int32"
    static let int32Optional = "int32Opt"
    static let int32ImplicitlyUnwrapped = "int32IUOpt"

    static let int64 = "int64"
    static let int64Optional = "int64Opt"
    static let int64ImplicitlyUnwrapped = "int64IUOpt"

// MARK: -  Unsigned Integer Coding Keys

    static let uint = "uint"
    static let uintOptional = "uintOpt"
    static let uintImplicitlyUnwrapped = "uintIUOpt"

    static let uint8 = "uint8"
    static let uint8Optional = "uint8Opt"
    static let uint8ImplicitlyUnwrapped = "uint8IUOpt"

    static let uint16 = "uint16"
    static let uint16Optional = "uint16Opt"
    static let uint16ImplicitlyUnwrapped = "uint16IUOpt"

    static let uint32 = "uint32"
    static let uint32Optional = "uint32Opt"
    static let uint32ImplicitlyUnwrapped = "uint32IUOpt"

    static let uint64 = "uint64"
    static let uint64Optional = "uint64Opt"
    static let uint64ImplicitlyUnwrapped = "uint64IUOpt"

// MARK: -  Date Coding Keys

    static let date = "date"
    static let dateOptional = "dateOpt"
    static let dateImplicitlyUnwrapped = "dateIUOpt"

// MARK: -  Negative Exception Coding Keys

    static let nilValue = "nilValue"
    static let emptyValue = "emptyValue"
    static let notValidValue = "notValidValue"
    static let noSuchKey = "noSuchKey"

// MARK: -  XYZ Coding Keys

    static let x = "x"
    static let y = "y"
    static let z = "z"

// MARK: -  Valid Object Coding Keys

    static let validObject = "validObject"
    static let validObjectOptional = "validOptionalObject"
    static let validObjectImplicitlyUnwrapped = "validImplicitlyUnwrappedObject"

// MARK: -  Valid Array Objects Coding Keys

    static let validArrayObjects = "validArrayObjects"
    static let validArrayOptionalObjects = "validArrayOptionalObjects"
    static let validArrayImplicitlyUnwrappedObjects = "validArrayImplicitlyUnwrappedObjects"

// MARK: -  Valid Set Objects Coding Keys

    static let validSetObjects = "validSetObjects"
    static let validSetOptionalObjects = "validSetOptionalObjects"
    static let validSetImplicitlyUnwrappedObjects = "validSetImplicitlyUnwrappedObjects"

// MARK: -  Valid Dictionary Objects Coding Keys

    static let validDictionaryObjects = "validDictionaryObjects"
    static let validDictionaryOptionalObjects = "validDictionaryOptionalObjects"
    static let validDictionaryImplicitlyUnwrappedObjects = "validDictionaryImplicitlyUnwrappedObjects"

// MARK: -  Valid Dictionary Array Objects Coding Keys

    static let validDictionaryArrayObjects = "validDictionaryArrayObjects"
    static let validDictionaryArrayOptionalObjects = "validDictionaryArrayOptionalObjects"
    static let validDictionaryArrayImplicitlyUnwrappedObjects = "validDictionaryArrayImplicitlyUnwrappedObjects"

// MARK: - Enum Coding Keys

    static let enumObject = "enumObject"
}

// ----------------------------------------------------------------------------
