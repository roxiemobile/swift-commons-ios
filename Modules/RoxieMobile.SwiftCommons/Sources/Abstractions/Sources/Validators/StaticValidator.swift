// ----------------------------------------------------------------------------
//
//  StaticValidator.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public protocol StaticValidator
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
    static func isValid(_ value: Any?) -> Bool
}

// ----------------------------------------------------------------------------
