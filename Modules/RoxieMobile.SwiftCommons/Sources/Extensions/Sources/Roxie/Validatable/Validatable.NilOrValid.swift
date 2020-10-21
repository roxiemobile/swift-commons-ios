// ----------------------------------------------------------------------------
//
//  Validatable.NilOrValid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsAbstractions

// ----------------------------------------------------------------------------

public extension Optional where Wrapped == Validatable
{
// MARK: - Properties

    /// Checks that an object is `nil` or valid.
    ///
    /// - Returns:
    ///   `true` if object is `nil` or valid; otherwise, `false`.
    ///
    var isNilOrValid: Bool {
        return (self == nil) || self!.isValid
    }

    /// Checks that an object is `nil` or not valid.
    ///
    /// - Returns:
    ///   `true` if object is `nil` or not valid; otherwise, `false`.
    ///
    var isNilOrNotValid: Bool {
        return (self == nil) || self!.isNotValid
    }
}

// ----------------------------------------------------------------------------
