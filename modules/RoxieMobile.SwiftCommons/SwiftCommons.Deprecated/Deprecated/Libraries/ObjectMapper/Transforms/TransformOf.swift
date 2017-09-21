//
//  TransformOf.swift
//  ObjectMapper
//
//  Created by Syo Ikeda on 1/23/15.
//  Copyright (c) 2015 hearst. All rights reserved.
//

public class TransformOf<ObjectType, JSONType>: TransformType {
	public typealias Object = ObjectType
	public typealias JSON = JSONType

	private let fromJSON: (JSONType?) -> ObjectType?
	private let toJSON: (ObjectType?) -> JSONType?

	public init(fromJSON: @escaping (JSONType?) -> ObjectType?, toJSON: @escaping (ObjectType?) -> JSONType?) {
		self.fromJSON = fromJSON
		self.toJSON = toJSON
	}

	public func transformFromJSON(_ value: Any?) -> ObjectType? {
		return fromJSON(value as? JSONType)
	}

	public func transformToJSON(_ value: ObjectType?) -> JSONType? {
		return toJSON(value)
	}
}
