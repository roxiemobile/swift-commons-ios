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

/// Thrown to indicate that an expectation has failed.
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
