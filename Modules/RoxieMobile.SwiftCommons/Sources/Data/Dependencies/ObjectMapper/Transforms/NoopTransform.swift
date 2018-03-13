// ----------------------------------------------------------------------------
//
//  NoopTransform.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsLang

// ----------------------------------------------------------------------------

public final class NoopTransform: NonCreatable, TransformType {
    public typealias Object = Any
    public typealias JSON = Any

// MARK: - Methods

    public func transformFromJSON(_ value: Any?) -> Any? {
        return value
    }

    public func transformToJSON(_ value: Any?) -> Any? {
        return value
    }
}

// ----------------------------------------------------------------------------
