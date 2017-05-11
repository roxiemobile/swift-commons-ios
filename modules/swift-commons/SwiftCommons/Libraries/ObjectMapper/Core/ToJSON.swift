//
//  ToJSON.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2014-10-13.
//  Copyright (c) 2014 hearst. All rights reserved.
//

import class Foundation.NSNumber

private func setValue(_ value: Any, forKey key: String, dictionary: inout [String : Any]) {
	return setValue(value, forKeyPathComponents: ArraySlice(key.characters.split { $0 == "." }.map { String($0) }), dictionary: &dictionary)
}

private func setValue(_ value: Any, forKeyPathComponents components: ArraySlice<String>, dictionary: inout [String : Any]) {
	if components.isEmpty {
		return
	}

	let head = components.first!

	if components.count == 1 {
		dictionary[String(head)] = value
	} else {
		var child = dictionary[String(head)] as? [String : Any]
		if child == nil {
			child = [:]
		}

		let tail = components.dropFirst()
		setValue(value, forKeyPathComponents: tail, dictionary: &child!)

		dictionary[String(head)] = child
	}
}

internal final class ToJSON {

	class func basicType<N>(_ field: N, key: String, dictionary: inout [String : Any]) {
		func _setValue(_ value: Any) {
			setValue(value, forKey: key, dictionary: &dictionary)
		}

		switch field {
		// basic Types
		case let x as NSNumber:
			_setValue(x)
		case let x as Bool:
			_setValue(x)
		case let x as Int:
			_setValue(x)
		case let x as Double:
			_setValue(x)
		case let x as Float:
			_setValue(x)
		case let x as String:
			_setValue(x)
        case let x as NSNull:
            _setValue(x)

		// Arrays with basic types
		case let x as Array<NSNumber>:
			_setValue(x)
		case let x as Array<Bool>:
			_setValue(x)
		case let x as Array<Int>:
			_setValue(x)
		case let x as Array<Double>:
			_setValue(x)
		case let x as Array<Float>:
			_setValue(x)
		case let x as Array<String>:
			_setValue(x)
		case let x as Array<Any>:
			_setValue(x)

		// Dictionaries with basic types
		case let x as Dictionary<String, NSNumber>:
			_setValue(x)
		case let x as Dictionary<String, Bool>:
			_setValue(x)
		case let x as Dictionary<String, Int>:
			_setValue(x)
		case let x as Dictionary<String, Double>:
			_setValue(x)
		case let x as Dictionary<String, Float>:
			_setValue(x)
		case let x as Dictionary<String, String>:
			_setValue(x)
		case let x as Dictionary<String, Any>:
			_setValue(x)
		default:
			//println("Default")
			return
		}
	}

    class func optionalBasicType<N>(_ field: N?, key: String, dictionary: inout [String : Any]) {
        if let field = field {
            basicType(field, key: key, dictionary: &dictionary)
        }
    }

	class func object<N: Mappable>(_ field: N, key: String, dictionary: inout [String : Any]) {
		setValue(Mapper().toJSON(field), forKey: key, dictionary: &dictionary)
	}

    class func optionalObject<N: Mappable>(_ field: N?, key: String, dictionary: inout [String : Any]) {
        if let field = field {
            object(field, key: key, dictionary: &dictionary)
        }
    }
    
	class func objectArray<N: Mappable>(_ field: Array<N>, key: String, dictionary: inout [String : Any]) {
		let JSONObjects = Mapper().toJSONArray(field)

        setValue(JSONObjects, forKey: key, dictionary: &dictionary)
	}

    class func optionalObjectArray<N: Mappable>(_ field: Array<N>?, key: String, dictionary: inout [String : Any]) {
        if let field = field {
            objectArray(field, key: key, dictionary: &dictionary)
        }
    }
    
	class func objectDictionary<N: Mappable>(_ field: Dictionary<String, N>, key: String, dictionary: inout [String : Any]) {
		let JSONObjects = Mapper().toJSONDictionary(field)

        setValue(JSONObjects, forKey: key, dictionary: &dictionary)
	}

    class func optionalObjectDictionary<N: Mappable>(_ field: Dictionary<String, N>?, key: String, dictionary: inout [String : Any]) {
        if let field = field {
            objectDictionary(field, key: key, dictionary: &dictionary)
        }
    }
	
	class func objectDictionaryOfArrays<N: Mappable>(_ field: Dictionary<String, [N]>, key: String, dictionary: inout [String : Any]) {
		let JSONObjects = Mapper().toJSONDictionaryOfArrays(field)

        setValue(JSONObjects, forKey: key, dictionary: &dictionary)
	}

	class func optionalObjectDictionaryOfArrays<N: Mappable>(_ field: Dictionary<String, [N]>?, key: String, dictionary: inout [String : Any]) {
		if let field = field {
			objectDictionaryOfArrays(field, key: key, dictionary: &dictionary)
		}
	}
}
