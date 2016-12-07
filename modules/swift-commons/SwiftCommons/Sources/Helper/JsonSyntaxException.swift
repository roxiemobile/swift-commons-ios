// ----------------------------------------------------------------------------
//
//  JsonSyntaxException.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

// FIXME: Refactoring is required
public class JsonSyntaxException: ErrorType
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

    private init(message: String?, cause: NSException?)  {
        self.message = message
        self.cause = cause
    }

// MARK: - Properties

    let message: String?

    let cause: NSException?

}

// ----------------------------------------------------------------------------
