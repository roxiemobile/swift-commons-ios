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
import SwiftCommonsLang

// ----------------------------------------------------------------------------

/// Represents an exception which indicate that a validation has failed.
public final class GuardException: NSException {
// MARK: - Construction

    /// Initializes and returns a newly created exception object.
    ///
    /// - Parameters:
    ///   - reason: A human-readable message string summarizing the reason for the exception.
    ///   - cause: The error that is the cause of the current exception, or a `nil` reference if no cause is specified.
    ///   - userInfo: A dictionary containing user-defined information relating to the exception.
    ///
    public init(reason: String? = nil, cause: Error? = nil, userInfo: [AnyHashable: Any]? = nil) {
        // Init instance
        self.cause = cause

        // Parent processing
        super.init(name: Inner.ExceptionName, reason: reason, userInfo: userInfo)
    }

    /// Returns an object initialized from data in a given unarchiver.
    ///
    /// - Parameters:
    ///   - decoder: An unarchiver object.
    ///
    public required init?(coder decoder: NSCoder) {
        Roxie.fatalError("NSCoding not supported")
    }

// MARK: - Properties

    /// The error that is the cause of the current exception, or a `nil` reference if no cause is specified.
    public let cause: Error?

// MARK: - Constants

    private struct Inner {
        static let ExceptionName = NSExceptionName(rawValue: Roxie.typeName(of: GuardException.self))
    }
}

// ----------------------------------------------------------------------------
