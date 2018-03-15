// ----------------------------------------------------------------------------
//
//  ValidMappableObjectModel.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

public final class ValidMappableObjectModel: Mappable, Hashable, Equatable
{
// MARK: - Construction

    public init() {
        // Do nothing
    }

    public required init?(map: Map) {
        // Do nothing
    }

// MARK: - Properties

    public var bool = false

    public var boolOpt: Bool? = false

    public var boolImpOpt: Bool! = false

// MARK: - Properties: Hashable

    public var hashValue: Int {
        return 31 ^ self.bool.hashValue ^ (self.boolOpt ?? false).hashValue ^ self.boolImpOpt.hashValue
    }

// MARK: - Methods

    public func mapping(map: Map) {
        self.bool <~ map[JsonKeys.bool]
        self.boolOpt <~ map[JsonKeys.boolOptional]
        self.boolImpOpt <~ map[JsonKeys.boolImplicitlyUnwrapped]
    }
}

// ----------------------------------------------------------------------------
// MARK: - @protocol Equatable
// ----------------------------------------------------------------------------

public func ==(lhs: ValidMappableObjectModel, rhs: ValidMappableObjectModel) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

// ----------------------------------------------------------------------------
