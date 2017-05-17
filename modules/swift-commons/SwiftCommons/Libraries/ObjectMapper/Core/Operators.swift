//
//  Operators.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2014-10-09.
//  Copyright (c) 2014 hearst. All rights reserved.
//

/**
* This file defines a new operator which is used to create a mapping between an object and a JSON key value.
* There is an overloaded operator definition for each type of object that is supported in ObjectMapper.
* This provides a way to add custom logic to handle specific types of objects
*/

infix operator <~

// MARK:- Objects with Basic types

/// Object of Basic type
public func <~ <T>(left: inout T, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        rxm_checkKey(right)
        FromJSON.basicType(&left, object: right.value())
    } else {
        ToJSON.basicType(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/// Optional object of basic type
public func <~ <T>(left: inout T?, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        FromJSON.optionalBasicType(&left, object: right.value())
    } else {
        ToJSON.optionalBasicType(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/// Implicitly unwrapped optional object of basic type
public func <~ <T>(left: inout T!, right: Map) {
	if right.mappingType == MappingType.FromJSON {
        rxm_checkKey(right)
		FromJSON.optionalBasicType(&left, object: right.value())
	} else {
		ToJSON.optionalBasicType(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

// MARK:- Raw Representable types

/// Object of Raw Representable type
public func <~ <T: RawRepresentable>(left: inout T, right: Map) {
	left <~ (right, EnumTransform())
}

/// Optional Object of Raw Representable type
public func <~ <T: RawRepresentable>(left: inout T?, right: Map) {
	left <~ (right, EnumTransform())
}

/// Implicitly Unwrapped Optional Object of Raw Representable type
public func <~ <T: RawRepresentable>(left: inout T!, right: Map) {
	left <~ (right, EnumTransform())
}

// MARK:- Arrays of Raw Representable type

/// Array of Raw Representable object
public func <~ <T: RawRepresentable>(left: inout [T], right: Map) {
	left <~ (right, EnumTransform())
}

/// Array of Raw Representable object
public func <~ <T: RawRepresentable>(left: inout [T]?, right: Map) {
	left <~ (right, EnumTransform())
}

/// Array of Raw Representable object
public func <~ <T: RawRepresentable>(left: inout [T]!, right: Map) {
	left <~ (right, EnumTransform())
}

// MARK:- Dictionaries of Raw Representable type

/// Dictionary of Raw Representable object
public func <~ <T: RawRepresentable>(left: inout [String: T], right: Map) {
	left <~ (right, EnumTransform())
}

/// Dictionary of Raw Representable object
public func <~ <T: RawRepresentable>(left: inout [String: T]?, right: Map) {
	left <~ (right, EnumTransform())
}

/// Dictionary of Raw Representable object
public func <~ <T: RawRepresentable>(left: inout [String: T]!, right: Map) {
	left <~ (right, EnumTransform())
}

// MARK:- Transforms

/// Object of Basic type with Transform
public func <~ <T, Transform: TransformType>(left: inout T, right: (Map, Transform)) where Transform.Object == T {
    if right.0.mappingType == MappingType.FromJSON {
        let value: T? = right.1.transformFromJSON(right.0.currentValue)
        rxm_checkTransform(right.0, value: value)
        FromJSON.basicType(&left, object: value)
    } else {
        let value: Transform.JSON? = right.1.transformToJSON(left)
        rxm_checkTransform(right.0, value: value)
        ToJSON.optionalBasicType(value, key: right.0.currentKey!, dictionary: &right.0.JSONDictionary)
    }
}

/// Optional object of basic type with Transform
public func <~ <T, Transform: TransformType>(left: inout T?, right: (Map, Transform)) where Transform.Object == T {
    if right.0.mappingType == MappingType.FromJSON {
        let value: T? = right.1.transformFromJSON(right.0.currentValue)
        FromJSON.optionalBasicType(&left, object: value)
    } else {
        let value: Transform.JSON? = right.1.transformToJSON(left)
        ToJSON.optionalBasicType(value, key: right.0.currentKey!, dictionary: &right.0.JSONDictionary)
    }
}

/// Implicitly unwrapped optional object of basic type with Transform
public func <~ <T, Transform: TransformType>(left: inout T!, right: (Map, Transform)) where Transform.Object == T {
	if right.0.mappingType == MappingType.FromJSON {
		let value: T? = right.1.transformFromJSON(right.0.currentValue)
        rxm_checkTransform(right.0, value: value)
		FromJSON.optionalBasicType(&left, object: value)
	} else {
		let value: Transform.JSON? = right.1.transformToJSON(left)
        rxm_checkTransform(right.0, value: value)
		ToJSON.optionalBasicType(value, key: right.0.currentKey!, dictionary: &right.0.JSONDictionary)
	}
}

/// Array of Basic type with Transform
public func <~ <T: TransformType>(left: inout [T.Object], right: (Map, T)) {
	let (map, transform) = right
	if map.mappingType == MappingType.FromJSON {
        rxm_checkKey(right.0)
		let values = fromJSONArrayWithTransform(map.currentValue, transform: transform)
        rxm_checkTransform(right.0, value: values)
		FromJSON.basicType(&left, object: values)
	} else {
		let values = toJSONArrayWithTransform(left, transform: transform)
        rxm_checkTransform(right.0, value: values)
		ToJSON.optionalBasicType(values, key: map.currentKey!, dictionary: &map.JSONDictionary)
	}
}

/// Optional array of Basic type with Transform
public func <~ <T: TransformType>(left: inout [T.Object]?, right: (Map, T)) {
	let (map, transform) = right
	if map.mappingType == MappingType.FromJSON {
		let values = fromJSONArrayWithTransform(map.currentValue, transform: transform)
		FromJSON.optionalBasicType(&left, object: values)
	} else {
		let values = toJSONArrayWithTransform(left, transform: transform)
		ToJSON.optionalBasicType(values, key: map.currentKey!, dictionary: &map.JSONDictionary)
	}
}

/// Implicitly unwrapped optional array of Basic type with Transform
public func <~ <T: TransformType>(left: inout [T.Object]!, right: (Map, T)) {
	let (map, transform) = right
	if map.mappingType == MappingType.FromJSON {
		let values = fromJSONArrayWithTransform(map.currentValue, transform: transform)
        rxm_checkTransform(right.0, value: values)
		FromJSON.optionalBasicType(&left, object: values)
	} else {
		let values = toJSONArrayWithTransform(left, transform: transform)
        rxm_checkTransform(right.0, value: values)
		ToJSON.optionalBasicType(values, key: map.currentKey!, dictionary: &map.JSONDictionary)
	}
}

/// Dictionary of Basic type with Transform
public func <~ <T: TransformType>(left: inout [String: T.Object], right: (Map, T)) {
	let (map, transform) = right
	if map.mappingType == MappingType.FromJSON {
        rxm_checkKey(right.0)
		let values = fromJSONDictionaryWithTransform(map.currentValue, transform: transform)
        rxm_checkTransform(right.0, value: values)
		FromJSON.basicType(&left, object: values)
	} else {
		let values = toJSONDictionaryWithTransform(left, transform: transform)
        rxm_checkTransform(right.0, value: values)
		ToJSON.optionalBasicType(values, key: map.currentKey!, dictionary: &map.JSONDictionary)
	}
}

/// Optional dictionary of Basic type with Transform
public func <~ <T: TransformType>(left: inout [String: T.Object]?, right: (Map, T)) {
	let (map, transform) = right
	if map.mappingType == MappingType.FromJSON {
		let values = fromJSONDictionaryWithTransform(map.currentValue, transform: transform)
		FromJSON.optionalBasicType(&left, object: values)
	} else {
		let values = toJSONDictionaryWithTransform(left, transform: transform)
		ToJSON.optionalBasicType(values, key: map.currentKey!, dictionary: &map.JSONDictionary)
	}
}

/// Implicitly unwrapped optional dictionary of Basic type with Transform
public func <~ <T: TransformType>(left: inout [String: T.Object]!, right: (Map, T)) {
	let (map, transform) = right
	if map.mappingType == MappingType.FromJSON {
		let values = fromJSONDictionaryWithTransform(map.currentValue, transform: transform)
        rxm_checkTransform(right.0, value: values)
		FromJSON.optionalBasicType(&left, object: values)
	} else {
		let values = toJSONDictionaryWithTransform(left, transform: transform)
        rxm_checkTransform(right.0, value: values)
		ToJSON.optionalBasicType(values, key: map.currentKey!, dictionary: &map.JSONDictionary)
	}
}

private func fromJSONArrayWithTransform<T: TransformType>(_ input: Any?, transform: T) -> [T.Object]? {
	if let values = input as? [Any] {
		return values.filterMap { value in
			return transform.transformFromJSON(value)
		}
	} else {
		return nil
	}
}

private func fromJSONDictionaryWithTransform<T: TransformType>(_ input: Any?, transform: T) -> [String: T.Object]? {
	if let values = input as? [String: Any] {
		return values.filterMap { value in
			return transform.transformFromJSON(value)
		}
	} else {
		return nil
	}
}

private func toJSONArrayWithTransform<T: TransformType>(_ input: [T.Object]?, transform: T) -> [T.JSON]? {
	return input?.filterMap { value in
		return transform.transformToJSON(value)
	}
}

private func toJSONDictionaryWithTransform<T: TransformType>(_ input: [String: T.Object]?, transform: T) -> [String: T.JSON]? {
	return input?.filterMap { value in
		return transform.transformToJSON(value)
	}
}

// MARK:- Mappable Objects - <T: Mappable>

/// Object conforming to Mappable
public func <~ <T: Mappable>(left: inout T, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        rxm_checkKey(right)
        FromJSON.object(&left, object: right.currentValue)
    } else {
        ToJSON.object(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/// Optional Mappable objects
public func <~ <T: Mappable>(left: inout T?, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        FromJSON.optionalObject(&left, object: right.currentValue)
    } else {
        ToJSON.optionalObject(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/// Implicitly unwrapped optional Mappable objects
public func <~ <T: Mappable>(left: inout T!, right: Map) {
	if right.mappingType == MappingType.FromJSON {
        rxm_checkKey(right)
		FromJSON.optionalObject(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObject(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

// MARK:- Dictionary of Mappable objects - Dictionary<String, T: Mappable>

/// Dictionary of Mappable objects <String, T: Mappable>
public func <~ <T: Mappable>(left: inout Dictionary<String, T>, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        rxm_checkKey(right)
        FromJSON.objectDictionary(&left, object: right.currentValue)
    } else {
        ToJSON.objectDictionary(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/// Optional Dictionary of Mappable object <String, T: Mappable>
public func <~ <T: Mappable>(left: inout Dictionary<String, T>?, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        FromJSON.optionalObjectDictionary(&left, object: right.currentValue)
    } else {
        ToJSON.optionalObjectDictionary(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/// Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable>
public func <~ <T: Mappable>(left: inout Dictionary<String, T>!, right: Map) {
	if right.mappingType == MappingType.FromJSON {
        rxm_checkKey(right)
		FromJSON.optionalObjectDictionary(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObjectDictionary(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

/// Dictionary of Mappable objects <String, T: Mappable>
public func <~ <T: Mappable>(left: inout Dictionary<String, [T]>, right: Map) {
	if right.mappingType == MappingType.FromJSON {
        rxm_checkKey(right)
		FromJSON.objectDictionaryOfArrays(&left, object: right.currentValue)
	} else {
		ToJSON.objectDictionaryOfArrays(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

/// Optional Dictionary of Mappable object <String, T: Mappable>
public func <~ <T: Mappable>(left: inout Dictionary<String, [T]>?, right: Map) {
	if right.mappingType == MappingType.FromJSON {
		FromJSON.optionalObjectDictionaryOfArrays(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObjectDictionaryOfArrays(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

/// Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable>
public func <~ <T: Mappable>(left: inout Dictionary<String, [T]>!, right: Map) {
	if right.mappingType == MappingType.FromJSON {
        rxm_checkKey(right)
		FromJSON.optionalObjectDictionaryOfArrays(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObjectDictionaryOfArrays(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

// MARK:- Array of Mappable objects - Array<T: Mappable>

/// Array of Mappable objects
public func <~ <T: Mappable>(left: inout Array<T>, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        rxm_checkKey(right)
        FromJSON.objectArray(&left, object: right.currentValue)
    } else {
        ToJSON.objectArray(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/// Optional array of Mappable objects
public func <~ <T: Mappable>(left: inout Array<T>?, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        FromJSON.optionalObjectArray(&left, object: right.currentValue)
        if right.currentValue != nil {
            rxm_checkTransform(right, value: left)
        }
    } else {
        ToJSON.optionalObjectArray(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/// Implicitly unwrapped Optional array of Mappable objects
public func <~ <T: Mappable>(left: inout Array<T>!, right: Map) {
	if right.mappingType == MappingType.FromJSON {
        rxm_checkKey(right)
		FromJSON.optionalObjectArray(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObjectArray(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

/// Checks if a value is found.
private func rxm_checkKey(_ map: Map) {
    if (map.currentValue == nil) {
        if let key = map.currentKey {
            rxm_objectMapperError(message: "Key not found ‘\(key)’.")
        }
        else {
            rxm_objectMapperError(message: "Key not found.")
        }
    }
}

/// Checks if a value is transformed.
private func rxm_checkTransform<T>(_ map: Map, value: T?) {
    if (value == nil) {
        if let key = map.currentKey {
            rxm_objectMapperError(message: "Could not transform value for key ‘\(key)’.")
        }
        else {
            rxm_objectMapperError(message: "Could not transform value.")
        }
    }
}
