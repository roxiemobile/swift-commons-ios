// ----------------------------------------------------------------------------
//
//  Guard.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

/// A set of methods useful for validating objects states. Only failed checks are raises exceptions.
/// These methods can be used directly: `Guard.isTrue(...)`.
public final class Guard: NonCreatable
{
// MARK: - Internal Methods

    /// Initializes a new instance of the `GuardException` class with a specified error message and a reference to the inner error that is the cause of this exception.
    ///
    /// - Parameters:
    ///   - message: The error message that explains the reason for the exception. The default is an empty string.
    ///   - innerError: The error that is the cause of the current exception, or a `nil` reference if no inner error is specified.
    ///   - file: The file name.
    ///   - line: The line number.
    ///
    /// - Returns:
    ///   A new instance of a GuardException.
    ///
    internal static func newGuardException(_ message: @autoclosure () -> String = "", _ error: Error? = nil, _ file: StaticString, _ line: UInt) -> GuardException {
        return GuardException(reason: "Fatal error: \(message())\nFile: \(file)\nLine: \(line)", cause: error)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    internal static func tryIsFailure(_ action: @autoclosure () throws -> ()) -> Error? {
        var cause: Error? = nil

        do {
            try action()
        }
        catch let error as CheckError {
            cause = error
        }
        catch {
            Roxie.fatalError("Unexpected error is thrown", error: error)
        }
        return cause
    }
}

// ----------------------------------------------------------------------------
