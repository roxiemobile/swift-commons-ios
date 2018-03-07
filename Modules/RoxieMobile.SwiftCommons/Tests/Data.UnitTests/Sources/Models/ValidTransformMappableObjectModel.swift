// ----------------------------------------------------------------------------
//
//  ValidTransformMappableObjectModel.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData
import SwiftCommonsConcurrent

// ----------------------------------------------------------------------------

internal class ValidTransformMappableObjectModel: Mappable
{

    init() {
        // Do nothing
    }

    required init?(map: Map) {
    }

    // MARK: - Properties

    var x: Int = Int(Constants.intMin)
    var y: Int? = Int(Constants.intMin)
    var z: Int! = Int(Constants.intMin)

    // MARK: - Methods

    func mapping(map: Map) {
        self.x <~ (map[CodingKeys.x], IntTransform())
        self.y <~ (map[CodingKeys.y], IntTransform())
        self.z <~ (map[CodingKeys.z], IntTransform())
    }
}

// ----------------------------------------------------------------------------
