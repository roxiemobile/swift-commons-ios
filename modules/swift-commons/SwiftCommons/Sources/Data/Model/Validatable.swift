// ----------------------------------------------------------------------------
//
//  Validatable.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public protocol Validatable
{
// MARK: - Methods

    /// Tests the current value of the object.
    func isValid() -> Bool
}

// ----------------------------------------------------------------------------
