// ----------------------------------------------------------------------------
//
//  CollectionUtils.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsLang

// ----------------------------------------------------------------------------

@available(*, deprecated)
public final class CollectionUtils: NonCreatable
{
// MARK: - Methods

    /// Returns the given Array if it is non-empty; {@code nil} otherwise.
    @available(*, deprecated)
    public static func emptyToNil<T>(_ array: [T]?) -> [T]? {
        return isEmpty(array) ? nil : array
    }

    /// Returns the given Set if it is non-empty; {@code nil} otherwise.
    @available(*, deprecated)
    public static func emptyToNil<T>(_ set: Set<T>?) -> Set<T>? {
        return isEmpty(set) ? nil : set
    }

    /// Returns the given Dictionary if it is non-empty; {@code nil} otherwise.
    @available(*, deprecated)
    public static func emptyToNil<K, V>(_ map: Dictionary<K, V>?) -> Dictionary<K, V>? {
        return isEmpty(map) ? nil : map
    }

// --

    /// Returns the given Array if it is non {@code nil}; the empty Array otherwise.
    @available(*, deprecated)
    public static func nilToEmpty<T>(_ array: [T]?) -> [T] {
        return isEmpty(array) ? [] : array!
    }

    /// Returns the given Set if it is non {@code nil}; the empty Set otherwise.
    @available(*, deprecated)
    public static func nilToEmpty<T>(_ set: Set<T>?) -> Set<T> {
        return isEmpty(set) ? [] : set!
    }

    /// Returns the given Dictionary if it is non {@code nil}; the empty Dictionary otherwise.
    @available(*, deprecated)
    public static func nilToEmpty<K, V>(_ map: Dictionary<K, V>?) -> Dictionary<K, V> {
        return isEmpty(map) ? [:] : map!
    }
}

// ----------------------------------------------------------------------------
