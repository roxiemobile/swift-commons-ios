// ----------------------------------------------------------------------------
//
//  Dictionary.Union.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

// A set of Swift extensions for standard types and classes.
// @link https://github.com/pNre/ExSwift/blob/master/ExSwift/Dictionary.swift#L50

// ----------------------------------------------------------------------------

public extension Dictionary
{
// MARK: - Methods

    /// Union of `self` and the input dictionaries.
    ///
    /// - Parameters:
    ///   - dictionaries: Dictionaries to join.
    ///
    /// - Returns:
    ///   Union of `self` and the input dictionaries.
    ///
    public func union(_ dictionaries: Dictionary...) -> Dictionary {
        var anotherSelf = self // copy

        dictionaries.forEach { dictionary in
            dictionary.forEach { pair in
                anotherSelf.updateValue(pair.value, forKey: pair.key)
            }
        }
        return anotherSelf
    }
}

// ----------------------------------------------------------------------------
// MARK: - Operators
// ----------------------------------------------------------------------------

/// Union operator.
public func +<K, V>(first: [K: V], second: [K: V]) -> [K: V] {
    return [K: V]().union(first, second)
}

/// Union with assignment operator.
@discardableResult
public func +=<K, V>(left: inout [K: V], right: [K: V]) -> [K: V]
{
    right.forEach { pair in
        left.updateValue(pair.value, forKey: pair.key)
    }
    return left
}

// ----------------------------------------------------------------------------
