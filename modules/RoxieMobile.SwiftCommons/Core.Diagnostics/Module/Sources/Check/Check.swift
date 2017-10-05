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
    /// Initializes a new instance of the <see cref="CheckException"/> class with a specified error message and a reference to the inner exception that is the cause of this exception.
    /// </summary>
    /// <param name="message">The error message that explains the reason for the exception.</param>
    /// <param name="innerException">The exception that is the cause of the current exception, or a <c>null</c> reference if no inner exception is specified.</param>
    public static CheckException NewCheckException(string message, Exception innerException = null) =>
        string.IsNullOrWhiteSpace(message)
            ? new CheckException(innerException)
            : new CheckException(message, innerException);

    /// <summary>
    /// Initializes a new instance of the <see cref="CheckException"/> class with a reference to the inner exception that is the cause of this exception.
    /// </summary>
    /// <param name="innerException">The exception that is the cause of the current exception, or a <c>null</c> reference if no inner exception is specified.</param>
    public static CheckException NewCheckException(Exception innerException = null) =>
        new CheckException(innerException);
}
*/

/// A set of methods useful for validating objects states. Only failed checks are throws errors.
/// These methods can be used directly: `Check.isTrue(...)`.
public final class Check: NonCreatable
{
// MARK: - Private Methods

//    // TODO
//    @available(*, deprecated)
//    internal static func safeEqual<T:Equatable>(_ expected: T?, _ actual: T?) -> Bool {
//        return (expected == nil && actual == nil) || (expected != nil && actual != nil && expected == actual)
//    }
//
//    @available(*, deprecated)
//    internal static func throwError(_ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        throw ExpectationError(message, file: file, line: line)
//    }
}

// ----------------------------------------------------------------------------
