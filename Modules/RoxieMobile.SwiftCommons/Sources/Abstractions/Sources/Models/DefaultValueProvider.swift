// ----------------------------------------------------------------------------
//
//  DefaultValueProvider.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2018, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public struct DefaultValueProvider<T>: DefaultValueProviderType
{
// MARK: - Construction

    public init<V: DefaultValueProviderType>(_ delegatee: V) where V.Value == T {
        self.value = delegatee.defaultValue
    }

// MARK: - Properties

    public var defaultValue: T {
        return self.value
    }

// MARK: - Construction

    let value: T
}

// ----------------------------------------------------------------------------
