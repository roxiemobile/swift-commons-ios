// ----------------------------------------------------------------------------
//
//  Array.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public extension Array
{
// MARK: - Methods

    /**
     * Checks if test returns true for all the elements in self
     *
     * - parameter test: Function to call for each element
     * - returns: True if test returns true for all the elements in self
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    func all(test: (Element) -> Bool) -> Bool
    {
        for item in self {
            if !test(item) {
                return false
            }
        }

        return true
    }

    /**
     * Checks if test returns true for any element of self.
     *
     * - parameter test: Function to call for each element
     * - returns: true if test returns true for any element of self
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    func any(test: (Element) -> Bool) -> Bool
    {
        for item in self {
            if test(item) {
                return true
            }
        }

        return false
    }

    /**
     * Checks if self contains a list of items.
     *
     * - parameter items: Items to search for
     * - returns: true if self contains all the items
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    func contains <T: Equatable> (items: T...) -> Bool {
        return items.all { self.indexOf($0) >= 0 }
    }

    /**
     * Iterates on each element of the array.
     *
     * - parameter call: Function to call for each element
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    func each(closure: (Element) -> ())
    {
        for item in self {
            closure(item)
        }
    }

    /**
     * Iterates on each element of the array with its index.
     *
     * - parameter call: Function to call for each element
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    func each(closure: (Int, Element) -> ())
    {
        for (index, item) in self.enumerate() {
            closure(index, item)
        }
    }

    /**
     * Index of the first occurrence of item, if found.
     *
     * - parameter item: The item to search for
     * - returns: Index of the matched item or nil
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    func indexOf <U: Equatable> (item: U) -> Int?
    {
        if item is Element {
            return unsafeBitCast(self, [U].self).indexOf(item)
        }

        return nil
    }

    /**
     * Costructs an array removing the duplicate values in self
     * if Array.Element implements the Equatable protocol.
     *
     * - returns: Array of unique values
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    func unique <T: Equatable> () -> [T]
    {
        var result = [T]()

        for item in self {
            if !result.contains(item as! T) {
                result.append(item as! T)
            }
        }

        return result
    }
    
    /**
     * First item that meets the condition.
     *
     * - parameter condition: A function which returns a boolean if an element satisfies a given condition or not.
     * - returns: First matched item or nil
     */
    func find(condition: (Element -> Bool)) -> Element? {
        return takeFirst(condition)
    }
    
    /**
     * Returns the first element in the array to meet the condition.
     *
     * - parameter condition: A function which returns a boolean if an element satisfies a given condition or not.
     * - returns: The first element in the array to meet the condition
     */
    func takeFirst(condition: (Element -> Bool)) -> Element?
    {
        for value in self {
            if condition(value) {
                return value
            }
        }
        
        return nil
    }
    
    /**
     * Deletes all the items in self that are meet the condition.
     *
     * - parameter condition: A function which returns a boolean if an element satisfies a given condition or not.
     */
    mutating func remove(condition: (Element -> Bool)) {
        let anotherSelf = self
        
        removeAll(keepCapacity: true)
        
        anotherSelf.each {
            (index: Int, current: Element) in
            if !condition(current) {
                self.append(current)
            }
        }
    }

}

// ----------------------------------------------------------------------------
