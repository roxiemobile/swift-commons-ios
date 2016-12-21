// ----------------------------------------------------------------------------
//
//  ExpectionError.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

// @new
// FIXME: Remname “Expection” to “Expectation”
public class ExpectionError: ErrorType
{
// MARK: - Construction

    public init(message: String?, file: StaticString = #file, line: UInt = #line)
    {
        self.message = message
        self.file = file
        self.line = line
    }

// MARK: - Properties

    public let message: String?

    public let file: StaticString

    public let line: UInt

}

// ----------------------------------------------------------------------------
