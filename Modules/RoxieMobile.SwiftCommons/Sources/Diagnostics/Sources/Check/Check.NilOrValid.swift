// ----------------------------------------------------------------------------
//
//  Check.NilOrValid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsAbstractions

// ----------------------------------------------------------------------------

extension Check
{
// MARK: - Methods

    /// Checks that an object is `nil` or valid.
    ///
    /// - Parameters:
    ///   - object: Object to check or `nil`.
    ///   - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   CheckError
    ///
    public static func nilOrValid(_ object: Validatable?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) throws {
        guard (object == nil) || object!.isValid else {
            throw newCheckError(message(), file, line)
        }
    }
}

// ----------------------------------------------------------------------------
