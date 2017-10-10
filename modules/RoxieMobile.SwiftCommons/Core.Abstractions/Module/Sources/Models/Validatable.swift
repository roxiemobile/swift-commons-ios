// ----------------------------------------------------------------------------
//
//  Validatable.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@available(*, deprecated, message: "\n• Write a description.")
public protocol AnyValidatable
{
// MARK: - Properties

    /// Checks that an object is valid.
    /// 
    /// - Returns:
    ///   `true` if object is valid; otherwise, `false`.
    ///
    var isValid: Bool { get }
}

// ----------------------------------------------------------------------------

@available(*, deprecated, message: "\n• Write a description.")
public protocol Validatable: AnyValidatable {
    // Do nothing
}

// ----------------------------------------------------------------------------
