// ----------------------------------------------------------------------------
//
//  NotValidMappableObjectModel.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData
import SwiftCommonsConcurrent

// ----------------------------------------------------------------------------

internal final class NotValidMappableObjectModel: Mappable
{
// MARK: - Construction

    init() {
        
    }

    required init?(map: Map) {
        // Required method of protocol Mappable
    }

// MARK: - Properties

    var date: Date = Date(timeIntervalSinceReferenceDate: -123456789.0)

// MARK: - Methods

    func mapping(map: Map) {
        self.date    <~ map["date"]
    }
}

// ----------------------------------------------------------------------------
