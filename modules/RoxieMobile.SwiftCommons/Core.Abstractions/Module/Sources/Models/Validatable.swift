// ----------------------------------------------------------------------------
//
//  Validatable.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public protocol Validatable
{
// MARK: - Methods

    /// Tests the current state of the object.
    /// 
    /// - Returns:
    ///   `true` if object validation succeeded; otherwise, `false`.
    ///
    func isValid() -> Bool
}

// ----------------------------------------------------------------------------
