// ----------------------------------------------------------------------------
//
//  Array.Remove.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

// A set of Swift extensions for standard types and classes.
// @link https://github.com/pNre/ExSwift/blob/master/ExSwift/Array.swift#L1288

// ----------------------------------------------------------------------------

public extension Array
{
// MARK: - Methods

    /// Deletes all the items in self that are equal to element.
    ///
    /// - Parameters:
    ///   - element: Element to remove.
    ///
    mutating func remove<U:Equatable>(element: U) {
        let anotherSelf = self // copy

        removeAll(keepingCapacity: true)

        for item in anotherSelf {
            if (item as! U) != element {
                self.append(item)
            }
        }
    }

    /// Deletes all the items in `self` that are meet the condition.
    ///
    /// - Parameters:
    ///   - condition: A function which returns a boolean if an element satisfies a given condition or not.
    ///
    mutating func remove(_ condition: (Element) -> Bool) {
        let anotherSelf = self // copy

        removeAll(keepingCapacity: true)

        for item in anotherSelf {
            if !condition(item) {
                self.append(item)
            }
        }
    }
}

// ----------------------------------------------------------------------------
