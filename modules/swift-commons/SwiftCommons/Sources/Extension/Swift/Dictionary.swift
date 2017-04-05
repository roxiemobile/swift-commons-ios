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
// MARK: - Properties

    /// Checks if dictionary has elements.
    var isNotEmpty: Bool { return !self.isEmpty }
    
// MARK: - Methods

    /**
     * Loops trough each [key: value] pair in self.
     *
     * - parameter eachFunction: Function to inovke on each loop
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
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
    public func union(dictionaries: Dictionary...) -> Dictionary
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
    public func filterToDictionary(@noescape includeElement: (Element) throws -> Bool)  -> Dictionary
    {
        var result = [Key : Value]()
        
        forEach { (key, value) in
            if (try? includeElement(key, value)) ?? false {
                result[key] = value
            }
        }
        
        return result
    }

}

// ----------------------------------------------------------------------------
// MARK: - Operators
// ----------------------------------------------------------------------------

/// Union operator.
public func + <K:Hashable, V> (first: [K:V], second: [K:V]) -> [K:V] {
    return [K: V]().union(first, second)
}

/// Union with assignment operator.
public func += <K:Hashable, V> (left: inout [K:V], right: [K:V]) -> [K:V]
{
    for (key, value) in right {
        left.updateValue(value, forKey: key)
    }

    return left
}

// ----------------------------------------------------------------------------
