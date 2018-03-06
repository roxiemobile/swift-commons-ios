// ----------------------------------------------------------------------------
//
//  ValidMappableObjectModel.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData
import SwiftCommonsConcurrent

// ----------------------------------------------------------------------------

internal final class ValidMappableObjectModel: Mappable
{
// MARK: - Construction

    init() {
        // Do nothing
    }

    required init?(map: Map) {
        // Required method of protocol Mappable
    }

// MARK: - Properties

    var bool: Bool = false
    var boolOpt: Bool? = false
    var boolImp: Bool! = false

// MARK: - Methods

    func mapping(map: Map) {
        self.bool <~ map[CodingKeys.bool]
        self.boolOpt <~ map[CodingKeys.boolOptional]
        self.boolImp <~ map[CodingKeys.boolImplicityUnwrapped]
    }
}

// ----------------------------------------------------------------------------
