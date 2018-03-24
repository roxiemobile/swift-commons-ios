// ----------------------------------------------------------------------------
//
//  PostValidatable.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public protocol Validator
{
// MARK: - Methods

    /// Validates the current state of the object.
    ///
    /// - Parameters:
    ///   - value: The object to validate.
    ///
    /// - Returns:
    ///   `true` if object validation succeeded; otherwise, `false`.
    ///
    func isValid(_ value: Any?) -> Bool
}

// ----------------------------------------------------------------------------
