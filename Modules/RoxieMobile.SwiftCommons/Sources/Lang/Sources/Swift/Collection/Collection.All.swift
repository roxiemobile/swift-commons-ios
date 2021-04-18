// ----------------------------------------------------------------------------
//
//  Collection.All.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

// A set of Swift extensions for standard types and classes.
// @link https://github.com/pNre/ExSwift/blob/master/ExSwift/Array.swift#L566

// ----------------------------------------------------------------------------

public extension Collection {

// MARK: - Methods

    /// Checks if test returns `true` for any element of `self`.
    ///
    /// - Parameters:
    ///   - test: Function to call for each element.
    ///
    /// - Returns:
    ///   `true` if test returns `true` for all the elements in `self`.
    ///
    func all(_ test: (Element) -> Bool) -> Bool {
        for item in self {
            if !test(item) {
                return false
            }
        }
        return true
    }
}
