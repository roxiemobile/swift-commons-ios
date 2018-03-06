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

internal struct SetValidMappableObjectModel: Mappable, Hashable, Equatable
{
// MARK: - Construction

    init() {

    }

    init?(map: Map) {
        // Required method of protocol Mappable
    }

// MARK: - Properties
    var x: Int = 1
    var y: Int = 2
    var z: Int = 3
    var hashValue: Int {
        return self.x^self.y^self.z
    }

// MARK: - Methods
    mutating func mapping(map: Map) {
        self.x  <~ map[CodingKeys.x]
        self.y  <~ map[CodingKeys.y]
        self.z  <~ map[CodingKeys.z]
    }
}

internal func ==(lhs: SetValidMappableObjectModel, rhs: SetValidMappableObjectModel) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

// ----------------------------------------------------------------------------
