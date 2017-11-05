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

/// Thrown to indicate that an validation has failed.
public struct CheckError: Error, CustomStringConvertible
{
// MARK: - Construction

    /// Initializes a new instance of the `CheckError` class with a specified error message.
    ///
    /// - Parameters:
    ///   - message: The identifying message that explains the reason for the error.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public init(_ message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        // Init instance variables
        self.message = message
        self.file = file
        self.line = line
    }

// MARK: - Properties

    /// The identifying message that explains the reason for the error.
    public let message: String?

    /// The file name where error is created.
    public let file: StaticString

    /// The line number where error is created.
    public let line: UInt

// MARK: - Methods

    /// A customized textual representation of `CheckError`.
    public var description: String {
        var errorMessage = Roxie.typeName(of: self)

        if let reason = self.message?.trim(), reason.isNotEmpty {
            errorMessage += " with reason: \(reason)"
        }
        return errorMessage
    }
}

// ----------------------------------------------------------------------------
