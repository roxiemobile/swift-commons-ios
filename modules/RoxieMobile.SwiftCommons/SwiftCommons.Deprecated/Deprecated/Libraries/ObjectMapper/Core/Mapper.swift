//
//  Mapper.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2014-10-09.
//  Copyright (c) 2014 hearst. All rights reserved.
//

import Foundation

public protocol Mappable {
	init?(_ map: Map)
	mutating func mapping(_ map: Map)
    func frozen() -> Bool
}

public enum MappingType {
	case FromJSON
	case ToJSON
}


/// A class used for holding mapping data
public final class Map {
	public let mappingType: MappingType

	var JSONDictionary: [String : Any] = [:]
	var currentValue: Any?
	var currentKey: String?

	/// Counter for failing cases of deserializing values to `let` properties.
	private var failedCount: Int = 0

	fileprivate init(mappingType: MappingType, JSONDictionary: [String : Any]) {
		self.mappingType = mappingType
		self.JSONDictionary = JSONDictionary
	}
	
	
	/// Sets the current mapper value and key.
	/// The Key paramater can be a period separated string (ex. "distance.value") to access sub objects.
	public subscript(key: String) -> Map {
		// save key and value associated to it
		currentKey = key
		// break down the components of the key
		currentValue = valueFor(keyPathComponents: ArraySlice(key.characters.split { $0 == "." }.map { String($0) }), dictionary: JSONDictionary)
		
		return self
	}

	// MARK: Immutable Mapping

	public func value<T>() -> T? {
		return currentValue as? T
	}

	public func valueOr<T>(defaultValue: @autoclosure () -> T) -> T {
		return value() ?? defaultValue()
	}

	/// Returns current JSON value of type `T` if it is existing, or returns a
	/// unusable proxy value for `T` and collects failed count.
	public func valueOrFail<T>() -> T {
		if let value: T = value() {
			return value
		} else {
			// Collects failed count
			failedCount += 1

			// Returns dummy memory as a proxy for type `T`
			let pointer = UnsafeMutablePointer<T>.allocate(capacity: 0)
			pointer.deallocate(capacity: 0)
			return pointer.pointee
		}
	}

	/// Returns whether the receiver is success or failure.
	public var isValid: Bool {
		return failedCount == 0
	}
}

/// Fetch value from JSON dictionary, loop through them until we reach the desired object.
fileprivate func valueFor(keyPathComponents: ArraySlice<String>, dictionary: [String : Any]) -> Any? {
	// Implement it as a tail recursive function.

	if keyPathComponents.isEmpty {
		return nil
	}

	if let object: Any = dictionary[keyPathComponents.first!] {
		switch object {
		case is NSNull:
			return nil

		case let dict as [String : Any] where keyPathComponents.count > 1:
			let tail = keyPathComponents.dropFirst()
			return valueFor(keyPathComponents: tail, dictionary: dict)

		default:
			return object
		}
	}

	return nil
}

/// The Mapper class provides methods for converting Model objects to JSON and methods for converting JSON to Model objects
public final class Mapper<N: Mappable> {
	public init(){

	}
	
	// MARK: Mapping functions that map to an existing object toObject
	
	/// Map a JSON string onto an existing object
	public func map(_ JSONString: String, toObject object: N) -> N {
		if let JSON = parseJSONDictionary(JSONString) {
			return map(JSON, toObject: object)
		}
		return object
	}
	
	/// Maps a JSON object to an existing Mappable object if it is a JSON dictionary, or returns the passed object as is
    @discardableResult
	public func map(_ JSON: Any?, toObject object: N) -> N {
		if let JSON = JSON as? [String : Any] {
			return map(JSON, toObject: object)
		}
		
		return object
	}
	
	/// Maps a JSON dictionary to an existing object that conforms to Mappable.
	/// Usefull for those pesky objects that have crappy designated initializers like NSManagedObject
    @discardableResult
	public func map(_ JSONDictionary: [String : Any], toObject object: N) -> N {
        var object = object
        rxm_checkState(object)
		let map = Map(mappingType: .FromJSON, JSONDictionary: JSONDictionary)
		object.mapping(map)
		return object
	}

	//MARK: Mapping functions that create an object
	
	/// Map a JSON string to an object that conforms to Mappable
	public func map(_ JSONString: String) -> N? {
		if let JSON = parseJSONDictionary(JSONString) {
			return map(JSON)
		}
		return nil
	}
	
	/// Map a JSON NSString to an object that conforms to Mappable
	public func map(_ JSONString: NSString) -> N? {
        return map(JSONString)
	}
	
	/// Maps a JSON object to a Mappable object if it is a JSON dictionary or NSString, or returns nil.
	public func map(_ JSON: Any?) -> N? {
		if let JSON = JSON as? [String : Any] {
			return map(JSON)
		}

		return nil
	}

	/// Maps a JSON dictionary to an object that conforms to Mappable
	public func map(_ JSONDictionary: [String : Any]) -> N? {
		let map = Map(mappingType: .FromJSON, JSONDictionary: JSONDictionary)
		let object = N(map)
		return object
	}

	//MARK: Mapping functions for Arrays and Dictionaries
	
	/// Maps a JSON array to an object that conforms to Mappable
	public func mapArray(_ JSONString: String) -> [N] {
		let parsedJSON: Any? = parseJSONString(JSONString)

		if let objectArray = mapArray(parsedJSON) {
			return objectArray
		}

		// failed to parse JSON into array form
		// try to parse it into a dictionary and then wrap it in an array
		if let object = map(parsedJSON) {
			return [object]
		}

		return []
	}

	/// Maps a JSON object to an array of Mappable objects if it is an array of JSON dictionary, or returns nil.
	public func mapArray(_ JSON: Any?) -> [N]? {
		if let JSONArray = JSON as? [[String : Any]] {
			return mapArray(JSONArray)
		}

		return nil
	}
	
	/// Maps an array of JSON dictionary to an array of Mappable objects
	public func mapArray(_ JSONArray: [[String : Any]]) -> [N] {
		// map every element in JSON array to type N
		return JSONArray.filterMap(map)
	}

	/// Maps a JSON object to a dictionary of Mappable objects if it is a JSON dictionary of dictionaries, or returns nil.
	public func mapDictionary(_ JSON: Any?) -> [String : N]? {
		if let JSONDictionary = JSON as? [String : [String : Any]] {
			return mapDictionary(JSONDictionary)
		}

		return nil
	}

	/// Maps a JSON dictionary of dictionaries to a dictionary of Mappble objects
	public func mapDictionary(_ JSONDictionary: [String : [String : Any]]) -> [String : N] {
		// map every value in dictionary to type N
		return JSONDictionary.filterMap(map)
	}
	
	/// Maps a JSON object to a dictionary of arrays of Mappable objects
	public func mapDictionaryOfArrays(_ JSON: Any?) -> [String : [N]]? {
		if let JSONDictionary = JSON as? [String : [[String : Any]]] {
			return mapDictionaryOfArrays(JSONDictionary)
		}
		
		return nil
	}
	
	///Maps a JSON dictionary of arrays to a dictionary of arrays of Mappable objects
	public func mapDictionaryOfArrays(_ JSONDictionary: [String : [[String : Any]]]) -> [String : [N]] {
		// map every value in dictionary to type N
		return JSONDictionary.filterMap({ mapArray($0) as [N] })
	}

	// MARK: Functions that create JSON from objects
	
	///Maps an object that conforms to Mappable to a JSON dictionary <String : Any>
	public func toJSON(_ object: N) -> [String : Any] {
        var object = object
		let map = Map(mappingType: .ToJSON, JSONDictionary: [:])
		object.mapping(map)
		return map.JSONDictionary
	}
	
	///Maps an array of Objects to an array of JSON dictionaries [[String : Any]]
	public func toJSONArray(_ array: [N]) -> [[String : Any]] {
		return array.map {
			// convert every element in array to JSON dictionary equivalent
			self.toJSON($0)
		}
	}

	///Maps a dictionary of Objects that conform to Mappable to a JSON dictionary of dictionaries.
	public func toJSONDictionary(_ dictionary: [String : N]) -> [String : [String : Any]] {
		return dictionary.map { k, v in
			// convert every value in dictionary to its JSON dictionary equivalent			
			return (k, self.toJSON(v))
		}
	}
	
	///Maps a dictionary of Objects that conform to Mappable to a JSON dictionary of dictionaries.
	public func toJSONDictionaryOfArrays(_ dictionary: [String : [N]]) -> [String : [[String : Any]]] {
		return dictionary.map { k, v in
			// convert every value (array) in dictionary to its JSON dictionary equivalent
			return (k, self.toJSONArray(v))
		}
	}

	/// Maps an Object to a JSON string
	public func toJSONString(_ object: N, prettyPrint: Bool) -> String? {
		let JSONDict = toJSON(object)

		var err: NSError?
		if JSONSerialization.isValidJSONObject(JSONDict) {
			let options: JSONSerialization.WritingOptions = prettyPrint ? .prettyPrinted : []
			let JSONData: Data?
			do {
				JSONData = try JSONSerialization.data(withJSONObject: JSONDict, options: options)
			} catch let error as NSError {
				err = error
				JSONData = nil
			}
			if let error = err {
				print(error)
			}

			if let JSON = JSONData {
				return String(data: JSON, encoding: String.Encoding.utf8)
			}
		}

		return nil
	}

	// MARK: Private utility functions for converting strings to JSON objects
	
	/// Convert a JSON String into a Dictionary<String, Any> using NSJSONSerialization
	fileprivate func parseJSONDictionary(_ JSON: String) -> [String : Any]? {
		let parsedJSON: Any? = parseJSONString(JSON)
		return parseJSONDictionary(parsedJSON)
	}
	
	/// Convert a JSON Object into a Dictionary<String, Any> using NSJSONSerialization
	fileprivate func parseJSONDictionary(_ JSON: Any?) -> [String : Any]? {
		if let JSONDict = JSON as? [String : Any] {
			return JSONDict
		}

		return nil
	}

	/// Convert a JSON String into an Object using NSJSONSerialization
	fileprivate func parseJSONString(_ JSON: String) -> Any? {
		let data = JSON.data(using: String.Encoding.utf8, allowLossyConversion: true)
		if let data = data {
			let parsedJSON: Any?
			do {
				parsedJSON = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
			} catch {
				rxm_objectMapperAssertion(message: "Failed to convert data \(data) to JSON")
				parsedJSON = nil
			}
			return parsedJSON
		}

		return nil
	}

    /// Checks if an object is frozen.
    fileprivate func rxm_checkState(_ object: Mappable) {
        if object.frozen() {
            rxm_objectMapperError(message: "Can't modify frozen object.")
        }
    }
}

extension Array {
	internal func filterMap<U>(_ f: (Element) -> U?) -> [U] {
		var mapped = [U]()

		for value in self {
			if let newValue = f(value) {
				mapped.append(newValue)
			}
		}

		return mapped
	}
}

extension Dictionary {
	internal func map<K: Hashable, V>(_ f: (Element) -> (K, V)) -> [K : V] {
		var mapped = [K : V]()

		for element in self {
			let newElement = f(element)
			mapped[newElement.0] = newElement.1
		}

		return mapped
	}

	internal func map<K: Hashable, V>(_ f: (Element) -> (K, [V])) -> [K : [V]] {
		var mapped = [K : [V]]()
		
		for element in self {
			let newElement = f(element)
			mapped[newElement.0] = newElement.1
		}
		
		return mapped
	}

	
	internal func filterMap<U>(_ f: (Value) -> U?) -> [Key : U] {
		var mapped = [Key : U]()

		for (key, value) in self {
			let newValue = f(value)
			mapped[key] = newValue
		}

		return mapped
	}
}