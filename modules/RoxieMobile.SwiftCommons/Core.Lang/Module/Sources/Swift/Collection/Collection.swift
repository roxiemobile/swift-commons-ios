// ----------------------------------------------------------------------------
//
//  Collection.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public extension Collection
{
// MARK: - Properties

    /// Checks if collection has elements.
    public var isNotEmpty: Bool { return !self.isEmpty }
}

// ----------------------------------------------------------------------------

public extension Collection
{
    /**
     * Checks if test returns true for all the elements in self
     *
     * - parameter test: Function to call for each element
     * - returns: True if test returns true for all the elements in self
     *
     * @note Copy from ExSwift
     * @link https://github.com/pNre/ExSwift
     */
    @available(*, deprecated, message: "\n• Must be deleted.")
    func all(_ test: (Element) -> Bool) -> Bool
    {
        for item in self {
            if !test(item) {
                return false
            }
        }

        return true
    }
}

// ----------------------------------------------------------------------------
