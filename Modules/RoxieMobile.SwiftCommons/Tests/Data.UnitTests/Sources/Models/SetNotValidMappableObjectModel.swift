// ----------------------------------------------------------------------------
//
//  SetValidMappableObjectModel.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData
import SwiftCommonsConcurrent

// ----------------------------------------------------------------------------

internal struct SetNotValidMappableObjectModel: Mappable, Hashable, Equatable
{
// MARK: - Construction

    init() {
        // Do nothing
    }

    init?(map: Map) {
        // Required method of protocol Mappable
    }

// MARK: - Properties

    var date = Constants.dateValue
    var x: Int = Int(Constants.intMax)
    var y: Int = Int(Constants.intMax)
    var z: Int = Int(Constants.intMax)
    var hashValue: Int {
        return self.x ^ self.y ^ self.z
    }

// MARK: - Methods

    mutating func mapping(map: Map) {
        self.date <~ map[CodingKeys.date]
    }
}

internal func ==(lhs: SetNotValidMappableObjectModel, rhs: SetNotValidMappableObjectModel) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

// ----------------------------------------------------------------------------
