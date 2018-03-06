// ----------------------------------------------------------------------------
//
//  StringConstants.swift
//
//  @author     Natalia Mamunina <___EMAIL___>
//  @copyright  Copyright (c) 2018, ___COMPANY___. All rights reserved.
//  @link       ___WEBSITE___
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

struct StringConstants {

    enum BoolValue: String {
        case bool = "bool"
        case boolOptional = "boolOpt"
        case boolImplicityUnwrapped = "boolImp"
    }

    enum SignedIntValue: String {
        case int = "int"
        case intOptional = "intOpt"
        case intImplicityUnwrapped = "intImp"

        case int8 = "int8"
        case int8Optional = "int8Opt"
        case int8ImplicityUnwrapped = "int8Imp"

        case int16 = "int16"
        case int16Optional = "int16Opt"
        case int16ImplicityUnwrapped = "int16Imp"

        case int32 = "int32"
        case int32Optional = "int32Opt"
        case int32ImplicityUnwrapped = "int32Imp"

        case int64 = "int64"
        case int64Optional = "int64Opt"
        case int64ImplicityUnwrapped = "int64Imp"
    }

    enum UnsignedIntValue: String {
        case uint = "uint"
        case uintOptional = "uintOpt"
        case uintImplicityUnwrapped = "uintImp"

        case uint8 = "uint8"
        case uint8Optional = "uint8Opt"
        case uint8ImplicityUnwrapped = "uint8Imp"

        case uint16 = "uint16"
        case uint16Optional = "uint16Opt"
        case uint16ImplicityUnwrapped = "uint16Imp"

        case uint32 = "uint32"
        case uint32Optional = "uint32Opt"
        case uint32ImplicityUnwrapped = "uint32Imp"

        case uint64 = "uint64"
        case uint64Optional = "uint64Opt"
        case uint64ImplicityUnwrapped = "uint64Imp"
    }

    enum DateValue: String {
        case date = "date"
        case dateOptional = "dateOpt"
        case dateImplicityUnwrapped = "dateImp"
    }

    enum Value: String {
        case validValue = "validValue"
        case validOptionalValue = "validOptionalValue"
        case validImplicitlyUnwrappedValue = "validImplicitlyUnwrappedValue"

        case nilValue = "nilValue"
        case emptyValue = "emptyValue"
        case notValidValue = "notValidValue"
        case NoSuchKey = "NoSuchKey"
    }

    enum XYZValues: String {
        case x = "x"
        case y = "y"
        case z = "z"
    }

    enum ArrayObjects: String {
        case validArrayObjects = "validArrayObjects"
        case validArrayOptionalObjects = "validArrayOptionalObjects"
        case validArrayImplicitlyUnwrappedObjects = "validArrayImplicitlyUnwrappedObjects"
    }

    enum SetObjects: String {
        case validSetObjects = "validSetObjects"
        case validSetOptionalObjects = "validSetOptionalObjects"
        case validSetImplicitlyUnwrappedObjects = "validSetImplicitlyUnwrappedObjects"
    }

    enum DictionaryObjects: String {
        case validDictionaryObjects = "validDictionaryObjects"
        case validDictionaryOptionalObjects = "validDictionaryOptionalObjects"
        case validDictionaryImplicitlyUnwrappedObjects = "validDictionaryImplicitlyUnwrappedObjects"

    }

    enum DictionaryArrayObjects: String {
        case validDictionaryArrayObjects = "validDictionaryArrayObjects"
        case validDictionaryArrayOptionalObjects = "validDictionaryArrayOptionalObjects"
        case validDictionaryArrayImplicitlyUnwrappedObjects = "validDictionaryArrayImplicitlyUnwrappedObjects"
    }

//    enum DoubleValue {
//        case double = "double"
//        case doubleOptional = "doubleOpt"
//        case doubleImplicityUnwrapped = "doubleImp"
//    }
//
//    enum FloatValue {
//        case float = "float"
//        case floatOptional = "floatOpt"
//        case floatImplicityUnwrapped = "floatImp"
//    }
//
//    enum StringValue {
//        case string = "string"
//        case stringOptional = "stringOpt"
//        case stringImplicityUnwrapped = "stringImp"
//    }
//
//    enum AnyObjectValue {
//        case anyObject = "anyObject"
//        case anyObjectOptional = "anyObjectOpt"
//        case anyObjectImplicitlyUnwrapped = "anyObjectImp"
//    }
//
//
//case arrayBool = "arrayBool"
//case arrayBoolOptional = "arrayBoolOpt"
//case arrayBoolImplicityUnwrapped = "arrayBoolImp"
//case arrayInt = "arrayInt"
//case arrayIntOptional = "arrayIntOpt"
//case arrayIntImplicityUnwrapped = "arrayIntImp"
//case arrayDouble = "arrayDouble"
//case arrayDoubleOptional = "arrayDoubleOpt"
//case arrayDoubleImplicityUnwrapped = "arrayDoubleImp"
//case arrayFloat = "arrayFloat"
//case arrayFloatOptional = "arrayFloatOpt"
//case arrayFloatImplicityUnwrapped = "arrayFloatImp"
//case arrayString = "arrayString"
//case arrayStringOptional = "arrayStringOpt"
//case arrayStringImplicityUnwrapped = "arrayStringImp"
//case arrayAnyObject = "arrayAnyObject"
//case arrayAnyObjectOptional = "arrayAnyObjectOpt"
//case arrayAnyObjectImplicitlyUnwrapped = "arrayAnyObjectImp"
//
//case dictBool = "dictBool"
//case dictBoolOptional = "dictBoolOpt"
//case dictBoolImplicityUnwrapped = "dictBoolImp"
//case dictInt = "dictInt"
//case dictIntOptional = "dictIntOpt"
//case dictIntImplicityUnwrapped = "dictIntImp"
//case dictDouble = "dictDouble"
//case dictDoubleOptional = "dictDoubleOpt"
//case dictDoubleImplicityUnwrapped = "dictDoubleImp"
//case dictFloat = "dictFloat"
//case dictFloatOptional = "dictFloatOpt"
//case dictFloatImplicityUnwrapped = "dictFloatImp"
//case dictString = "dictString"
//case dictStringOptional = "dictStringOpt"
//case dictStringImplicityUnwrapped = "dictStringImp"
//case dictAnyObject = "dictAnyObject"
//case dictAnyObjectOptional = "dictAnyObjectOpt"
//case dictAnyObjectImplicitlyUnwrapped = "dictAnyObjectImp"
//
//    enumInt = "enumInt"
//    enumIntOptional = "enumIntOpt"
//    enumIntImplicitlyUnwrapped = "enumIntImp"
//    enumDouble = "enumDouble"
//    enumDoubleOptional = "enumDoubleOpt"
//    enumDoubleImplicitlyUnwrapped = "enumDoubleImp"
//    enumFloat = "enumFloat"
//    enumFloatOptional = "enumFloatOpt"
//    enumFloatImplicitlyUnwrapped = "enumFloatImp"
//    enumString = "enumString"
//    enumStringOptional = "enumStringOpt"
//    enumStringImplicitlyUnwrapped = "enumStringImp"
//
//    arrayEnumInt = "arrayEnumInt"
//    arrayEnumIntOptional = "arrayEnumIntOpt"
//    arrayEnumIntImplicitlyUnwrapped = "arrayEnumIntImp"
//
//    dictEnumInt = "dictEnumInt"
//    dictEnumIntOptional = "dictEnumIntOpt"
//    dictEnumIntImplicitlyUnwrapped = "dictEnumIntImp"

}

// ----------------------------------------------------------------------------
