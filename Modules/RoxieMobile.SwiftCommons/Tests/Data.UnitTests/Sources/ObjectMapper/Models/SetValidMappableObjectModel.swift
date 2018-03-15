// ----------------------------------------------------------------------------
//
//  SetValidMappableObjectModel.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

internal struct SetValidMappableObjectModel: Mappable, Hashable, Equatable
{
// MARK: - Construction

    init() {
        // Do nothing
    }

    init?(map: Map) {
        // Required method of protocol Mappable
    }

// MARK: - Properties

    var x: Int = Int.max
    var y: Int = Int.max
    var z: Int = Int.max
    var hashValue: Int {
        return self.x ^ self.y ^ self.z
    }

// MARK: - Methods

    mutating func mapping(map: Map) {
        self.x <~ map[JsonKeys.x]
        self.y <~ map[JsonKeys.y]
        self.z <~ map[JsonKeys.z]
    }
}

internal func ==(lhs: SetValidMappableObjectModel, rhs: SetValidMappableObjectModel) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

// ----------------------------------------------------------------------------
