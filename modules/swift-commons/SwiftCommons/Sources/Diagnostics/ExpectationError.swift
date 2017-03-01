// ----------------------------------------------------------------------------
//
//  ExpectationError.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

/// Thrown to indicate that an expectation has failed.
public class ExpectationError: ErrorType, Printable
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

        if let reason = self.message?.trim() where reason.isNotEmpty {
            errorMessage += " with reason: \(reason)"
        }
        return errorMessage
    }
}

// ----------------------------------------------------------------------------
