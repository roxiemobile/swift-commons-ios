// ----------------------------------------------------------------------------
//
//  Guard.Empty.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Guard
{
// MARK: - Methods: String

    /// Checks that a string is `nil` or empty.
    ///
    /// - Parameters:
    ///   - value: The string to check or `nil`.
    ///   - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   GuardException
    ///
    public static func empty(_ value: String?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
        if let error = tryIsFailure(try Check.empty(value)) {
            newGuardException(message, error, file, line).raise()
        }
    }

// MARK: - Methods: Collection

    /// Checks that a collection is `nil` or empty.
    ///
    /// - Parameters:
    ///   - collection: The collection to check or `nil`.
    ///   - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   GuardException
    ///
    public static func empty<T:Collection>(_ collection: T?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
        if let error = tryIsFailure(try Check.empty(collection)) {
            newGuardException(message, error, file, line).raise()
        }
    }
}

// ----------------------------------------------------------------------------
