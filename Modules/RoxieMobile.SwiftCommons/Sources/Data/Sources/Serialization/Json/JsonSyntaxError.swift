// ----------------------------------------------------------------------------
//
//  JsonSyntaxError.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

/// Represents an error encountered while parsing JSON data.
public struct JsonSyntaxError: Error
{
// MARK: - Construction

    /// Initializes and returns a newly created error object.
    ///
    /// - Parameters:
    ///   - reason: A human-readable message string summarizing the reason for the exception.
    ///   - JSON: A dictionary containing JSON data.
    ///   - cause: The exception that is the cause of the current error, or a `nil` reference if no cause is specified.
    ///
    public init(reason: String? = nil, JSON: JsonObject? = nil, cause: NSException? = nil) {

        // Init instance
        self.reason = reason
        self.JSON = JSON
        self.cause = cause
    }

// MARK: - Properties

    /// A human-readable message string summarizing the reason for the error.
    public let reason: String?

    /// A dictionary containing JSON data.
    public let JSON: JsonObject?

    /// The exception that is the cause of the current error.
    public let cause: NSException?
}

// ----------------------------------------------------------------------------
