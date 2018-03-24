// ----------------------------------------------------------------------------
//
//  Validatable.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

/// Protocol for objects that can be validated.
public protocol Validatable
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
