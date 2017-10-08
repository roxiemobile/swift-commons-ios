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
	map.roxie_checkState()
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		let value = transform.transformFromJSON(map.currentValue)
        let value = roxie_transform(map.currentKey, map.currentValue) { transform.transformFromJSON($1) }
		FromJSON.basicType(&left, object: value)
	case .toJSON:
		left >>> right
	default: ()
	}
}

public func >>> <Transform: TransformType>(left: Transform.Object, right: (Map, Transform)) {
	let (map, transform) = right
	if map.mappingType == .toJSON {
//		let value: Transform.JSON? = transform.transformToJSON(left)
		let value = roxie_transform(map.currentKey, left) { transform.transformToJSON($1) }
		ToJSON.optionalBasicType(value, map: map)
	}
}


/// Optional object of basic type with Transform
public func <~ <Transform: TransformType>(left: inout Transform.Object?, right: (Map, Transform)) {
	let (map, transform) = right
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		let value = transform.transformFromJSON(map.currentValue)
		let value = roxie_transform(map.currentKey, map.currentValue) { transform.transformFromJSON($1) }
		FromJSON.optionalBasicType(&left, object: value)
	case .toJSON:
		left >>> right
	default: ()
	}
}

public func >>> <Transform: TransformType>(left: Transform.Object?, right: (Map, Transform)) {
	let (map, transform) = right
	if map.mappingType == .toJSON {
//		let value: Transform.JSON? = transform.transformToJSON(left)
		let value = roxie_transform(map.currentKey, left) { transform.transformToJSON($1) }
		ToJSON.optionalBasicType(value, map: map)
	}
}


/// Implicitly unwrapped optional object of basic type with Transform
public func <~ <Transform: TransformType>(left: inout Transform.Object!, right: (Map, Transform)) {
	let (map, transform) = right
	map.roxie_checkState()
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		let value = transform.transformFromJSON(map.currentValue)
		let value = roxie_transform(map.currentKey, map.currentValue) { transform.transformFromJSON($1) }
		FromJSON.optionalBasicType(&left, object: value)
	case .toJSON:
		left >>> right
	default: ()
	}
}

/// Array of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [Transform.Object], right: (Map, Transform)) {
	let (map, transform) = right
	map.roxie_checkState()
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		let values = fromJSONArrayWithTransform(map.currentValue, transform: transform)
		let values = roxie_transform(map.currentKey, map.currentValue) { fromJSONArrayWithTransform($0, $1, transform: transform) }
		FromJSON.basicType(&left, object: values)
	case .toJSON:
		left >>> right
	default: ()
	}
}

public func >>> <Transform: TransformType>(left: [Transform.Object], right: (Map, Transform)) {
	let (map, transform) = right
	if map.mappingType == .toJSON{
//		let values = toJSONArrayWithTransform(left, transform: transform)
		let values = roxie_transform(map.currentKey, left) { toJSONArrayWithTransform($0, $1, transform: transform) }
		ToJSON.optionalBasicType(values, map: map)
	}
}


/// Optional array of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [Transform.Object]?, right: (Map, Transform)) {
	let (map, transform) = right
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		let values = fromJSONArrayWithTransform(map.currentValue, transform: transform)
		let values = roxie_transform(map.currentKey, map.currentValue) { fromJSONArrayWithTransform($0, $1, transform: transform) }
		FromJSON.optionalBasicType(&left, object: values)
	case .toJSON:
		left >>> right
	default: ()
	}
}

public func >>> <Transform: TransformType>(left: [Transform.Object]?, right: (Map, Transform)) {
	let (map, transform) = right
	if map.mappingType == .toJSON {
//		let values = toJSONArrayWithTransform(left, transform: transform)
		let values = roxie_transform(map.currentKey, left) { toJSONArrayWithTransform($0, $1, transform: transform) }
		ToJSON.optionalBasicType(values, map: map)
	}
}


/// Implicitly unwrapped optional array of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [Transform.Object]!, right: (Map, Transform)) {
	let (map, transform) = right
	map.roxie_checkState()
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		let values = fromJSONArrayWithTransform(map.currentValue, transform: transform)
		let values = roxie_transform(map.currentKey, map.currentValue) { fromJSONArrayWithTransform($0, $1, transform: transform) }
		FromJSON.optionalBasicType(&left, object: values)
	case .toJSON:
		left >>> right
	default: ()
	}
}

/// Dictionary of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [String: Transform.Object], right: (Map, Transform)) {
	let (map, transform) = right
	map.roxie_checkState()
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		let values = fromJSONDictionaryWithTransform(map.currentValue, transform: transform)
		let values = roxie_transform(map.currentKey, map.currentValue) { fromJSONDictionaryWithTransform($0, $1, transform: transform) }
		FromJSON.basicType(&left, object: values)
	case .toJSON:
		left >>> right
	default: ()
	}
}

public func >>> <Transform: TransformType>(left: [String: Transform.Object], right: (Map, Transform)) {
	let (map, transform) = right
	if map.mappingType == . toJSON {
//		let values = toJSONDictionaryWithTransform(left, transform: transform)
		let values = roxie_transform(map.currentKey, left) { toJSONDictionaryWithTransform($0, $1, transform: transform) }
		ToJSON.optionalBasicType(values, map: map)
	}
}


/// Optional dictionary of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [String: Transform.Object]?, right: (Map, Transform)) {
	let (map, transform) = right
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		let values = fromJSONDictionaryWithTransform(map.currentValue, transform: transform)
		let values = roxie_transform(map.currentKey, map.currentValue) { fromJSONDictionaryWithTransform($0, $1, transform: transform) }
		FromJSON.optionalBasicType(&left, object: values)
	case .toJSON:
		left >>> right
	default: ()
	}
}

public func >>> <Transform: TransformType>(left: [String: Transform.Object]?, right: (Map, Transform)) {
	let (map, transform) = right
	if map.mappingType == .toJSON {
//		let values = toJSONDictionaryWithTransform(left, transform: transform)
		let values = roxie_transform(map.currentKey, left) { toJSONDictionaryWithTransform($0, $1, transform: transform) }
		ToJSON.optionalBasicType(values, map: map)
	}
}


/// Implicitly unwrapped optional dictionary of Basic type with Transform
public func <~ <Transform: TransformType>(left: inout [String: Transform.Object]!, right: (Map, Transform)) {
	let (map, transform) = right
	map.roxie_checkState()
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		let values = fromJSONDictionaryWithTransform(map.currentValue, transform: transform)
		let values = roxie_transform(map.currentKey, map.currentValue) { fromJSONDictionaryWithTransform($0, $1, transform: transform) }
		FromJSON.optionalBasicType(&left, object: values)
	case .toJSON:
		left >>> right
	default: ()
	}
}

// MARK:- Transforms of Mappable Objects - <T: BaseMappable>

/// Object conforming to Mappable that have transforms
public func <~ <Transform: TransformType>(left: inout Transform.Object, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	map.roxie_checkState()
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		let value: Transform.Object? = transform.transformFromJSON(map.currentValue)
		let value = roxie_transform(map.currentKey, map.currentValue) { transform.transformFromJSON($1) }
		FromJSON.basicType(&left, object: value)
	case .toJSON:
		left >>> right
	default: ()
	}
}

public func >>> <Transform: TransformType>(left: Transform.Object, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	if map.mappingType == .toJSON {
//		let value: Transform.JSON? = transform.transformToJSON(left)
		let value = roxie_transform(map.currentKey, left) { transform.transformToJSON($1) }
		ToJSON.optionalBasicType(value, map: map)
	}
}


/// Optional Mappable objects that have transforms
public func <~ <Transform: TransformType>(left: inout Transform.Object?, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		let value: Transform.Object? = transform.transformFromJSON(map.currentValue)
		let value = roxie_transform(map.currentKey, map.currentValue) { transform.transformFromJSON($1) }
		FromJSON.optionalBasicType(&left, object: value)
	case .toJSON:
		left >>> right
	default: ()
	}
}

public func >>> <Transform: TransformType>(left: Transform.Object?, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	if map.mappingType == .toJSON{
//		let value: Transform.JSON? = transform.transformToJSON(left)
		let value = roxie_transform(map.currentKey, left) { transform.transformToJSON($1) }
		ToJSON.optionalBasicType(value, map: map)
	}
}


/// Implicitly unwrapped optional Mappable objects that have transforms
public func <~ <Transform: TransformType>(left: inout Transform.Object!, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	map.roxie_checkState()
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		let value: Transform.Object? = transform.transformFromJSON(map.currentValue)
		let value = roxie_transform(map.currentKey, map.currentValue) { transform.transformFromJSON($1) }
		FromJSON.optionalBasicType(&left, object: value)
	case .toJSON:
		left >>> right
	default: ()
	}
}


// MARK:- Dictionary of Mappable objects with a transform - Dictionary<String, T: BaseMappable>

/// Dictionary of Mappable objects <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout Dictionary<String, Transform.Object>, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	map.roxie_checkState()
	if map.mappingType == .fromJSON && map.isKeyPresent,
		let object = map.currentValue as? [String: Any] {
//		let value = fromJSONDictionaryWithTransform(object as Any?, transform: transform) ?? left
		let value = roxie_transform(map.currentKey, object as Any?) { fromJSONDictionaryWithTransform($0, $1, transform: transform) } ?? left
		FromJSON.basicType(&left, object: value)
	} else if map.mappingType == .toJSON {
		left >>> right
	}
}

public func >>> <Transform: TransformType>(left: Dictionary<String, Transform.Object>, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	if map.mappingType == .toJSON {
//		let value = toJSONDictionaryWithTransform(left, transform: transform)
		let value = roxie_transform(map.currentKey, left) { toJSONDictionaryWithTransform($0, $1, transform: transform) }
		ToJSON.basicType(value, map: map)
	}
}


/// Optional Dictionary of Mappable object <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout Dictionary<String, Transform.Object>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	if map.mappingType == .fromJSON && map.isKeyPresent, let object = map.currentValue as? [String : Any]{
//		let value = fromJSONDictionaryWithTransform(object as Any?, transform: transform) ?? left
		let value = roxie_transform(map.currentKey, object as Any?) { fromJSONDictionaryWithTransform($0, $1, transform: transform) } ?? left
		FromJSON.optionalBasicType(&left, object: value)
	} else if map.mappingType == .toJSON {
		left >>> right
	}
}

public func >>> <Transform: TransformType>(left: Dictionary<String, Transform.Object>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	if map.mappingType == .toJSON {
//		let value = toJSONDictionaryWithTransform(left, transform: transform)
		let value = roxie_transform(map.currentKey, left) { toJSONDictionaryWithTransform($0, $1, transform: transform) }
		ToJSON.optionalBasicType(value, map: map)
	}
}


/// Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout Dictionary<String, Transform.Object>!, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	map.roxie_checkState()
	if map.mappingType == .fromJSON && map.isKeyPresent, let dictionary = map.currentValue as? [String : Any]{
//		let transformedDictionary = fromJSONDictionaryWithTransform(dictionary as Any?, transform: transform) ?? left
		let transformedDictionary = roxie_transform(map.currentKey, dictionary as Any?) { fromJSONDictionaryWithTransform($0, $1, transform: transform) } ?? left
		FromJSON.optionalBasicType(&left, object: transformedDictionary)
	} else if map.mappingType == .toJSON {
		left >>> right
	}
}

/// Dictionary of Mappable objects <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout Dictionary<String, [Transform.Object]>, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	map.roxie_checkState()
	
	if let dictionary = map.currentValue as? [String : [Any]], map.mappingType == .fromJSON && map.isKeyPresent {
		let transformedDictionary = dictionary.map { (arg: (key: String, values: [Any])) -> (String, [Transform.Object]) in
			let (key, values) = arg
//			if let jsonArray = fromJSONArrayWithTransform(values, transform: transform) {
			if let jsonArray = fromJSONArrayWithTransform(key, values, transform: transform) {
				return (key, jsonArray)
			}
			if let leftValue = left[key] {
				return (key, leftValue)
			}
			return (key, [])
		}
		// TODO: map.roxie_checkValue(?)
		
		FromJSON.basicType(&left, object: transformedDictionary)
	} else if map.mappingType == .toJSON {
		left >>> right
	}
}

public func >>> <Transform: TransformType>(left: Dictionary<String, [Transform.Object]>, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	
	if map.mappingType == .toJSON {
		
		let transformedDictionary = left.map { (arg: (key: String, value: [Transform.Object])) in
//			return (arg.key, toJSONArrayWithTransform(arg.value, transform: transform) ?? [])
			return (arg.key, toJSONArrayWithTransform(arg.key, arg.value, transform: transform) ?? [])
		}
		// TODO: map.roxie_checkValue(?)
		
		ToJSON.basicType(transformedDictionary, map: map)
	}
}


/// Optional Dictionary of Mappable object <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout Dictionary<String, [Transform.Object]>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	
	if let dictionary = map.currentValue as? [String : [Any]], map.mappingType == .fromJSON && map.isKeyPresent {
		
		let transformedDictionary = dictionary.map { (arg: (key: String, values: [Any])) -> (String, [Transform.Object]) in
			let (key, values) = arg
//			if let jsonArray = fromJSONArrayWithTransform(values, transform: transform) {
			if let jsonArray = fromJSONArrayWithTransform(key, values, transform: transform) {
				return (key, jsonArray)
			}
			if let leftValue = left?[key] {
				return (key, leftValue)
			}
			return (key, [])
		}
		// TODO: map.roxie_checkValue(?)
		
		FromJSON.optionalBasicType(&left, object: transformedDictionary)
	} else if map.mappingType == .toJSON {
		left >>> right
	}
}

public func >>> <Transform: TransformType>(left: Dictionary<String, [Transform.Object]>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	
	if map.mappingType == .toJSON {
		let transformedDictionary = left?.map { (arg: (key: String, values: [Transform.Object])) in
//			return (arg.key, toJSONArrayWithTransform(arg.values, transform: transform) ?? [])
			return (arg.key, toJSONArrayWithTransform(arg.key, arg.values, transform: transform) ?? [])
		}
		// TODO: map.roxie_checkValue(?)
		
		ToJSON.optionalBasicType(transformedDictionary, map: map)
	}
}


/// Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable> with a transform
public func <~ <Transform: TransformType>(left: inout Dictionary<String, [Transform.Object]>!, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	map.roxie_checkState()
	
	if let dictionary = map.currentValue as? [String : [Any]], map.mappingType == .fromJSON && map.isKeyPresent {
		let transformedDictionary = dictionary.map { (arg: (key: String, values: [Any])) -> (String, [Transform.Object]) in
			let (key, values) = arg
//			if let jsonArray = fromJSONArrayWithTransform(values, transform: transform) {
			if let jsonArray = fromJSONArrayWithTransform(key, values, transform: transform) {
				return (key, jsonArray)
			}
			if let leftValue = left?[key] {
				return (key, leftValue)
			}
			return (key, [])
		}
		// TODO: map.roxie_checkValue(?)
		FromJSON.optionalBasicType(&left, object: transformedDictionary)
	} else if map.mappingType == .toJSON {
		left >>> right
	}
}

// MARK:- Array of Mappable objects with transforms - Array<T: BaseMappable>

/// Array of Mappable objects
public func <~ <Transform: TransformType>(left: inout Array<Transform.Object>, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	map.roxie_checkState()
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		if let transformedValues = fromJSONArrayWithTransform(map.currentValue, transform: transform) {
		if let transformedValues = roxie_transform(map.currentKey, map.currentValue, block: { fromJSONArrayWithTransform($0, $1, transform: transform) }) {
			FromJSON.basicType(&left, object: transformedValues)
		}
	case .toJSON:
		left >>> right
	default: ()
	}
}

public func >>> <Transform: TransformType>(left: Array<Transform.Object>, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	if map.mappingType == .toJSON {
//		let transformedValues = toJSONArrayWithTransform(left, transform: transform)
		let transformedValues = roxie_transform(map.currentKey, left) { toJSONArrayWithTransform($0, $1, transform: transform) }
		ToJSON.optionalBasicType(transformedValues, map: map)
	}
}


/// Optional array of Mappable objects
public func <~ <Transform: TransformType>(left: inout Array<Transform.Object>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		let transformedValues = fromJSONArrayWithTransform(map.currentValue, transform: transform)
		let transformedValues = roxie_transform(map.currentKey, map.currentValue) { fromJSONArrayWithTransform($0, $1, transform: transform) }
		FromJSON.optionalBasicType(&left, object: transformedValues)
	case .toJSON:
		left >>> right
	default: ()
	}
}

public func >>> <Transform: TransformType>(left: Array<Transform.Object>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	if map.mappingType == .toJSON {
//		let transformedValues = toJSONArrayWithTransform(left, transform: transform)
		let transformedValues = roxie_transform(map.currentKey, left) { toJSONArrayWithTransform($0, $1, transform: transform) }
		ToJSON.optionalBasicType(transformedValues, map: map)
	}
}


/// Implicitly unwrapped Optional array of Mappable objects
public func <~ <Transform: TransformType>(left: inout Array<Transform.Object>!, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	map.roxie_checkState()
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		let transformedValues = fromJSONArrayWithTransform(map.currentValue, transform: transform)
		let transformedValues = roxie_transform(map.currentKey, map.currentValue) { fromJSONArrayWithTransform($0, $1, transform: transform) }
		FromJSON.optionalBasicType(&left, object: transformedValues)
	case .toJSON:
		left >>> right
	default: ()
	}
}

// MARK:- Array of Array of objects - Array<Array<T>>> with transforms

/// Array of Array of objects with transform
public func <~ <Transform: TransformType>(left: inout [[Transform.Object]], right: (Map, Transform)) {
	let (map, transform) = right
	map.roxie_checkState()
	switch map.mappingType {
	case .toJSON:
		left >>> right
	case .fromJSON where map.isKeyPresent:
		guard let original2DArray = map.currentValue as? [[Any]] else { break }
		let transformed2DArray = original2DArray.flatMap { values in
//			fromJSONArrayWithTransform(values as Any?, transform: transform)
			fromJSONArrayWithTransform(map.currentKey, values as Any?, transform: transform)
		}
		// TODO: map.roxie_checkValue(?)
		FromJSON.basicType(&left, object: transformed2DArray)
	default:
		break
	}
}

public func >>> <Transform: TransformType>(left: [[Transform.Object]], right: (Map, Transform)) {
	let (map, transform) = right
	if map.mappingType == .toJSON{
		let transformed2DArray = left.flatMap { values in
//			toJSONArrayWithTransform(values, transform: transform)
			toJSONArrayWithTransform(map.currentKey, values, transform: transform)
		}
		// TODO: map.roxie_checkValue(?)
		ToJSON.basicType(transformed2DArray, map: map)
	}
}

/// Optional array of array of objects with transform
public func <~ <Transform: TransformType>(left: inout [[Transform.Object]]?, right: (Map, Transform)) {
	let (map, transform) = right
	switch map.mappingType {
	case .toJSON:
		left >>> right
	case .fromJSON where map.isKeyPresent:
		guard let original2DArray = map.currentValue as? [[Any]] else { break }
		let transformed2DArray = original2DArray.flatMap { values in
//			fromJSONArrayWithTransform(values as Any?, transform: transform)
			fromJSONArrayWithTransform(map.currentKey, values as Any?, transform: transform)
		}
		// TODO: map.roxie_checkValue(?)
		FromJSON.optionalBasicType(&left, object: transformed2DArray)
	default:
		break
	}
}

public func >>> <Transform: TransformType>(left: [[Transform.Object]]?, right: (Map, Transform)) {
	let (map, transform) = right
	if map.mappingType == .toJSON {
		let transformed2DArray = left?.flatMap { values in
//			toJSONArrayWithTransform(values, transform: transform)
			toJSONArrayWithTransform(map.currentKey, values, transform: transform)
		}
		// TODO: map.roxie_checkValue(?)
		ToJSON.optionalBasicType(transformed2DArray, map: map)
	}
}


/// Implicitly unwrapped Optional array of array of objects with transform
public func <~ <Transform: TransformType>(left: inout [[Transform.Object]]!, right: (Map, Transform)) {
	let (map, transform) = right
	map.roxie_checkState()
	switch map.mappingType {
	case .toJSON:
		left >>> right
	case .fromJSON where map.isKeyPresent:
		guard let original2DArray = map.currentValue as? [[Any]] else { break }
		let transformed2DArray = original2DArray.flatMap { values in
//			fromJSONArrayWithTransform(values as Any?, transform: transform)
			fromJSONArrayWithTransform(map.currentKey, values as Any?, transform: transform)
		}
		// TODO: map.roxie_checkValue(?)
		FromJSON.optionalBasicType(&left, object: transformed2DArray)
	default:
		break
	}
}

// MARK:- Set of Mappable objects with a transform - Set<T: BaseMappable>

/// Set of Mappable objects with transform
public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	map.roxie_checkState()
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		if let transformedValues = fromJSONArrayWithTransform(map.currentValue, transform: transform) {
		if let transformedValues = roxie_transform(map.currentKey, map.currentValue, block: { fromJSONArrayWithTransform($0, $1, transform: transform) }) {
			FromJSON.basicType(&left, object: Set(transformedValues))
		}
	case .toJSON:
		left >>> right
	default: ()
	}
}

public func >>> <Transform: TransformType>(left: Set<Transform.Object>, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	if map.mappingType == .toJSON {
//		let transformedValues = toJSONArrayWithTransform(Array(left), transform: transform)
		let transformedValues = roxie_transform(map.currentKey, Array(left)) { toJSONArrayWithTransform($0, $1, transform: transform) }
		ToJSON.optionalBasicType(transformedValues, map: map)
	}
}


/// Optional Set of Mappable objects with transform
public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		if let transformedValues = fromJSONArrayWithTransform(map.currentValue, transform: transform) {
		if let transformedValues = roxie_transform(map.currentKey, map.currentValue, block: { fromJSONArrayWithTransform($0, $1, transform: transform) }) {
			FromJSON.basicType(&left, object: Set(transformedValues))
		}
	case .toJSON:
		left >>> right
	default: ()
	}
}

public func >>> <Transform: TransformType>(left: Set<Transform.Object>?, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	if map.mappingType == .toJSON {
		if let values = left {
//			let transformedValues = toJSONArrayWithTransform(Array(values), transform: transform)
			let transformedValues = roxie_transform(map.currentKey, Array(values)) { toJSONArrayWithTransform($0, $1, transform: transform) }
			ToJSON.optionalBasicType(transformedValues, map: map)
		}
	}
}


/// Implicitly unwrapped Optional set of Mappable objects with transform
public func <~ <Transform: TransformType>(left: inout Set<Transform.Object>!, right: (Map, Transform)) where Transform.Object: BaseMappable {
	let (map, transform) = right
	map.roxie_checkState()
	switch map.mappingType {
	case .fromJSON where map.isKeyPresent:
//		if let transformedValues = fromJSONArrayWithTransform(map.currentValue, transform: transform) {
		if let transformedValues = roxie_transform(map.currentKey, map.currentValue, block: { fromJSONArrayWithTransform($0, $1, transform: transform) }) {
			FromJSON.basicType(&left, object: Set(transformedValues))
		}
		// TODO: map.roxie_checkValue(?)
	case .toJSON:
		left >>> right
	default: ()
	}
}


//private func fromJSONArrayWithTransform<Transform: TransformType>(_ input: Any?, transform: Transform) -> [Transform.Object]? {
private func fromJSONArrayWithTransform<Transform: TransformType>(_ key: String?, _ input: Any?, transform: Transform) -> [Transform.Object]? {
	if let values = input as? [Any] {
		return values.flatMap { value in
			return transform.transformFromJSON(value)
		}
	} else {
		return nil
	}
}

//private func fromJSONDictionaryWithTransform<Transform: TransformType>(_ input: Any?, transform: Transform) -> [String: Transform.Object]? {
private func fromJSONDictionaryWithTransform<Transform: TransformType>(_ key: String?, _ input: Any?, transform: Transform) -> [String: Transform.Object]? {
	if let values = input as? [String: Any] {
		return values.filterMap { value in
			return transform.transformFromJSON(value)
		}
	} else {
		return nil
	}
}

//private func toJSONArrayWithTransform<Transform: TransformType>(_ input: [Transform.Object]?, transform: Transform) -> [Transform.JSON]? {
private func toJSONArrayWithTransform<Transform: TransformType>(_ key: String?, _ input: [Transform.Object]?, transform: Transform) -> [Transform.JSON]? {
	return input?.flatMap { value in
		return transform.transformToJSON(value)
	}
}

//private func toJSONDictionaryWithTransform<Transform: TransformType>(_ input: [String: Transform.Object]?, transform: Transform) -> [String: Transform.JSON]? {
private func toJSONDictionaryWithTransform<Transform: TransformType>(_ key: String?, _ input: [String: Transform.Object]?, transform: Transform) -> [String: Transform.JSON]? {
	return input?.filterMap { value in
		return transform.transformToJSON(value)
	}
}

// TODO:
fileprivate func roxie_transform<Ti, To>(_ key: String?, _ input: Ti?, _ file: StaticString = #file, _ line: UInt = #line, block: (String?, Ti?) -> To?) -> To? {
    var result: To?

    if let _ = input {
        if let value = block(key, input) {
            result = value
        }
        else {
            var logMessage = "Could not transform value."
            if let key = key {
                logMessage = "Could not transform value for key ‘\(key)’."
            }
            roxie_objectMapper_raiseException(message: logMessage, file: file, line: line)
        }
    }
    return result
}

