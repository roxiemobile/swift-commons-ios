//
//  Operators.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2014-10-09.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2014-2016 Hearst
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

/**
* This file defines a new operator which is used to create a mapping between an object and a JSON key value.
* There is an overloaded operator definition for each type of object that is supported in ObjectMapper.
* This provides a way to add custom logic to handle specific types of objects
*/

/// Operator used for defining mappings to and from JSON
infix operator <~

/// Operator used to define mappings to JSON
infix operator >>> 


// MARK:- Objects with Basic types

/// Object of Basic type
public func <~ <T>(left: inout T, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            right.roxie_checkInput(left)
            let result: T? = right.value()
            right.roxie_checkValue(result)
            left = result!

        case .toJSON:
            left >>> right
    }
}

public func >>> <T>(left: T, right: Map) {
    switch right.mappingType {
        case .toJSON:
            ToJSON.basicType(left, map: right)
            right.roxie_checkValue(left)

        default: ()
    }
}

/// Optional object of basic type
public func <~ <T>(left: inout T?, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            let result: T? = right.value()
            right.roxie_checkValue(result, optional: true)
            left = result

        case .toJSON:
            left >>> right
    }
}

public func >>> <T>(left: T?, right: Map) {
    switch right.mappingType {
        case .toJSON:
            ToJSON.optionalBasicType(left, map: right)
            right.roxie_checkValue(left, optional: true)

        default: ()
    }
}

// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped optional object of basic type
public func <~ <T>(left: inout T!, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            right.roxie_checkInput(left)
            let result: T? = right.value()
            right.roxie_checkValue(result)
            left = result!

        case .toJSON:
            left >>> right
    }
}
#endif


// MARK:- Mappable Objects - <T: BaseMappable>

/// Object conforming to Mappable
public func <~ <T: BaseMappable>(left: inout T, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            right.roxie_checkInput(left)
            let result = FromJSON.object(left, map: right)
            right.roxie_checkValue(result)
            left = result!

        case .toJSON:
            left >>> right
    }
}

public func >>> <T: BaseMappable>(left: T, right: Map) {
    switch right.mappingType {
        case .toJSON:
            ToJSON.object(left, map: right)
            right.roxie_checkValue(left)

        default: ()
    }
}

/// Optional Mappable objects
public func <~ <T: BaseMappable>(left: inout T?, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            let result = FromJSON.optionalObject(left, map: right)
            right.roxie_checkValue(result, optional: true)
            left = result

        case .toJSON:
            left >>> right
    }
}

public func >>> <T: BaseMappable>(left: T?, right: Map) {
    switch right.mappingType {
        case .toJSON:
            ToJSON.optionalObject(left, map: right)
            right.roxie_checkValue(left, optional: true)

        default: ()
    }
}

// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped optional Mappable objects
public func <~ <T: BaseMappable>(left: inout T!, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            right.roxie_checkInput(left)
            let result = FromJSON.implicitlyUnwrappedOptionalObject(left, map: right)
            right.roxie_checkValue(result)
            left = result!

        case .toJSON:
            left >>> right
    }
}
#endif


// MARK:- Dictionary of Mappable objects - Dictionary<String, T: BaseMappable>

/// Dictionary of Mappable objects <String, T: Mappable>
public func <~ <T: BaseMappable>(left: inout [String: T], right: Map) {
    switch right.mappingType {
        case .fromJSON:
            right.roxie_checkInput(left)
            let result = FromJSON.objectDictionary(left, map: right)
            right.roxie_checkValue(result)
            left = result!

        case .toJSON:
            left >>> right
    }
}

public func >>> <T: BaseMappable>(left: [String: T], right: Map) {
    switch right.mappingType {
        case .toJSON:
            ToJSON.objectDictionary(left, map: right)
            right.roxie_checkValue(left)

        default: ()
    }
}

/// Optional Dictionary of Mappable object <String, T: Mappable>
public func <~ <T: BaseMappable>(left: inout [String: T]?, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            let result = FromJSON.optionalObjectDictionary(left, map: right)
            right.roxie_checkValue(result, optional: true)
            left = result

        case .toJSON:
            left >>> right
    }
}

public func >>> <T: BaseMappable>(left: [String: T]?, right: Map) {
    switch right.mappingType {
        case .toJSON:
            ToJSON.optionalObjectDictionary(left, map: right)
            right.roxie_checkValue(left, optional: true)

        default: ()
    }
}

// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable>
public func <~ <T: BaseMappable>(left: inout [String: T]!, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            right.roxie_checkInput(left)
            let result = FromJSON.implicitlyUnwrappedOptionalObjectDictionary(left, map: right)
            right.roxie_checkValue(result)
            left = result!

        case .toJSON:
            left >>> right
    }
}
#endif


// MARK:- Array of Mappable objects - Array<T: BaseMappable>

/// Array of Mappable objects
public func <~ <T: BaseMappable>(left: inout [T], right: Map) {
    switch right.mappingType {
        case .fromJSON:
            right.roxie_checkInput(left)
            let result = FromJSON.objectArray(left, map: right)
            right.roxie_checkValue(result)
            left = result!

        case .toJSON:
            left >>> right
    }
}

public func >>> <T: BaseMappable>(left: [T], right: Map) {
    switch right.mappingType {
        case .toJSON:
            ToJSON.objectArray(left, map: right)
            right.roxie_checkValue(left)

        default: ()
    }
}

/// Optional array of Mappable objects
public func <~ <T: BaseMappable>(left: inout [T]?, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            let result = FromJSON.optionalObjectArray(left, map: right)
            right.roxie_checkValue(result, optional: true)
            left = result

        case .toJSON:
            left >>> right
    }
}

public func >>> <T: BaseMappable>(left: [T]?, right: Map) {
    switch right.mappingType {
        case .toJSON:
            ToJSON.optionalObjectArray(left, map: right)
            right.roxie_checkValue(left, optional: true)

        default: ()
    }
}

// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped Optional array of Mappable objects
public func <~ <T: BaseMappable>(left: inout [T]!, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            right.roxie_checkInput(left)
            let result = FromJSON.implicitlyUnwrappedOptionalObjectArray(left, map: right)
            right.roxie_checkValue(result)
            left = result!

        case .toJSON:
            left >>> right
    }
}
#endif


// MARK:- Set of Mappable objects - Set<T: BaseMappable>

/// Set of Mappable objects
public func <~ <T: BaseMappable>(left: inout Set<T>, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            right.roxie_checkInput(left)
            let result = FromJSON.objectSet(left, map: right)
            right.roxie_checkValue(result)
            left = result!

        case .toJSON:
            left >>> right
    }
}

public func >>> <T: BaseMappable>(left: Set<T>, right: Map) {
    switch right.mappingType {
        case .toJSON:
            ToJSON.objectSet(left, map: right)
            right.roxie_checkValue(left)

        default: ()
    }
}

/// Optional Set of Mappable objects
public func <~ <T: BaseMappable>(left: inout Set<T>?, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            let result = FromJSON.optionalObjectSet(left, map: right)
            right.roxie_checkValue(result, optional: true)
            left = result

        case .toJSON:
            left >>> right
    }
}

public func >>> <T: BaseMappable>(left: Set<T>?, right: Map) {
    switch right.mappingType {
        case .toJSON:
            ToJSON.optionalObjectSet(left, map: right)
            right.roxie_checkValue(left, optional: true)

        default: ()
    }
}

// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped Optional Set of Mappable objects
public func <~ <T: BaseMappable>(left: inout Set<T>!, right: Map) {
    switch right.mappingType {
        case .fromJSON:
            right.roxie_checkInput(left)
            let result = FromJSON.implicitlyUnwrappedOptionalObjectSet(left, map: right)
            right.roxie_checkValue(result)
            left = result!

        case .toJSON:
            left >>> right
    }
}
#endif
