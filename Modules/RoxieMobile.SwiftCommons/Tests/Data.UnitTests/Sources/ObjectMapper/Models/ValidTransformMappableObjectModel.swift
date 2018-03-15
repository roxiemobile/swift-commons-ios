// ----------------------------------------------------------------------------
//
//  ValidTransformMappableObjectModel.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

public class ValidTransformMappableObjectModel: Mappable, Hashable, Equatable
{
// MARK: - Construction

    public init() {
        // Do nothing
    }

    public required init?(map: Map) {
        // Do nothing
    }

// MARK: - Properties

    public var x = Int.min

    public var y: Int? = Int.min

    public var z: Int! = Int.min

// MARK: - Properties: Hashable

    public var hashValue: Int {
        return 31 ^ self.x.hashValue ^ (self.y ?? 0).hashValue ^ self.z.hashValue
    }

// MARK: - Methods

    public func mapping(map: Map) {
        self.x <~ (map[JsonKeys.x], StringToIntegerTransform.shared)
        self.y <~ (map[JsonKeys.y], StringToIntegerTransform.shared)
        self.z <~ (map[JsonKeys.z], StringToIntegerTransform.shared)
    }
}

// ----------------------------------------------------------------------------
// MARK: - @protocol Equatable
// ----------------------------------------------------------------------------

public func ==(lhs: ValidTransformMappableObjectModel, rhs: ValidTransformMappableObjectModel) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

// ----------------------------------------------------------------------------
