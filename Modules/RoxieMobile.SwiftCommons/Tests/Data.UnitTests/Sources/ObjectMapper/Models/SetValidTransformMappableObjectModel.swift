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

// ----------------------------------------------------------------------------

public class SetValidTransformMappableObjectModel: Mappable, Hashable, Equatable
{
// MARK: - Construction

    public init() {
        // Do nothing
    }

    public required init?(map: Map) {
        // Do nothing
    }

// MARK: - Properties

    public var x: Int = Int(Constants.minInt)

    public var y: Int = Int(Constants.minInt)

    public var z: Int! = Int(Constants.minInt)

// MARK: - Properties: Hashable

    public var hashValue: Int {
        return self.x ^ self.y ^ self.z
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

public func ==(lhs: SetValidTransformMappableObjectModel, rhs: SetValidTransformMappableObjectModel) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

// ----------------------------------------------------------------------------
