// ----------------------------------------------------------------------------
//
//  JsonValidationError.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

class JsonValidationError: ErrorType
{
// MARK: - Construction

    init(params: [String : AnyObject]?, cause: AssertionError?)  {
        self.params = params
        self.cause = cause
    }

// MARK: - Properties

    // ...

// MARK: - Functions

    // ...

// MARK: - Actions

    // ...

// MARK: - Private Functions

    // ...

// MARK: - Inner Types

    // ...

// MARK: - Constants

    // ...

// MARK: - Variables

    public let params: [String : AnyObject]?

    public let cause: AssertionError?

}

// ----------------------------------------------------------------------------
