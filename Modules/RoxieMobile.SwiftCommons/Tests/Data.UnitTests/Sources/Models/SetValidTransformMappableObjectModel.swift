// ----------------------------------------------------------------------------
//
//  SetValidTransformMappableObjectModel.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData
import SwiftCommonsConcurrent

// ----------------------------------------------------------------------------

internal class SetValidTransformMappableObjectModel: Mappable, Equatable, Hashable
{
// MARK: - Construction

    init() {
        // Do nothing
    }

    required init?(map: Map) {
    }

// MARK: - Properties

    var x: Int = Int(Constants.minInt)
    var y: Int = Int(Constants.minInt)
    var z: Int! = Int(Constants.minInt)
    var hashValue: Int {
        return self.x ^ self.y ^ self.z
    }

// MARK: - Methods

    func mapping(map: Map) {
        self.x <~ (map[CodingKeys.x], IntTransform())
        self.y <~ (map[CodingKeys.y], IntTransform())
        self.z <~ (map[CodingKeys.z], IntTransform())
    }
}

internal func ==(lhs: SetValidTransformMappableObjectModel, rhs: SetValidTransformMappableObjectModel) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

// ----------------------------------------------------------------------------

