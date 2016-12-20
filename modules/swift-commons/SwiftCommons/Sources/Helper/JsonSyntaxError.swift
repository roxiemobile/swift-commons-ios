// ----------------------------------------------------------------------------
//
//  JsonSyntaxError.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

// @new
// FIXME: Refactoring is required
public class JsonSyntaxError: ErrorType
{
// MARK: - Construction

    public convenience init() {
        self.init(message: nil, cause: nil)
    }

    public convenience init(message: String) {
        self.init(message: message, cause: nil)
    }

    public convenience init(message: String, cause: NSException)  {
        self.init(message: message, cause: cause)
    }

    public convenience init(cause: NSException)  {
        self.init(message: nil, cause: nil)
    }

    private init(message: String?, cause: NSException?)
    {
        // Init instance variables
        self.message = message
        self.cause = cause
    }

// MARK: - Properties

    public let message: String?

    public let cause: NSException?

}

// ----------------------------------------------------------------------------
