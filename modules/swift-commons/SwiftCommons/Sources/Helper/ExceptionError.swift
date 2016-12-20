// ----------------------------------------------------------------------------
//
//  ExceptionError.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public class ExceptionError: ErrorType
{
// MARK: - Construction

    public init(message: String?, file: StaticString = #file, line: UInt = #line)
    {
        self.message = message
        self.line = line
        self.file = file
    }

// MARK: - Properties

    public let message: String?

    public let line: UInt

    public let file: StaticString
    
}

// ----------------------------------------------------------------------------
