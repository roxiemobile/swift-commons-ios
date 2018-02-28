//
//  TransformOperators.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2016-09-26.
//  Copyright © 2016 hearst. All rights reserved.
//

import Foundation

// MARK:- Transforms

/// Object of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout Transform.Object, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let transformedValue = transform.transformFromJSON(map.currentValue)
            map.roxie_checkValue(transformedValue)
            left = transformedValue!

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: Transform.Object, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedObject = transform.transformToJSON(left)
            ToJSON.optionalBasicType(transformedObject, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional object of basic type with Transform
public func <~ <Transform: TransformType>(left: inout Transform.Object?, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            let transformedValue = transform.transformFromJSON(map.currentValue)
            map.roxie_checkValue(transformedValue, optional: true)
            left = transformedValue

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: Transform.Object?, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedObject = transform.transformToJSON(left)
            ToJSON.optionalBasicType(transformedObject, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


/// Implicitly unwrapped optional object of basic type with Transform
public func <~ <Transform: TransformType>(left: inout Transform.Object!, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let transformedValue = transform.transformFromJSON(map.currentValue)
            map.roxie_checkValue(transformedValue)
            left = transformedValue!

        case .toJSON:
            left >>> right
    }
}

/// Array of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [Transform.Object], right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let transformedArray = fromJSONArrayWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedArray)
            left = transformedArray!

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: [Transform.Object], right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedArray = toJSONArrayWithTransform(map, left, transform: transform)
            ToJSON.optionalBasicType(transformedArray, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional array of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [Transform.Object]?, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            let transformedArray = fromJSONArrayWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedArray, optional: true)
            left = transformedArray

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: [Transform.Object]?, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedArray = toJSONArrayWithTransform(map, left, transform: transform)
            ToJSON.optionalBasicType(transformedArray, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


/// Implicitly unwrapped optional array of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [Transform.Object]!, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let transformedArray = fromJSONArrayWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedArray)
            left = transformedArray!

        case .toJSON:
            left >>> right
    }
}

/// Dictionary of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [String: Transform.Object], right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let transformedDictionary = fromJSONDictionaryWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedDictionary)
            left = transformedDictionary!

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: [String: Transform.Object], right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedDictionary = toJSONDictionaryWithTransform(map, left, transform: transform)
            ToJSON.optionalBasicType(transformedDictionary, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional dictionary of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [String: Transform.Object]?, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            let transformedDictionary = fromJSONDictionaryWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedDictionary, optional: true)
            left = transformedDictionary

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: [String: Transform.Object]?, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedDictionary = toJSONDictionaryWithTransform(map, left, transform: transform)
            ToJSON.optionalBasicType(transformedDictionary, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


/// Implicitly unwrapped optional dictionary of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [String: Transform.Object]!, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let transformedDictionary = fromJSONDictionaryWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedDictionary)
            left = transformedDictionary!

        case .toJSON:
            left >>> right
    }
}

// MARK:- Transforms of Mappable Objects - <T: BaseMappable>

/// Object conforming to Mappable that have transforms
public func <~ <Transform: TransformType>(left: inout Transform.Object, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let transformedObject = transform.transformFromJSON(map.currentValue)
            map.roxie_checkValue(transformedObject)
            left = transformedObject!

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: Transform.Object, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedObject = transform.transformToJSON(left)
            ToJSON.optionalBasicType(transformedObject, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional Mappable objects that have transforms
public func <~ <Transform: TransformType>(left: inout Transform.Object?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            let transformedObject = transform.transformFromJSON(map.currentValue)
            map.roxie_checkValue(transformedObject, optional: true)
            left = transformedObject

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: Transform.Object?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedObject = transform.transformToJSON(left)
            ToJSON.optionalBasicType(transformedObject, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


/// Implicitly unwrapped optional Mappable objects that have transforms
public func <~ <Transform: TransformType>(left: inout Transform.Object!, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let transformedObject = transform.transformFromJSON(map.currentValue)
            map.roxie_checkValue(transformedObject)
            left = transformedObject!

        case .toJSON:
            left >>> right
    }
}


// MARK:- Dictionary of Mappable objects with a transform - Dictionary<String, T: BaseMappable>

/// Dictionary of Mappable objects <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout Dictionary<String, Transform.Object>, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let transformedDictionary = fromJSONDictionaryWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedDictionary)
            left = transformedDictionary!

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: Dictionary<String, Transform.Object>, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedDictionary = toJSONDictionaryWithTransform(map, left, transform: transform)
            ToJSON.basicType(transformedDictionary, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional Dictionary of Mappable object <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout Dictionary<String, Transform.Object>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            let transformedDictionary = fromJSONDictionaryWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedDictionary, optional: true)
            left = transformedDictionary

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: Dictionary<String, Transform.Object>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedDictionary = toJSONDictionaryWithTransform(map, left, transform: transform)
            ToJSON.optionalBasicType(transformedDictionary, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


/// Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout Dictionary<String, Transform.Object>!, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let transformedDictionary = fromJSONDictionaryWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedDictionary)
            left = transformedDictionary!

        case .toJSON:
            left >>> right
    }
}

/// Dictionary of Mappable objects <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout Dictionary<String, [Transform.Object]>, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let dictionary = map.currentValue as? [String: [Any]]
            let transformedDictionary = dictionary?.map {
                (arg: (key: String, values: [Any])) -> (String, [Transform.Object]) in

                let (key, values) = arg
                if let jsonArray = fromJSONArrayWithTransform(map, values, transform: transform) {
                    return (key, jsonArray)
                }
                if let leftValue = left[key] {
                    return (key, leftValue)
                }
                return (key, [])
            }
            map.roxie_checkValue(transformedDictionary)
            left = transformedDictionary!

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: Dictionary<String, [Transform.Object]>, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedDictionary = left.map { (arg: (key: String, value: [Transform.Object])) in
                return (arg.key, toJSONArrayWithTransform(map, arg.value, transform: transform) ?? [])
            }
            ToJSON.basicType(transformedDictionary, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional Dictionary of Mappable object <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout Dictionary<String, [Transform.Object]>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            let dictionary = map.currentValue as? [String: [Any]]
            let transformedDictionary = dictionary?.map {
                (arg: (key: String, values: [Any])) -> (String, [Transform.Object]) in

                let (key, values) = arg
                if let jsonArray = fromJSONArrayWithTransform(map, values, transform: transform) {
                    return (key, jsonArray)
                }
                if let leftValue = left?[key] {
                    return (key, leftValue)
                }
                return (key, [])
            }
            map.roxie_checkValue(transformedDictionary, optional: true)
            left = transformedDictionary

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: Dictionary<String, [Transform.Object]>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedDictionary = left?.map { (arg: (key: String, values: [Transform.Object])) in
                return (arg.key, toJSONArrayWithTransform(map, arg.values, transform: transform) ?? [])
            }
            ToJSON.optionalBasicType(transformedDictionary, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


/// Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout Dictionary<String, [Transform.Object]>!, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let dictionary = map.currentValue as? [String: [Any]]
            let transformedDictionary = dictionary?.map {
                (arg: (key: String, values: [Any])) -> (String, [Transform.Object]) in

                let (key, values) = arg
                if let jsonArray = fromJSONArrayWithTransform(map, values, transform: transform) {
                    return (key, jsonArray)
                }
                if let leftValue = left?[key] {
                    return (key, leftValue)
                }
                return (key, [])
            }
            map.roxie_checkValue(transformedDictionary)
            left = transformedDictionary!

        case .toJSON:
            left >>> right
    }
}

// MARK:- Array of Mappable objects with transforms - Array<T: BaseMappable>

/// Array of Mappable objects
public func <~ <Transform: TransformType>(left: inout Array<Transform.Object>, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let transformedArray = fromJSONArrayWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedArray)
            left = transformedArray!

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: Array<Transform.Object>, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedArray = toJSONArrayWithTransform(map, left, transform: transform)
            ToJSON.optionalBasicType(transformedArray, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional array of Mappable objects
public func <~ <Transform: TransformType>(left: inout Array<Transform.Object>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            let transformedArray = fromJSONArrayWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedArray, optional: true)
            left = transformedArray

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: Array<Transform.Object>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedArray = toJSONArrayWithTransform(map, left, transform: transform)
            ToJSON.optionalBasicType(transformedArray, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


/// Implicitly unwrapped Optional array of Mappable objects
public func <~ <Transform: TransformType>(left: inout Array<Transform.Object>!, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let transformedArray = fromJSONArrayWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedArray)
            left = transformedArray!

        case .toJSON:
            left >>> right
    }
}

// MARK:- Array of Array of objects - Array<Array<T>>> with transforms

/// Array of Array of objects with transform
public func <~ <Transform: TransformType>(left: inout [[Transform.Object]], right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let array = map.currentValue as? [[Any]]
            let transformedArray = array?.flatMap { values in
                return fromJSONArrayWithTransform(map, values as Any?, transform: transform)
            }
            map.roxie_checkValue(transformedArray)
            left = transformedArray!

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: [[Transform.Object]], right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedArray = left.flatMap { values in
                return toJSONArrayWithTransform(map, values, transform: transform)
            }
            ToJSON.basicType(transformedArray, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}

/// Optional array of array of objects with transform
public func <~ <Transform: TransformType>(left: inout [[Transform.Object]]?, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            let array = map.currentValue as? [[Any]]
            let transformedArray = array?.flatMap { values in
                return fromJSONArrayWithTransform(map, values as Any?, transform: transform)
            }
            map.roxie_checkValue(transformedArray, optional: true)
            left = transformedArray

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: [[Transform.Object]]?, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedArray = left?.flatMap { values in
                return toJSONArrayWithTransform(map, values, transform: transform)
            }
            ToJSON.optionalBasicType(transformedArray, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


/// Implicitly unwrapped Optional array of array of objects with transform
public func <~ <Transform: TransformType>(left: inout [[Transform.Object]]!, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let array = map.currentValue as? [[Any]]
            let transformedArray = array?.flatMap { values in
                return fromJSONArrayWithTransform(map, values as Any?, transform: transform)
            }
            map.roxie_checkValue(transformedArray)
            left = transformedArray!

        case .toJSON:
            left >>> right
    }
}

// MARK:- Set of Mappable objects with a transform - Set<T: BaseMappable>

/// Set of Mappable objects with transform
public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let transformedArray = fromJSONArrayWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedArray)
            left = Set(transformedArray!)

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: Set<Transform.Object>, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedSet = toJSONArrayWithTransform(map, Array(left), transform: transform)
            ToJSON.optionalBasicType(transformedSet, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional Set of Mappable objects with transform
public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            let transformedArray = fromJSONArrayWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedArray, optional: true)
            left = (transformedArray != nil) ? Set(transformedArray!) : nil

        case .toJSON:
            left >>> right
    }
}

public func >>> <Transform: TransformType>(left: Set<Transform.Object>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedSet = toJSONArrayWithTransform(map, Array(left ?? []), transform: transform)
            ToJSON.optionalBasicType(transformedSet, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


/// Implicitly unwrapped Optional set of Mappable objects with transform
public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>!, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkState(left)
            let transformedArray = fromJSONArrayWithTransform(map, map.currentValue, transform: transform)
            map.roxie_checkValue(transformedArray)
            left = Set(transformedArray!)

        case .toJSON:
            left >>> right
    }
}


// MARK:- Private Functions

private func fromJSONArrayWithTransform<Transform: TransformType>(_ map: Map, _ input: Any?, transform: Transform) -> [Transform.Object]? {
    let array = input as? [Any]
    return array?.flatMap { value in
        let transformedValue = transform.transformFromJSON(value)
        map.roxie_checkValue(map.currentKey, value, transformedValue)
        return transformedValue
    }
}

private func fromJSONDictionaryWithTransform<Transform: TransformType>(_ map: Map, _ input: Any?, transform: Transform) -> [String: Transform.Object]? {
    let dictionary = input as? [String: Any]
    return dictionary?.filterMap { value in
        let transformedValue = transform.transformFromJSON(value)
        map.roxie_checkValue(map.currentKey, value, transformedValue)
        return transformedValue
    }
}

private func toJSONArrayWithTransform<Transform: TransformType>(_ map: Map, _ input: [Transform.Object]?, transform: Transform) -> [Transform.JSON]? {
    return input?.flatMap { value in
        let transformedValue = transform.transformToJSON(value)
        map.roxie_checkValue(map.currentKey, value, transformedValue)
        return transformedValue
    }
}

private func toJSONDictionaryWithTransform<Transform: TransformType>(_ map: Map, _ input: [String: Transform.Object]?, transform: Transform) -> [String: Transform.JSON]? {
    return input?.filterMap { value in
        let transformedValue = transform.transformToJSON(value)
        map.roxie_checkValue(map.currentKey, value, transformedValue)
        return transformedValue
    }
}
