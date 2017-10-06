// ----------------------------------------------------------------------------
//
//  Guard.IsNil.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

extension Guard
{
// MARK: - Methods

    /**
     Checks that an object is `nil`.

     - Parameters:
        - reference: Object to check or `nil`.
        - message: The identifying message for the `GuardException` (`nil` okay).

     - Throws:
        GuardException
     */
    public static func isNil(_ reference: Any?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if let error = tryIsFailure(try Check.isNil(reference)) {
            newGuardException(message, error, file, line).raise()
        }
    }
}

// ----------------------------------------------------------------------------
