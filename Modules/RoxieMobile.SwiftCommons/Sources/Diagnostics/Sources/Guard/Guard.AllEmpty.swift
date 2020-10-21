// ----------------------------------------------------------------------------
//
//  Guard.AllEmpty.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Guard
{
// MARK: - Methods

    /// Checks that all a string objects in collection is empty.
    ///
    /// - Parameters:
    ///   - values: An collection of string objects.
    ///   - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   GuardException
    ///
    public static func allEmpty<T:Collection>(
            _ values: T?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line
    ) where T.Element == String {
        // objects: Collection<String>?

        if let error = tryIsFailure(try Check.allEmpty(values)) {
            newGuardException(message(), error, file, line).raise()
        }
    }

    /// Checks that all a string objects in collection is `nil` or empty.
    ///
    /// - Parameters:
    ///   - values: An collection of string objects.
    ///   - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   GuardException
    ///
    public static func allEmpty<T:Collection>(
            _ values: T?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line
    ) where T.Element == Optional<String> {
        // objects: Collection<String?>?

        if let error = tryIsFailure(try Check.allEmpty(values)) {
            newGuardException(message(), error, file, line).raise()
        }
    }
}

// ----------------------------------------------------------------------------
