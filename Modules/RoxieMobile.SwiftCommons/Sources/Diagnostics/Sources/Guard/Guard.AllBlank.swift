// ----------------------------------------------------------------------------
//
//  Guard.AllBlank.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Guard {

// MARK: - Methods

    /// Checks that all a string values in collection is empty or contains only whitespace characters.
    ///
    /// - Parameters:
    ///   - values: An collection of string values.
    ///   - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   GuardException
    ///
    public static func allBlank<T: Collection>(
        _ values: T?,
        _ message: @autoclosure () -> String = "",
        file: StaticString = #file,
        line: UInt = #line
    ) where T.Element == String {

        if let error = tryIsFailure(try Check.allBlank(values)) {
            newGuardException(message(), error, file, line).raise()
        }
    }

    /// Checks that all a string values in collection is `nil`, empty or contains only whitespace characters.
    ///
    /// - Parameters:
    ///   - values: An collection of string values.
    ///   - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   GuardException
    ///
    public static func allBlank<T: Collection>(
        _ values: T?,
        _ message: @autoclosure () -> String = "",
        file: StaticString = #file,
        line: UInt = #line
    ) where T.Element == String? {

        if let error = tryIsFailure(try Check.allBlank(values)) {
            newGuardException(message(), error, file, line).raise()
        }
    }
}
