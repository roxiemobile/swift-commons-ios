// ----------------------------------------------------------------------------
//
//  Dictionary.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

// A set of Swift extensions for standard types and classes.
// @link https://github.com/pNre/ExSwift

// ----------------------------------------------------------------------------

extension Dictionary
{
// MARK: - Methods

    /**
     * Loops trough each [key: value] pair in self.
     *
     * - parameter eachFunction: Function to inovke on each loop
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    @available(*, deprecated)
    public func each(eachFunction closure: (Key, Value) -> ())
    {
        for (key, value) in self {
            closure(key, value)
        }
    }

    /**
     * Union of self and the input dictionaries.
     *
     * - parameter dictionaries: Dictionaries to join
     * - returns: Union of self and the input dictionaries
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    @available(*, deprecated)
    public func union(_ dictionaries: Dictionary...) -> Dictionary
    {
        var result = self // copy

        dictionaries.each { (dictionary) -> () in
            dictionary.each { (key, value) -> () in
                _ = result.updateValue(value, forKey: key)
            }
        }

        return result
    }
    
    /**
     * Filters self returning a dictionary with the same type as opposit to
     * standard filter function with returns an Array of tuples
     *
     * - parameter includeElement: Closure which should return true for included
     *                             elements
     * - returns: A filtered dictionary
     *
     */
    @available(*, deprecated)
    public func filterToDictionary(_ includeElement: (Element) throws -> Bool)  -> Dictionary
    {
        var result = [Key : Value]()
        
        forEach { element in
            if (try? includeElement(element)) ?? false {
                result[element.key] = element.value
            }
        }

        return result
    }
}

// ----------------------------------------------------------------------------
// MARK: - Operators
// ----------------------------------------------------------------------------

/// Union operator.
@available(*, deprecated)
public func + <K, V> (first: [K:V], second: [K:V]) -> [K:V] {
    return [K: V]().union(first, second)
}

/// Union with assignment operator.
@available(*, deprecated)
// FIXME: Delete ‘@discardableResult’ annotation
@discardableResult public func += <K, V> (left: inout [K:V], right: [K:V]) -> [K:V]
{
    for (key, value) in right {
        left.updateValue(value, forKey: key)
    }

    return left
}

// ----------------------------------------------------------------------------
