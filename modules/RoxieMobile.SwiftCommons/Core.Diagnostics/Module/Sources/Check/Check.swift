// ----------------------------------------------------------------------------
//
//  Check.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

/*
public static partial class Check
{
// MARK: - Methods

    /// <summary>
    /// Initializes a new instance of the `CheckError` class with a specified error message and a reference to the inner exception that is the cause of this exception.
    /// </summary>
    /// - message: The error message that explains the reason for the exception.
    /// - innerException: The exception that is the cause of the current exception, or a `nil` reference if no inner exception is specified.
    public static CheckException NewCheckException(string message, Exception innerException = null) =>
        string.IsNullOrWhiteSpace(message)
            ? new CheckException(innerException)
            : new CheckException(message, innerException);

    /// <summary>
    /// Initializes a new instance of the `CheckError` class with a reference to the inner exception that is the cause of this exception.
    /// </summary>
    /// - innerException: The exception that is the cause of the current exception, or a `nil` reference if no inner exception is specified.
    public static CheckException NewCheckException(Exception innerException = null) =>
        new CheckException(innerException);
}
*/

/// A set of methods useful for validating objects states. Only failed checks are throws errors.
/// These methods can be used directly: `Check.isTrue(...)`.
public final class Check: NonCreatable
{
// MARK: - Internal Methods

    @available(*, deprecated, message: "\n• Write a description.")
    internal static func newCheckError(_ message: @autoclosure () -> String?, _ file: StaticString = #file, _ line: UInt = #line) -> CheckError {
        return CheckError(message(), file: file, line: line)
    }

// MARK: - Private Methods

//    // TODO
//    @available(*, deprecated)
//    internal static func safeEqual<T:Equatable>(_ expected: T?, _ actual: T?) -> Bool {
//        return (expected == nil && actual == nil) || (expected != nil && actual != nil && expected == actual)
//    }
}

// ----------------------------------------------------------------------------
