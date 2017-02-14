// ----------------------------------------------------------------------------
//
//  ExpectationError.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public class ExpectationError: ErrorType
{
// MARK: - Construction

    public init(_ message: String, file: StaticString = #file, line: UInt = #line)
    {
        // Init instance variables
        self.message = message
        self.file = file
        self.line = line
    }

// MARK: - Properties

    public let message: String

    public let file: StaticString

    public let line: UInt

}

// ----------------------------------------------------------------------------
