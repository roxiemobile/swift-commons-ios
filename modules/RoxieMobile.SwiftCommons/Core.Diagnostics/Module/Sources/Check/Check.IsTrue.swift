// ----------------------------------------------------------------------------
//
//  Check.IsTrue.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

extension Check
{
// MARK: - Methods

    /**
     Checks that a condition is `true`.

     - Parameters:
         - condition: Condition to be checked.
         - message: The identifying message for the `CheckError` (`nil` okay).

     - Throws:
         CheckError
     */
    public static func isTrue(_ condition: Bool, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) throws {
        if !condition {
            throw newCheckError(message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------
