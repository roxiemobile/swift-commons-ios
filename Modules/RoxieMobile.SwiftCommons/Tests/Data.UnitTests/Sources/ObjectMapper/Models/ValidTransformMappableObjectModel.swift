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

    public var x = Int(Constants.minInt)

    public var y: Int? = Int(Constants.minInt)

    public var z: Int! = Int(Constants.minInt)

// MARK: - Properties: Hashable

    public var hashValue: Int {
        return 31 ^ self.x ^ (self.y ?? 0) ^ self.z
    }

// MARK: - Methods

    public func mapping(map: Map) {
        self.x <~ (map[JsonKeys.x], IntTransform.shared)
        self.y <~ (map[JsonKeys.y], IntTransform.shared)
        self.z <~ (map[JsonKeys.z], IntTransform.shared)
    }
}

// ----------------------------------------------------------------------------
// MARK: - @protocol Equatable
// ----------------------------------------------------------------------------

public func ==(lhs: ValidTransformMappableObjectModel, rhs: ValidTransformMappableObjectModel) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

// ----------------------------------------------------------------------------
