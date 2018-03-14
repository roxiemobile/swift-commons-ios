// ----------------------------------------------------------------------------
//
//  ValidModelTransform.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

public final class ValidModelTransform: TransformType
{
// MARK: - Construction

    public static let shared = ValidModelTransform()

    private init() {
        // Do nothing
    }

// MARK: - Methods

    public func transformFromJSON(_ value: Any?) -> Object? {
        if let value = value as? [String: Any] {
            return ValidTransformMappableObjectModel(JSON: value)
        }
        return nil
    }

    public func transformToJSON(_ value: Object?) -> JSON? {
        if let value = value {
            return Inner.sharedMapper.toJSONString(value, prettyPrint: true)
        }
        return nil
    }

// MARK: - Inner Types

    private struct Inner
    {
        static let sharedMapper = Mapper<Object>()
    }

    public typealias Object = ValidTransformMappableObjectModel
    public typealias JSON = String
}

// ----------------------------------------------------------------------------
