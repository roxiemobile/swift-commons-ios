// ----------------------------------------------------------------------------
//
//  PostValidatable.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

/// Protocol for objects that can be validated after construction.
public protocol PostValidatable
{
// MARK: - Properties

    /// Checks if object should be validated after construction.
    /// 
    /// - Returns:
    ///   `true` if object should be validated after construction; otherwise, `false`.
    ///
    var isShouldPostValidate: Bool { get }

// MARK: - Methods

    /// Checks the current state of the object for correctness.
    func validate() throws
}

// ----------------------------------------------------------------------------

