// ----------------------------------------------------------------------------
//
//  GuardException.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommons

// ----------------------------------------------------------------------------

/*
public sealed class GuardException : Error
{
// MARK: - Construction

    /// <summary>
    /// Initializes a new instance of the `GuardException` class.
    /// </summary>
    public GuardError()
    {}

    /// <summary>
    /// Initializes a new instance of the `GuardException` class with a specified error message.
    /// </summary>
    /// - message: The message that describes the error.
    public GuardError(string message)
        : base(message)
    {}

    /// <summary>
    /// Initializes a new instance of the `GuardException` class with a specified error message and a reference to the inner exception that is the cause of this error.
    /// </summary>
    /// - message: The error message that explains the reason for the error.
    /// - innerException: The exception that is the cause of the current error, or a `nil` reference if no inner exception is specified.
    public GuardError(string message, Exception innerException)
        : base(message, innerException)
    {}

    /// <summary>
    /// Initializes a new instance of the `GuardException` class with a reference to the inner exception that is the cause of this error.
    /// </summary>
    /// - innerException: The exception that is the cause of the current error, or a `nil` reference if no inner exception is specified.
    public GuardError(Exception innerException)
        : base(null, innerException)
    {}
}
*/

/// Thrown to indicate that an validation has failed.
public final class GuardException: NSException
{
// MARK: - Construction

    @available(*, deprecated, message: "\n• Write a description.")
    public init(reason aReason: String? = nil, cause innerError: Error? = nil, userInfo aUserInfo: [AnyHashable : Any]? = nil)
    {
        // Init instance
        self.innerError = innerError

        // Parent processing
        super.init(name: Inner.ExceptionName, reason: aReason, userInfo: aUserInfo)
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public required init?(coder aDecoder: NSCoder) {
        Roxie.fatalError("NSCoding not supported")
    }

// MARK: - Properties

    /// The error that is the cause of the current exception, or a `nil` reference if no inner error is specified.
    public let innerError: Error?

// MARK: - Constants

    private struct Inner {
        static let ExceptionName = NSExceptionName(rawValue: Roxie.typeName(of: GuardException.self))
    }
}

// ----------------------------------------------------------------------------
