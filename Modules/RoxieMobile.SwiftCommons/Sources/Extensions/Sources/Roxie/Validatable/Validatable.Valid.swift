// ----------------------------------------------------------------------------
//
//  Validatable.Valid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsAbstractions

// ----------------------------------------------------------------------------

public extension Validatable
{
// MARK: - Properties

    /// Checks that an object is not valid.
    ///
    /// - Returns:
    ///   `true` if object is not valid; otherwise, `false`.
    ///
    var isNotValid: Bool {
        return !self.isValid
    }
}

// ----------------------------------------------------------------------------
