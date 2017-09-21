//
//  DateFormaterTransform.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2015-03-09.
//  Copyright (c) 2015 hearst. All rights reserved.
//

import Foundation

open class DateFormaterTransform: TransformType {
	public typealias Object = Date
	public typealias JSON = String
	
	let dateFormatter: DateFormatter
	
	public init(dateFormatter: DateFormatter) {
		self.dateFormatter = dateFormatter
	}
	
	open func transformFromJSON(_ value: Any?) -> Date? {
		if let dateString = value as? String {
			return dateFormatter.date(from: dateString)
		}
		return nil
	}
	
	open func transformToJSON(_ value: Date?) -> String? {
		if let date = value {
			return dateFormatter.string(from: date)
		}
		return nil
	}
}