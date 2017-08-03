// ----------------------------------------------------------------------------
//
//  CollectionUtils.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public final class CollectionUtils: NonCreatable
{
// MARK: - Methods

    /// Checks if given Array is {@code nil} or has zero elements.
    public static func isEmpty<T>(_ array: [T]?) -> Bool {
        return (array == nil) || array!.isEmpty
    }

    /// Checks if given Set is nil or has zero elements.
    public static func isEmpty<T>(_ set: Set<T>?) -> Bool {
        return (set == nil) || set!.isEmpty
    }

    /// Checks if given Dictionary is {@code nil} or has zero elements.
    public static func isEmpty<K, V>(_ map: Dictionary<K, V>?) -> Bool {
        return (map == nil) || map!.isEmpty
    }

// --

    /// Checks if given Array is non {@code nil} and has elements.
    public static func isNotEmpty<T>(_ array: [T]?) -> Bool {
        return !isEmpty(array)
    }

    /// Checks if given Set is non {@code nil} and has elements.
    public static func isNotEmpty<T>(_ set: Set<T>?) -> Bool {
        return !isEmpty(set)
    }

    /// Checks if given Dictionary is non {@code nil} and has elements.
    public static func isNotEmpty<K, V>(_ map: Dictionary<K, V>?) -> Bool {
        return !isEmpty(map)
    }

// MARK: -

    /// Returns the given Array if it is non-empty; {@code nil} otherwise.
    public static func emptyToNil<T>(_ array: [T]?) -> [T]? {
        return isEmpty(array) ? nil : array
    }

    /// Returns the given Set if it is non-empty; {@code nil} otherwise.
    public static func emptyToNil<T>(_ set: Set<T>?) -> Set<T>? {
        return isEmpty(set) ? nil : set
    }

    /// Returns the given Dictionary if it is non-empty; {@code nil} otherwise.
    public static func emptyToNil<K, V>(_ map: Dictionary<K, V>?) -> Dictionary<K, V>? {
        return isEmpty(map) ? nil : map
    }

// --

    /// Returns the given Array if it is non {@code nil}; the empty Array otherwise.
    public static func nilToEmpty<T>(_ array: [T]?) -> [T] {
        return isEmpty(array) ? [] : array!
    }

    /// Returns the given Set if it is non {@code nil}; the empty Set otherwise.
    public static func nilToEmpty<T>(_ set: Set<T>?) -> Set<T> {
        return isEmpty(set) ? [] : set!
    }

    /// Returns the given Dictionary if it is non {@code nil}; the empty Dictionary otherwise.
    public static func nilToEmpty<K, V>(_ map: Dictionary<K, V>?) -> Dictionary<K, V> {
        return isEmpty(map) ? [:] : map!
    }
}

// ----------------------------------------------------------------------------
