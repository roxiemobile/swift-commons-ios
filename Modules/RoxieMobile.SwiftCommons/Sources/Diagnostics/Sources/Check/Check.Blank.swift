// ----------------------------------------------------------------------------
//
//  Check.Blank.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Check
{
// MARK: - Methods

    /// Checks that a string is `nil`, empty or contains only whitespace characters.
    ///
    /// - Parameters:
    ///   - value: The string to check or `nil`.
    ///   - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   CheckError
    ///
    public static func blank(_ value: String?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) throws {
        guard value.isBlank else {
            throw newCheckError(message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------
