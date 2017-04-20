//
//  EnumTransform.swift
//  ObjectMapper
//
//  Created by Kaan Dedeoglu on 3/20/15.
//  Copyright (c) 2015 hearst. All rights reserved.
//

import Foundation

public class EnumTransform<T: RawRepresentable>: TransformType {
	public typealias Object = T
	public typealias JSON = T.RawValue
	
	public init() {}
	
	public func transformFromJSON(_ value: Any?) -> T? {
		if let raw = value as? T.RawValue {
			return T(rawValue: raw)
		}
		return nil
	}
	
	public func transformToJSON(_ value: T?) -> T.RawValue? {
		if let obj = value {
			return obj.rawValue
		}
		return nil
	}
}
