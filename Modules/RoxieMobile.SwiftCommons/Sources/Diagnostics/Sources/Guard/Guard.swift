// ----------------------------------------------------------------------------
//
//  Guard.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsLang

// ----------------------------------------------------------------------------

/// A set of methods useful for validating objects states. Only failed checks are raises exceptions.
/// These methods can be used directly: `Guard.isTrue(...)`.
public final class Guard: NonCreatable {

// MARK: - Internal Methods

    /// Initializes a new instance of the `GuardException` class with a specified error message
    /// and a reference to the inner error that is the cause of this exception.
    ///
    /// - Parameters:
    ///   - message: The error message that explains the reason for the exception. The default is an empty string.
    ///   - error: The error that is the cause of the current exception, or a `nil` reference
    ///       if no inner error is specified.
    ///   - file: The file name.
    ///   - line: The line number.
    ///
    /// - Returns:
    ///   A new instance of a GuardException.
    ///
    internal static func newGuardException(
        _ message: @autoclosure () -> String = "",
        _ error: Error? = nil,
        _ file: StaticString,
        _ line: UInt
    ) -> GuardException {

        return GuardException(reason: "Fatal error: \(message())\nFile: \(file)\nLine: \(line)", cause: error)
    }

    /// Calls the action and catches a `CheckError` if it will be thrown.
    ///
    /// - Parameters:
    ///   - action: A delegate to the code that can throw a `CheckError` when executed.
    ///
    /// - Returns:
    ///   `Error` if an error thrown; otherwise, `nil`.
    ///
    internal static func tryIsFailure(_ action: @autoclosure () throws -> Void) -> Error? {
        var cause: Error?

        do {
            try action()
        }
        catch let error as CheckError {
            cause = error
        }
        catch {
            Roxie.fatalError("Unexpected error is thrown", cause: error)
        }
        return cause
    }
}
