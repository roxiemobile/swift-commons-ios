//
//  FromJSON.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2014-10-09.
//  Copyright (c) 2014 hearst. All rights reserved.
//

internal final class FromJSON {
	
	/// Basic type
	class func basicType<FieldType>(_ field: inout FieldType, object: FieldType?) {
		if let value = object {
			field = value
		}
	}

	/// optional basic type
	class func optionalBasicType<FieldType>(_ field: inout FieldType?, object: FieldType?) {
		if let value = object {
			field = value
		}
	}

	/// Implicitly unwrapped optional basic type
	class func optionalBasicType<FieldType>(_ field: inout FieldType!, object: FieldType?) {
		if let value = object {
			field = value
		}
	}

	/// Mappable object
	class func object<N: Mappable>(_ field: inout N, object: Any?) {
		if let value: N = Mapper().map(object) {
			field = value
		}
	}

	/// Optional Mappable Object
	class func optionalObject<N: Mappable>(_ field: inout N?, object: Any?) {
		field = Mapper().map(object)
	}

	/// Implicitly unwrapped Optional Mappable Object
	class func optionalObject<N: Mappable>(_ field: inout N!, object: Any?) {
		field = Mapper().map(object)
	}

	/// mappable object array
	class func objectArray<N: Mappable>(_ field: inout Array<N>, object: Any?) {
		let parsedObjects = Mapper<N>().mapArray(object)

		if let objects = parsedObjects {
			field = objects
		}
	}

	/// optional mappable object array
	class func optionalObjectArray<N: Mappable>(_ field: inout Array<N>?, object: Any?) {
		field = Mapper().mapArray(object)
	}

	/// Implicitly unwrapped optional mappable object array
	class func optionalObjectArray<N: Mappable>(_ field: inout Array<N>!, object: Any?) {
		field = Mapper().mapArray(object)
	}
	
	/// Dctionary containing Mappable objects
	class func objectDictionary<N: Mappable>(_ field: inout Dictionary<String, N>, object: Any?) {
		let parsedObjects = Mapper<N>().mapDictionary(object)

		if let objects = parsedObjects {
			field = objects
		}
	}

	/// Optional dictionary containing Mappable objects
	class func optionalObjectDictionary<N: Mappable>(_ field: inout Dictionary<String, N>?, object: Any?) {
		field = Mapper().mapDictionary(object)
	}

	/// Implicitly unwrapped Dictionary containing Mappable objects
	class func optionalObjectDictionary<N: Mappable>(_ field: inout Dictionary<String, N>!, object: Any?) {
		field = Mapper().mapDictionary(object)
	}
	
	/// Dictionary containing Array of Mappable objects
	class func objectDictionaryOfArrays<N: Mappable>(_ field: inout Dictionary<String, [N]>, object: Any?) {
		let parsedObjects = Mapper<N>().mapDictionaryOfArrays(object)
		
		if let objects = parsedObjects {
			field = objects
		}
	}
	
	/// Optional Dictionary containing Array of Mappable objects
	class func optionalObjectDictionaryOfArrays<N: Mappable>(_ field: inout Dictionary<String, [N]>?, object: Any?) {
		field = Mapper<N>().mapDictionaryOfArrays(object)
	}
	
	/// Implicitly unwrapped Dictionary containing Array of Mappable objects
	class func optionalObjectDictionaryOfArrays<N: Mappable>(_ field: inout Dictionary<String, [N]>!, object: Any?) {
		field = Mapper<N>().mapDictionaryOfArrays(object)
	}
}
