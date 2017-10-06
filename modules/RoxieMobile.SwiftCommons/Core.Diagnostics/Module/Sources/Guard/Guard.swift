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

/*
public static partial class Guard
{
// MARK: - Methods

    /// <summary>
    /// Initializes a new instance of the `GuardException` class with a specified error message and a reference to the inner exception that is the cause of this error.
    /// </summary>
    /// - message: The error message that explains the reason for the error.
    /// - innerException: The exception that is the cause of the current error, or a `nil` reference if no inner exception is specified.
    public static GuardError NewGuardError(string message, Exception innerException = null) =>
        string.IsNullOrWhiteSpace(message)
            ? new GuardError(innerException)
            : new GuardError(message, innerException);

    /// <summary>
    /// Initializes a new instance of the `GuardException` class with a reference to the inner exception that is the cause of this error.
    /// </summary>
    /// - innerException: The exception that is the cause of the current error, or a `nil` reference if no inner exception is specified.
    public static GuardError NewGuardError(Exception innerException = null) =>
        new GuardError(innerException);

// MARK: - Private Methods

    private static bool TryIsFailure(Action block, out Exception cause)
    {
        if (block == null) {
            throw new ArgumentNullException(nameof(block));
        }

        cause = null;
        try {
            block();
        }
        catch (CheckException e) {
            cause = e;
        }

        return (cause != null);
    }
}
*/

/// A set of methods useful for validating objects states. Only failed checks are raises exceptions.
/// These methods can be used directly: `Guard.isTrue(...)`.
public final class Guard: NonCreatable
{
// MARK: - Internal Methods

//    private static bool TryIsFailure(Action block, out Exception cause)
//    {
//        if (block == null) {
//            throw new ArgumentNullException(nameof(block));
//        }
//
//        cause = null;
//        try {
//            block();
//        }
//        catch (CheckException e) {
//            cause = e;
//        }
//
//        return (cause != null);
//    }

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

    /// <summary>
    /// Initializes a new instance of the `GuardException` class with a specified error message and a reference to the inner exception that is the cause of this error.
    /// </summary>
    /// - message: The error message that explains the reason for the error.
    /// - innerException: The exception that is the cause of the current error, or a `nil` reference if no inner exception is specified.
    internal static func newGuardException(_ message: @autoclosure () -> String?, _ error: Error? = nil, _ file: StaticString = #file, _ line: UInt = #line) -> GuardException {
        return GuardException(reason: "Fatal error: \(message() ?? "")\nFile: \(file)\nLine: \(line)", cause: error)
    }

// MARK: - Private Methods

//    // TODO
//    @available(*, deprecated)
//    internal static func rethrowOnFailure(_ message: String?, _ file: StaticString, _ line: UInt, _ block: () throws -> ()) {
//        do {
//            try block()
//        }
//        catch _ as ExpectationError {
//            raiseException(message, file, line)
//        }
//        catch {
//            Roxie.fatalError(message ?? "", file: file, line: line)
//        }
//    }
//
//    @available(*, deprecated)
//    internal static func raiseException(_ message: String? = nil, file: StaticString = #file, line: UInt = #line) {
//        GuardException("Fatal error: \(message ?? "")\nFile: \(file)\nLine: \(line)", userInfo: nil).raise()
//    }

//    public static func rethrowOnFailure(_ message: String?, _ file: StaticString, _ line: UInt, _ block: () throws -> ()) {
//        do {
//            try block()
//        }
//        catch _ as ExpectationError {
//            raiseException(message, file, line)
//        }
//        catch {
//            rxm_fatalError(message: message ?? "", file: file, line: line)
//        }
//    }
//
//    public static func raiseException(_ message: String? = nil, file: StaticString = #file, line: UInt = #line) {
//        RequirementException("Fatal error: \(message ?? "")\nFile: \(file)\nLine: \(line)", userInfo: nil).raise()
//    }
}

// ----------------------------------------------------------------------------
