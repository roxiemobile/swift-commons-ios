// ----------------------------------------------------------------------------
//
//  PostValidatable.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public protocol PostValidatable
{
// MARK: - Methods

    /// Checks if object should be validated after construction.
    /// 
    /// - Returns:
    ///   `true` if object should be validated after construction; otherwise, `false`.
    func isShouldPostValidate() -> Bool

    /// Checks the current state of the object for correctness.
    func validate() throws
}

// ----------------------------------------------------------------------------
