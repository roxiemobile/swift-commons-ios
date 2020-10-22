// ----------------------------------------------------------------------------
//
//  StringToIntegerTransform.swift
//
//  @author     Natalia Mamunina <MamuninaNV@ekassir.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

public final class StringToIntegerTransform: TransformType {

// MARK: - Construction

    public static let shared = StringToIntegerTransform()

    private init() {
        // Do nothing
    }

// MARK: - Methods

    public func transformFromJSON(_ value: Any?) -> Object? {
        if let value = value as? String {
            return Int(value)
        }
        return nil
    }

    public func transformToJSON(_ value: Object?) -> JSON? {
        if let value = value {
            return String(value)
        }
        return nil
    }

// MARK: - Inner Types

    public typealias Object = Int
    public typealias JSON = String
}
