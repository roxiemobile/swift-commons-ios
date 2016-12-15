// ----------------------------------------------------------------------------
//
//  AssertionError.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

class AssertionError: ErrorType
{
// MARK: - Construction

    init(message: String?, line: UInt? = #line, file: String? = #file)
    {
        self.message = message
        self.line = line
        self.file = file
    }

// MARK: - Properties

    public let message: String?

    public let line: UInt?

    public let file: String?
    
}

// ----------------------------------------------------------------------------
