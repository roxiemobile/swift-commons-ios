// ----------------------------------------------------------------------------
//
//  STCMixedModel.swift
//
//  @author     Natalia Mamunina <mamunina-nv@roxiemobile.com>
//  @copyright  Copyright (c) 2019, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.ru/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

class STCMixedModel: ValidatableModel
{
// MARK: - Construction

    static let shared = try! STCMixedModel(from: Constants.dictionarySTCMixed)

// MARK: - Properties

    // Basic Types

    fileprivate(set) var bool: Bool?

    fileprivate(set) var double: Double?

    fileprivate(set) var float: Float?

    fileprivate(set) var float32: Float32?

    fileprivate(set) var float64: Float64?

    fileprivate(set) var uinteger8: UInt8?

    fileprivate(set) var uinteger16: UInt16?

    fileprivate(set) var uinteger32: UInt32?

    fileprivate(set) var uinteger64: UInt64?

    fileprivate(set) var uinteger: UInt?

    fileprivate(set) var integer8: Int8?

    fileprivate(set) var integer16: Int16?

    fileprivate(set) var integer32: Int32?

    fileprivate(set) var integer64: Int64?

    fileprivate(set) var integer: Int?

    fileprivate(set) var string: String?

    // Serializable Objects

    fileprivate(set) var serializableBool: STCBoolModel?

    fileprivate(set) var serializableDouble: STCDoubleModel?

    fileprivate(set) var serializableFloat: STCFloatModel?

    fileprivate(set) var serializableFloat32: STCFloat32Model?

    fileprivate(set) var serializableFloat64: STCFloat64Model?

    fileprivate(set) var serializableUInt8: STCUnsignedInteger8Model?

    fileprivate(set) var serializableUInt16: STCUnsignedInteger16Model?

    fileprivate(set) var serializableUInt32: STCUnsignedInteger32Model?

    fileprivate(set) var serializableUInt64: STCUnsignedInteger64Model?

    fileprivate(set) var serializableUInt: STCUnsignedIntegerModel?

    fileprivate(set) var serializableInt8: STCSignedInteger8Model?

    fileprivate(set) var serializableInt16: STCSignedInteger16Model?

    fileprivate(set) var serializableInt32: STCSignedInteger32Model?

    fileprivate(set) var serializableInt64: STCSignedInteger64Model?

    fileprivate(set) var serializableInt: STCSignedIntegerModel?

    fileprivate(set) var serializableString: STCStringModel?

    // Array of Basic Types

    fileprivate(set) var boolArray: [Bool]?

    fileprivate(set) var doubleArray: [Double]?

    fileprivate(set) var floatArray: [Float]?

    fileprivate(set) var float32Array: [Float32]?

    fileprivate(set) var float64Array: [Float64]?

    fileprivate(set) var uinteger8Array: [UInt8]?

    fileprivate(set) var uinteger16Array: [UInt16]?

    fileprivate(set) var uinteger32Array: [UInt32]?

    fileprivate(set) var uinteger64Array: [UInt64]?

    fileprivate(set) var uintegerArray: [UInt]?

    fileprivate(set) var integer8Array: [Int8]?

    fileprivate(set) var integer16Array: [Int16]?

    fileprivate(set) var integer32Array: [Int32]?

    fileprivate(set) var integer64Array: [Int64]?

    fileprivate(set) var integerArray: [Int]?

    fileprivate(set) var stringArray: [String]?

    // Array of Serializable Objects

    fileprivate(set) var serializableBoolArray: [STCBoolModel]?

    fileprivate(set) var serializableDoubleArray: [STCDoubleModel]?

    fileprivate(set) var serializableFloatArray: [STCFloatModel]?

    fileprivate(set) var serializableFloat32Array: [STCFloat32Model]?

    fileprivate(set) var serializableFloat64Array: [STCFloat64Model]?

    fileprivate(set) var serializableUInt8Array: [STCUnsignedInteger8Model]?

    fileprivate(set) var serializableUInt16Array: [STCUnsignedInteger16Model]?

    fileprivate(set) var serializableUInt32Array: [STCUnsignedInteger32Model]?

    fileprivate(set) var serializableUInt64Array: [STCUnsignedInteger64Model]?

    fileprivate(set) var serializableUIntArray: [STCUnsignedIntegerModel]?

    fileprivate(set) var serializableInt8Array: [STCSignedInteger8Model]?

    fileprivate(set) var serializableInt16Array: [STCSignedInteger16Model]?

    fileprivate(set) var serializableInt32Array: [STCSignedInteger32Model]?

    fileprivate(set) var serializableInt64Array: [STCSignedInteger64Model]?

    fileprivate(set) var serializableIntArray: [STCSignedIntegerModel]?

    fileprivate(set) var serializableStringArray: [STCStringModel]?

    // Dictionary of Basic Types

    fileprivate(set) var boolDictionary: [String: Bool]?

    fileprivate(set) var doubleDictionary: [String: Double]?

    fileprivate(set) var floatDictionary: [String: Float]?

    fileprivate(set) var float32Dictionary: [String: Float32]?

    fileprivate(set) var float64Dictionary: [String: Float64]?

    fileprivate(set) var uinteger8Dictionary: [String: UInt8]?

    fileprivate(set) var uinteger16Dictionary: [String: UInt16]?

    fileprivate(set) var uinteger32Dictionary: [String: UInt32]?

    fileprivate(set) var uinteger64Dictionary: [String: UInt64]?

    fileprivate(set) var uintegerDictionary: [String: UInt]?

    fileprivate(set) var integer8Dictionary: [String: Int8]?

    fileprivate(set) var integer16Dictionary: [String: Int16]?

    fileprivate(set) var integer32Dictionary: [String: Int32]?

    fileprivate(set) var integer64Dictionary: [String: Int64]?

    fileprivate(set) var integerDictionary: [String: Int]?

    fileprivate(set) var stringDictionary: [String: String]?

    // Dictionary of Serializable Objects

    fileprivate(set) var serializableBoolDictionary: [String: STCBoolModel]?

    fileprivate(set) var serializableDoubleDictionary: [String: STCDoubleModel]?

    fileprivate(set) var serializableFloatDictionary: [String: STCFloatModel]?

    fileprivate(set) var serializableFloat32Dictionary: [String: STCFloat32Model]?

    fileprivate(set) var serializableFloat64Dictionary: [String: STCFloat64Model]?

    fileprivate(set) var serializableUInt8Dictionary: [String: STCUnsignedInteger8Model]?

    fileprivate(set) var serializableUInt16Dictionary: [String: STCUnsignedInteger16Model]?

    fileprivate(set) var serializableUInt32Dictionary: [String: STCUnsignedInteger32Model]?

    fileprivate(set) var serializableUInt64Dictionary: [String: STCUnsignedInteger64Model]?

    fileprivate(set) var serializableUIntDictionary: [String: STCUnsignedIntegerModel]?

    fileprivate(set) var serializableInt8Dictionary: [String: STCSignedInteger8Model]?

    fileprivate(set) var serializableInt16Dictionary: [String: STCSignedInteger16Model]?

    fileprivate(set) var serializableInt32Dictionary: [String: STCSignedInteger32Model]?

    fileprivate(set) var serializableInt64Dictionary: [String: STCSignedInteger64Model]?

    fileprivate(set) var serializableIntDictionary: [String: STCSignedIntegerModel]?

    fileprivate(set) var serializableStringDictionary: [String: STCStringModel]?

// MARK: - Methods

    open override func map(with map: Map) {
        super.map(with: map)

        // (De)serialize to/from json
        self.bool                            <~ map[JsonKeys.bool]
        self.double                          <~ map[JsonKeys.double]
        self.float                           <~ map[JsonKeys.float]
        self.float32                         <~ map[JsonKeys.float32]
        self.float64                         <~ map[JsonKeys.float64]
        self.uinteger8                       <~ map[JsonKeys.uint8]
        self.uinteger16                      <~ map[JsonKeys.uint16]
        self.uinteger32                      <~ map[JsonKeys.uint32]
        self.uinteger64                      <~ map[JsonKeys.uint64]
        self.uinteger                        <~ map[JsonKeys.uint]
        self.integer8                        <~ map[JsonKeys.int8]
        self.integer16                       <~ map[JsonKeys.int16]
        self.integer32                       <~ map[JsonKeys.int32]
        self.integer64                       <~ map[JsonKeys.int64]
        self.integer                         <~ map[JsonKeys.int]
        self.string                          <~ map[JsonKeys.string]

        // Serializable Objects
        self.serializableBool                <~ map[JsonKeys.serializableBool]
        self.serializableDouble              <~ map[JsonKeys.serializableDouble]
        self.serializableFloat               <~ map[JsonKeys.serializableFloat]
        self.serializableFloat32             <~ map[JsonKeys.serializableFloat32]
        self.serializableFloat64             <~ map[JsonKeys.serializableFloat64]
        self.serializableUInt8               <~ map[JsonKeys.serializableUInt8]
        self.serializableUInt16              <~ map[JsonKeys.serializableUInt16]
        self.serializableUInt32              <~ map[JsonKeys.serializableUInt32]
        self.serializableUInt64              <~ map[JsonKeys.serializableUInt64]
        self.serializableUInt                <~ map[JsonKeys.serializableUInt]
        self.serializableInt8                <~ map[JsonKeys.serializableInt8]
        self.serializableInt16               <~ map[JsonKeys.serializableInt16]
        self.serializableInt32               <~ map[JsonKeys.serializableInt32]
        self.serializableInt64               <~ map[JsonKeys.serializableInt64]
        self.serializableInt                 <~ map[JsonKeys.serializableInt]
        self.serializableString              <~ map[JsonKeys.serializableString]

        // Array of Basic Types
        self.boolArray                       <~ map[JsonKeys.boolArray]
        self.doubleArray                     <~ map[JsonKeys.doubleArray]
        self.floatArray                      <~ map[JsonKeys.floatArray]
        self.float32Array                    <~ map[JsonKeys.float32Array]
        self.float64Array                    <~ map[JsonKeys.float64Array]
        self.uinteger8Array                  <~ map[JsonKeys.uinteger8Array]
        self.uinteger16Array                 <~ map[JsonKeys.uinteger16Array]
        self.uinteger32Array                 <~ map[JsonKeys.uinteger32Array]
        self.uinteger64Array                 <~ map[JsonKeys.uinteger64Array]
        self.uintegerArray                   <~ map[JsonKeys.uintegerArray]
        self.integer8Array                   <~ map[JsonKeys.integer8Array]
        self.integer16Array                  <~ map[JsonKeys.integer16Array]
        self.integer32Array                  <~ map[JsonKeys.integer32Array]
        self.integer64Array                  <~ map[JsonKeys.integer64Array]
        self.integerArray                    <~ map[JsonKeys.integerArray]
        self.stringArray                     <~ map[JsonKeys.stringArray]

        // Array of Serializable Objects
        self.serializableBoolArray           <~ map[JsonKeys.serializableBoolArray]
        self.serializableDoubleArray         <~ map[JsonKeys.serializableDoubleArray]
        self.serializableFloatArray          <~ map[JsonKeys.serializableFloatArray]
        self.serializableFloat32Array        <~ map[JsonKeys.serializableFloat32Array]
        self.serializableFloat64Array        <~ map[JsonKeys.serializableFloat64Array]
        self.serializableUInt8Array          <~ map[JsonKeys.serializableUInt8Array]
        self.serializableUInt16Array         <~ map[JsonKeys.serializableUInt16Array]
        self.serializableUInt32Array         <~ map[JsonKeys.serializableUInt32Array]
        self.serializableUInt64Array         <~ map[JsonKeys.serializableUInt64Array]
        self.serializableUIntArray           <~ map[JsonKeys.serializableUIntArray]
        self.serializableInt8Array           <~ map[JsonKeys.serializableInt8Array]
        self.serializableInt16Array          <~ map[JsonKeys.serializableInt16Array]
        self.serializableInt32Array          <~ map[JsonKeys.serializableInt32Array]
        self.serializableInt64Array          <~ map[JsonKeys.serializableInt64Array]
        self.serializableIntArray            <~ map[JsonKeys.serializableIntArray]
        self.serializableStringArray         <~ map[JsonKeys.serializableStringArray]

        // Dictionary of Basic Types
        self.boolDictionary                  <~ map[JsonKeys.boolDictionary]
        self.doubleDictionary                <~ map[JsonKeys.doubleDictionary]
        self.floatDictionary                 <~ map[JsonKeys.floatDictionary]
        self.float32Dictionary               <~ map[JsonKeys.float32Dictionary]
        self.float64Dictionary               <~ map[JsonKeys.float64Dictionary]
        self.uinteger8Dictionary             <~ map[JsonKeys.uinteger8Dictionary]
        self.uinteger16Dictionary            <~ map[JsonKeys.uinteger16Dictionary]
        self.uinteger32Dictionary            <~ map[JsonKeys.uinteger32Dictionary]
        self.uinteger64Dictionary            <~ map[JsonKeys.uinteger64Dictionary]
        self.uintegerDictionary              <~ map[JsonKeys.uintegerDictionary]
        self.integer8Dictionary              <~ map[JsonKeys.integer8Dictionary]
        self.integer16Dictionary             <~ map[JsonKeys.integer16Dictionary]
        self.integer32Dictionary             <~ map[JsonKeys.integer32Dictionary]
        self.integer64Dictionary             <~ map[JsonKeys.integer64Dictionary]
        self.integerDictionary               <~ map[JsonKeys.integerDictionary]
        self.stringDictionary                <~ map[JsonKeys.stringDictionary]

        // Dictionary of Serializable Objects
        self.serializableBoolDictionary      <~ map[JsonKeys.serializableBoolDictionary]
        self.serializableDoubleDictionary    <~ map[JsonKeys.serializableDoubleDictionary]
        self.serializableFloatDictionary     <~ map[JsonKeys.serializableFloatDictionary]
        self.serializableFloat32Dictionary   <~ map[JsonKeys.serializableFloat32Dictionary]
        self.serializableFloat64Dictionary   <~ map[JsonKeys.serializableFloat64Dictionary]
        self.serializableUInt8Dictionary     <~ map[JsonKeys.serializableUInt8Dictionary]
        self.serializableUInt16Dictionary    <~ map[JsonKeys.serializableUInt16Dictionary]
        self.serializableUInt32Dictionary    <~ map[JsonKeys.serializableUInt32Dictionary]
        self.serializableUInt64Dictionary    <~ map[JsonKeys.serializableUInt64Dictionary]
        self.serializableUIntDictionary      <~ map[JsonKeys.serializableUIntDictionary]
        self.serializableInt8Dictionary      <~ map[JsonKeys.serializableInt8Dictionary]
        self.serializableInt16Dictionary     <~ map[JsonKeys.serializableInt16Dictionary]
        self.serializableInt32Dictionary     <~ map[JsonKeys.serializableInt32Dictionary]
        self.serializableInt64Dictionary     <~ map[JsonKeys.serializableInt64Dictionary]
        self.serializableIntDictionary       <~ map[JsonKeys.serializableIntDictionary]
        self.serializableStringDictionary    <~ map[JsonKeys.serializableStringDictionary]
    }
}

// ----------------------------------------------------------------------------
