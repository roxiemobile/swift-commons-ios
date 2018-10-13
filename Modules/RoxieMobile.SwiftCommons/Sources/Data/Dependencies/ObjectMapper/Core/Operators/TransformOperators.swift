//
//  TransformOperators.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2016-09-26.
//  Copyright © 2016 hearst. All rights reserved.
//

import Foundation


// MARK:- Basic types with Transform

/// Object of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout Transform.Object, right: (Map, Transform)) {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout Transform.Object, right: (Map, Transform, Transform.Object?)) {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedValue: Transform.Object? = nil
            if let input = map.currentValue {
                transformedValue = transformFromJSON(map, input, transform)
            }

            let result = transformedValue ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: Transform.Object, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedObject = transformToJSON(map, left, transform)
            ToJSON.optionalBasicType(transformedObject, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional object of basic type with Transform
public func <~ <Transform: TransformType>(left: inout Transform.Object?, right: (Map, Transform)) {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout Transform.Object?, right: (Map, Transform, Transform.Object?)) {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            var transformedValue: Transform.Object? = nil
            if let input = map.currentValue {
                transformedValue = transformFromJSON(map, input, transform)
            }

            let result = transformedValue ?? defaultValue
            map.roxie_checkValue(result, optional: true, check: !defaultValue.isNone)
            left = result

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: Transform.Object?, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            var transformedObject: Transform.JSON? = nil
            if let input = left {
                transformedObject = transformToJSON(map, input, transform)
            }
            ToJSON.optionalBasicType(transformedObject, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped optional object of basic type with Transform
public func <~ <Transform: TransformType>(left: inout Transform.Object!, right: (Map, Transform)) {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout Transform.Object!, right: (Map, Transform, Transform.Object?)) {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedValue: Transform.Object? = nil
            if let input = map.currentValue {
                transformedValue = transformFromJSON(map, input, transform)
            }

            let result = transformedValue ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}
#endif


// MARK:- Array of basic types with Transform

/// Array of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [Transform.Object], right: (Map, Transform)) {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout [Transform.Object], right: (Map, Transform, [Transform.Object]?)) {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedArray: [Transform.Object]? = nil
            if let input = map.currentValue {
                transformedArray = fromJSONArrayWithTransform(map, input, transform)
            }

            let result = transformedArray ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: [Transform.Object], right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedArray = toJSONArrayWithTransform(map, left, transform)
            ToJSON.optionalBasicType(transformedArray, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional array of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [Transform.Object]?, right: (Map, Transform)) {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout [Transform.Object]?, right: (Map, Transform, [Transform.Object]?)) {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            var transformedArray: [Transform.Object]? = nil
            if let input = map.currentValue {
                transformedArray = fromJSONArrayWithTransform(map, input, transform)
            }

            let result = transformedArray ?? defaultValue
            map.roxie_checkValue(result, optional: true, check: !defaultValue.isNone)
            left = result

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: [Transform.Object]?, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            var transformedArray: [Transform.JSON]? = nil
            if let input = left {
                transformedArray = toJSONArrayWithTransform(map, input, transform)
            }
            ToJSON.optionalBasicType(transformedArray, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped optional array of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [Transform.Object]!, right: (Map, Transform)) {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout [Transform.Object]!, right: (Map, Transform, [Transform.Object]?)) {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedArray: [Transform.Object]? = nil
            if let input = map.currentValue {
                transformedArray = fromJSONArrayWithTransform(map, input, transform)
            }

            let result = transformedArray ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}
#endif


// MARK:- Dictionary of basic types with Transform

/// Dictionary of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [String: Transform.Object], right: (Map, Transform)) {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout [String: Transform.Object], right: (Map, Transform, [String: Transform.Object]?)) {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedDictionary: [String: Transform.Object]? = nil
            if let input = map.currentValue {
                transformedDictionary = fromJSONDictionaryWithTransform(map, input, transform)
            }

            let result = transformedDictionary ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: [String: Transform.Object], right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedDictionary = toJSONDictionaryWithTransform(map, left, transform)
            ToJSON.optionalBasicType(transformedDictionary, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional dictionary of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [String: Transform.Object]?, right: (Map, Transform)) {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout [String: Transform.Object]?, right: (Map, Transform, [String: Transform.Object]?)) {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            var transformedDictionary: [String: Transform.Object]? = nil
            if let input = map.currentValue {
                transformedDictionary = fromJSONDictionaryWithTransform(map, input, transform)
            }

            let result = transformedDictionary ?? defaultValue
            map.roxie_checkValue(result, optional: true, check: !defaultValue.isNone)
            left = result

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: [String: Transform.Object]?, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            var transformedDictionary: [String: Transform.JSON]? = nil
            if let input = left {
                transformedDictionary = toJSONDictionaryWithTransform(map, input, transform)
            }
            ToJSON.optionalBasicType(transformedDictionary, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped optional dictionary of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [String: Transform.Object]!, right: (Map, Transform)) {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout [String: Transform.Object]!, right: (Map, Transform, [String: Transform.Object]?)) {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedDictionary: [String: Transform.Object]? = nil
            if let input = map.currentValue {
                transformedDictionary = fromJSONDictionaryWithTransform(map, input, transform)
            }

            let result = transformedDictionary ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}
#endif


// MARK:- Set of basic types with Transform

/// Set of Mappable objects with transform
public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>, right: (Map, Transform)) {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>, right: (Map, Transform, Set<Transform.Object>?)) {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedArray: [Transform.Object]? = nil
            if let input = map.currentValue {
                transformedArray = fromJSONArrayWithTransform(map, input, transform)
            }

            let result = (transformedArray != nil ? Set(transformedArray!) : nil) ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: Set<Transform.Object>, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedSet = toJSONArrayWithTransform(map, Array(left), transform)
            ToJSON.optionalBasicType(transformedSet, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional Set of Mappable objects with transform
public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>?, right: (Map, Transform)) {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>?, right: (Map, Transform, Set<Transform.Object>?)) {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            var transformedArray: [Transform.Object]? = nil
            if let input = map.currentValue {
                transformedArray = fromJSONArrayWithTransform(map, input, transform)
            }

            let result = (transformedArray != nil ? Set(transformedArray!) : nil) ?? defaultValue
            map.roxie_checkValue(result, optional: true, check: !defaultValue.isNone)
            left = result

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: Set<Transform.Object>?, right: (Map, Transform)) {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            var transformedSet: [Transform.JSON]? = nil
            if let input = left {
                transformedSet = toJSONArrayWithTransform(map, Array(input), transform)
            }
            ToJSON.optionalBasicType(transformedSet, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped Optional set of Mappable objects with transform
public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>!, right: (Map, Transform)) {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>!, right: (Map, Transform, Set<Transform.Object>?)) {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedArray: [Transform.Object]? = nil
            if let input = map.currentValue {
                transformedArray = fromJSONArrayWithTransform(map, input, transform)
            }

            let result = (transformedArray != nil ? Set(transformedArray!) : nil) ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}
#endif


// MARK:- Mappable objects with Transform - <T: BaseMappable>

/// Object conforming to Mappable that have transforms
public func <~ <Transform: TransformType>(left: inout Transform.Object, right: (Map, Transform)) where Transform.Object: BaseMappable {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout Transform.Object, right: (Map, Transform, Transform.Object?)) where Transform.Object: BaseMappable {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedObject: Transform.Object? = nil
            if let input = map.currentValue {
                transformedObject = transformFromJSON(map, input, transform)
            }

            let result = transformedObject ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: Transform.Object, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedObject = transformToJSON(map, left, transform)
            ToJSON.optionalBasicType(transformedObject, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional Mappable objects that have transforms
public func <~ <Transform: TransformType>(left: inout Transform.Object?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout Transform.Object?, right: (Map, Transform, Transform.Object?)) where Transform.Object: BaseMappable {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            var transformedObject: Transform.Object? = nil
            if let input = map.currentValue {
                transformedObject = transformFromJSON(map, input, transform)
            }

            let result = transformedObject ?? defaultValue
            map.roxie_checkValue(result, optional: true, check: !defaultValue.isNone)
            left = result

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: Transform.Object?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            var transformedObject: Transform.JSON? = nil
            if let input = left {
                transformedObject = transformToJSON(map, input, transform)
            }
            ToJSON.optionalBasicType(transformedObject, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped optional Mappable objects that have transforms
public func <~ <Transform: TransformType>(left: inout Transform.Object!, right: (Map, Transform)) where Transform.Object: BaseMappable {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout Transform.Object!, right: (Map, Transform, Transform.Object?)) where Transform.Object: BaseMappable {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedObject: Transform.Object? = nil
            if let input = map.currentValue {
                transformedObject = transformFromJSON(map, input, transform)
            }

            let result = transformedObject ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}
#endif


// MARK:- Dictionary of Mappable objects with Transform - Dictionary<String, T: BaseMappable>

/// Dictionary of Mappable objects <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout [String: Transform.Object], right: (Map, Transform)) where Transform.Object: BaseMappable {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout [String: Transform.Object], right: (Map, Transform, [String: Transform.Object]?)) where Transform.Object: BaseMappable {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedDictionary: [String: Transform.Object]? = nil
            if let input = map.currentValue {
                transformedDictionary = fromJSONDictionaryWithTransform(map, input, transform)
            }

            let result = transformedDictionary ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: [String: Transform.Object], right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedDictionary = toJSONDictionaryWithTransform(map, left, transform)
            ToJSON.basicType(transformedDictionary, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional Dictionary of Mappable object <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout [String: Transform.Object]?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout [String: Transform.Object]?, right: (Map, Transform, [String: Transform.Object]?)) where Transform.Object: BaseMappable {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            var transformedDictionary: [String: Transform.Object]? = nil
            if let input = map.currentValue {
                transformedDictionary = fromJSONDictionaryWithTransform(map, input, transform)
            }

            let result = transformedDictionary ?? defaultValue
            map.roxie_checkValue(result, optional: true, check: !defaultValue.isNone)
            left = result

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: [String: Transform.Object]?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            var transformedDictionary: [String: Transform.JSON]? = nil
            if let input = left {
                transformedDictionary = toJSONDictionaryWithTransform(map, input, transform)
            }
            ToJSON.optionalBasicType(transformedDictionary, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout [String: Transform.Object]!, right: (Map, Transform)) where Transform.Object: BaseMappable {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout [String: Transform.Object]!, right: (Map, Transform, [String: Transform.Object]?)) where Transform.Object: BaseMappable {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedDictionary: [String: Transform.Object]? = nil
            if let input = map.currentValue {
                transformedDictionary = fromJSONDictionaryWithTransform(map, input, transform)
            }

            let result = transformedDictionary ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}
#endif


// MARK:- Array of Mappable objects with Transform - Array<T: BaseMappable>

/// Array of Mappable objects
public func <~ <Transform: TransformType>(left: inout [Transform.Object], right: (Map, Transform)) where Transform.Object: BaseMappable {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout [Transform.Object], right: (Map, Transform, [Transform.Object]?)) where Transform.Object: BaseMappable {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedArray: [Transform.Object]? = nil
            if let input = map.currentValue {
                transformedArray = fromJSONArrayWithTransform(map, input, transform)
            }

            let result = transformedArray ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: [Transform.Object], right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedArray = toJSONArrayWithTransform(map, left, transform)
            ToJSON.optionalBasicType(transformedArray, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional array of Mappable objects
public func <~ <Transform: TransformType>(left: inout [Transform.Object]?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout [Transform.Object]?, right: (Map, Transform, [Transform.Object]?)) where Transform.Object: BaseMappable {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            var transformedArray: [Transform.Object]? = nil
            if let input = map.currentValue {
                transformedArray = fromJSONArrayWithTransform(map, input, transform)
            }

            let result = transformedArray ?? defaultValue
            map.roxie_checkValue(result, optional: true, check: !defaultValue.isNone)
            left = result

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: [Transform.Object]?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            var transformedArray: [Transform.JSON]? = nil
            if let input = left {
                transformedArray = toJSONArrayWithTransform(map, input, transform)
            }
            ToJSON.optionalBasicType(transformedArray, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped Optional array of Mappable objects
public func <~ <Transform: TransformType>(left: inout [Transform.Object]!, right: (Map, Transform)) where Transform.Object: BaseMappable {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout [Transform.Object]!, right: (Map, Transform, [Transform.Object]?)) where Transform.Object: BaseMappable {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedArray: [Transform.Object]? = nil
            if let input = map.currentValue {
                transformedArray = fromJSONArrayWithTransform(map, input, transform)
            }

            let result = transformedArray ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}
#endif


// MARK:- Set of Mappable objects with Transform - Set<T: BaseMappable>

/// Set of Mappable objects with transform
public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>, right: (Map, Transform)) where Transform.Object: BaseMappable {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>, right: (Map, Transform, Set<Transform.Object>?)) where Transform.Object: BaseMappable {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedArray: [Transform.Object]? = nil
            if let input = map.currentValue {
                transformedArray = fromJSONArrayWithTransform(map, input, transform)
            }

            let result = (transformedArray != nil ? Set(transformedArray!) : nil) ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: Set<Transform.Object>, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            let transformedSet = toJSONArrayWithTransform(map, Array(left), transform)
            ToJSON.optionalBasicType(transformedSet, map: map)
            map.roxie_checkValue(left)

        default: ()
    }
}


/// Optional Set of Mappable objects with transform
public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>?, right: (Map, Transform, Set<Transform.Object>?)) where Transform.Object: BaseMappable {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            var transformedArray: [Transform.Object]? = nil
            if let input = map.currentValue {
                transformedArray = fromJSONArrayWithTransform(map, input, transform)
            }

            let result = (transformedArray != nil ? Set(transformedArray!) : nil) ?? defaultValue
            map.roxie_checkValue(result, optional: true, check: !defaultValue.isNone)
            left = result

        case .toJSON:
            left >>> (right.0, right.1)
    }
}

public func >>> <Transform: TransformType>(left: Set<Transform.Object>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
    let (map, transform) = right
    switch map.mappingType {
        case .toJSON:
            var transformedSet: [Transform.JSON]? = nil
            if let input = left {
                transformedSet = toJSONArrayWithTransform(map, Array(input), transform)
            }
            ToJSON.optionalBasicType(transformedSet, map: map)
            map.roxie_checkValue(left, optional: true)

        default: ()
    }
}


// Code targeting the Swift 4.1 compiler and below.
#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
/// Implicitly unwrapped Optional set of Mappable objects with transform
public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>!, right: (Map, Transform)) where Transform.Object: BaseMappable {
    left <~ (right.0, right.1, nil)
}

public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>!, right: (Map, Transform, Set<Transform.Object>?)) where Transform.Object: BaseMappable {
    let (map, transform, defaultValue) = right
    switch map.mappingType {
        case .fromJSON:
            map.roxie_checkInput(left, check: !defaultValue.isNone)

            var transformedArray: [Transform.Object]? = nil
            if let input = map.currentValue {
                transformedArray = fromJSONArrayWithTransform(map, input, transform)
            }

            let result = (transformedArray != nil ? Set(transformedArray!) : nil) ?? defaultValue
            map.roxie_checkValue(result, check: !defaultValue.isNone)
            left = result!

        case .toJSON:
            left >>> (right.0, right.1)
    }
}
#endif


// MARK: - Private Functions

private func transformFromJSON<Transform: TransformType>(_ map: Map, _ input: Any?, _ transform: Transform) -> Transform.Object? {
    let transformedValue = transform.transformFromJSON(input)
    map.roxie_checkValue(map.currentKey, input, transformedValue)
    return transformedValue
}

private func fromJSONArrayWithTransform<Transform: TransformType>(_ map: Map, _ input: Any, _ transform: Transform) -> [Transform.Object] {
    let transformedArray = input as? [Any]
    map.roxie_checkValue(map.currentKey, input, transformedArray)
// Code targeting the Swift 4.1 compiler and above.
#if swift(>=4.1) || (swift(>=3.3) && !swift(>=4.0))
    return (transformedArray ?? []).compactMap {
        transformFromJSON(map, $0, transform)
    }
#else
    return (transformedArray ?? []).flatMap {
        transformFromJSON(map, $0, transform)
    }
#endif
}

private func fromJSONDictionaryWithTransform<Transform: TransformType>(_ map: Map, _ input: Any, _ transform: Transform) -> [String: Transform.Object] {
    let transformedDictionary = input as? [String: Any]
    map.roxie_checkValue(map.currentKey, input, transformedDictionary)
    return (transformedDictionary ?? [:]).filterMap {
        transformFromJSON(map, $0, transform)
    }
}


private func transformToJSON<Transform: TransformType>(_ map: Map, _ input: Transform.Object?, _ transform: Transform) -> Transform.JSON? {
    let transformedValue = transform.transformToJSON(input)
    map.roxie_checkValue(map.currentKey, input, transformedValue)
    return transformedValue
}

private func toJSONArrayWithTransform<Transform: TransformType>(_ map: Map, _ input: [Transform.Object], _ transform: Transform) -> [Transform.JSON] {
// Code targeting the Swift 4.1 compiler and above.
#if swift(>=4.1) || (swift(>=3.3) && !swift(>=4.0))
    return input.compactMap {
        transformToJSON(map, $0, transform)
    }
#else
    return input.flatMap {
        transformToJSON(map, $0, transform)
    }
#endif
}

private func toJSONDictionaryWithTransform<Transform: TransformType>(_ map: Map, _ input: [String: Transform.Object], _ transform: Transform) -> [String: Transform.JSON] {
    return input.filterMap {
        transformToJSON(map, $0, transform)
    }
}
