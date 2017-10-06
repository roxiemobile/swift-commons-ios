// ----------------------------------------------------------------------------
//
//  CheckError.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

/*
public sealed class CheckError : Exception
{
// MARK: - Construction

    /// <summary>
    /// Initializes a new instance of the `CheckError` class.
    /// </summary>
    public CheckException()
    {}

    /// <summary>
    /// Initializes a new instance of the `CheckError` class with a specified error message.
    /// </summary>
    /// - message: The message that describes the error.
    public CheckException(string message)
        : base(message)
    {}

    /// <summary>
    /// Initializes a new instance of the `CheckError` class with a specified error message and a reference to the inner exception that is the cause of this exception.
    /// </summary>
    /// - message: The error message that explains the reason for the exception.
    /// - innerException: The exception that is the cause of the current exception, or a `nil` reference if no inner exception is specified.
    public CheckException(string message, Exception innerException)
        : base(message, innerException)
    {}

    /// <summary>
    /// Initializes a new instance of the `CheckError` class with a reference to the inner exception that is the cause of this exception.
    /// </summary>
    /// - innerException: The exception that is the cause of the current exception, or a `nil` reference if no inner exception is specified.
    public CheckException(Exception innerException)
        : base(null, innerException)
    {}
}
*/

/*
/// Thrown to indicate that an expectation has failed.
public class ExpectationError: Error, CustomStringConvertible
{
// MARK: - Construction

    public init(_ message: String?, file: StaticString = #file, line: UInt = #line) {
        // Init instance variables
        self.message = message
        self.file = file
        self.line = line
    }

// MARK: - Properties

    public let message: String?

    public let file: StaticString

    public let line: UInt

// MARK: - Methods

    /// A customized textual representation of {@code ExpectationError}.
    public var description: String {
        var errorMessage = typeName(self)

        if let reason = self.message?.trim(), reason.isNotEmpty {
            errorMessage += " with reason: \(reason)"
        }
        return errorMessage
    }
}
*/

/// Thrown to indicate that an validation has failed.
public class CheckError: Error, CustomStringConvertible
{
// MARK: - Construction

    @available(*, deprecated, message: "\n• Write a description.")
    public init(_ message: String?, file: StaticString = #file, line: UInt = #line)
    {
        // Init instance variables
        self.message = message
        self.file = file
        self.line = line
    }

// MARK: - Properties

    @available(*, deprecated, message: "\n• Write a description.")
    public let message: String?

    @available(*, deprecated, message: "\n• Write a description.")
    public let file: StaticString

    @available(*, deprecated, message: "\n• Write a description.")
    public let line: UInt

// MARK: - Methods

    /// A customized textual representation of {@code ExpectationError}.
    @available(*, deprecated, message: "\n• Code refactoring is required.")
    public var description: String {
        var errorMessage = Roxie.typeName(of: self)

        if let reason = self.message?.trim(), reason.isNotEmpty {
            errorMessage += " with reason: \(reason)"
        }
        return errorMessage
    }
}

// ----------------------------------------------------------------------------
