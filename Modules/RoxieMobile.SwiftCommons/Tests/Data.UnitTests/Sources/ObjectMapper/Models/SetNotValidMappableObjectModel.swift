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

    var date = Constants.invalidDateObject

    var x: Int = Int.max

    var y: Int = Int.max

    var z: Int = Int.max

    var hashValue: Int {
        return 31 ^ self.x ^ self.y ^ self.z
    }

// MARK: - Methods

    mutating func mapping(map: Map) {
        self.date <~ map[JsonKeys.date]
    }
}

internal func ==(lhs: SetNotValidMappableObjectModel, rhs: SetNotValidMappableObjectModel) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

// ----------------------------------------------------------------------------
