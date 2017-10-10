// ----------------------------------------------------------------------------
//
//  PostValidatable.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@available(*, deprecated, message: "\n• Write a description.")
public protocol AnyPostValidatable
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

@available(*, deprecated, message: "\n• Write a description.")
public protocol PostValidatable: AnyPostValidatable {
    // Do nothing
}

// ----------------------------------------------------------------------------
