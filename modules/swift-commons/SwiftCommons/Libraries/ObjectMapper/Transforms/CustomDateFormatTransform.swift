//
//  CustomDateFormatTransform.swift
//  ObjectMapper
//
//  Created by Dan McCracken on 3/8/15.
//
//

import Foundation

public class CustomDateFormatTransform: DateFormaterTransform {
	
    public init(formatString: String) {
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.dateFormat = formatString
		
		super.init(dateFormatter: formatter)
    }
}
