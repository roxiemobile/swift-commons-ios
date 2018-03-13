// ----------------------------------------------------------------------------
//
//  BooleanTransform.swift
//
//  @author     Denis Kolyasev <KolyasevDA@ekassir.com>
//  @copyright  Copyright (c) 2015, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsData

// ----------------------------------------------------------------------------

open class BooleanTransform: TransformType
{
// MARK: - Construction

    public init(_ defaultValue: Bool? = nil) {
        self.defaultValue = defaultValue
    }

// MARK: - Methods

    open func transformFromJSON(_ value: Any?) -> Bool? {
        return (value as? Bool) ?? self.defaultValue
    }

    open func transformToJSON(_ value: Bool?) -> Bool? {
        return value
    }

// MARK: - Inner Types

    public typealias Object = Bool
    public typealias JSON = Bool

// MARK: - Variables

    fileprivate var defaultValue: Bool?
}

// ----------------------------------------------------------------------------
