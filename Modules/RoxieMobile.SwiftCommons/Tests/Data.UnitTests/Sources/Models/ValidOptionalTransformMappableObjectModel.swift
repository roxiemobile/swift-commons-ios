// ----------------------------------------------------------------------------
//
//  ValidOptionalTransformMappableObjectModel.swift
//
//  @author     Natalia Mamunina <mamuninanv@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData
import SwiftCommonsConcurrent

// ----------------------------------------------------------------------------

internal class ValidOptionalTransformMappableObjectModel: Mappable
{

    init() {
        // Do nothing
    }

    required init?(map: Map) {
    }

    // MARK: - Properties

    var x: Int? = Int(Constants.intMin)
    var y: Int? = Int(Constants.intMin)
    var z: Int? = Int(Constants.intMin)
    //    var hashValue: Int {
    //        return self.x ^ self.y ^ self.z
    //    }

    // MARK: - Methods

    func mapping(map: Map) {
        self.x <~ (map[CodingKeys.x], TransformOf<Int?, String>(fromJSON: { $0 == nil ? nil : Int($0!) }, toJSON: { $0.map { String($0!) } }))
        self.y <~ (map[CodingKeys.y], TransformOf<Int?, String>(fromJSON: { $0 == nil ? nil : Int($0!) }, toJSON: { $0.map { String($0!) } }))
        self.z <~ (map[CodingKeys.z], TransformOf<Int?, String>(fromJSON: { $0 == nil ? nil : Int($0!) }, toJSON: { $0.map { String($0!) } }))
    }
}
//
//internal func ==(lhs: SetValidMappableObjectModel, rhs: SetValidMappableObjectModel) -> Bool {
//    return lhs.hashValue == rhs.hashValue
//}

// ----------------------------------------------------------------------------

