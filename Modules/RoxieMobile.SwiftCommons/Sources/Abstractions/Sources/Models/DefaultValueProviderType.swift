// ----------------------------------------------------------------------------
//
//  DefaultValueProviderType.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@available(*, deprecated, message: "\n• Write a description.")
public protocol DefaultValueProviderType {
    associatedtype Value

// MARK: - Properties

    @available(*, deprecated, message: "\n• Write a description.")
    var defaultValue: Value { get }
}

// ----------------------------------------------------------------------------
