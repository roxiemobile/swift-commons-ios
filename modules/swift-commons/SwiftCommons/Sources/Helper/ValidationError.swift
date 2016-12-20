// ----------------------------------------------------------------------------
//
//  ValidationError.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public class ValidationError: ErrorType
{
// MARK: - Construction

    public init(params: [String : AnyObject]?, cause: ExceptionError?)  {
        self.params = params
        self.cause = cause
    }

// MARK: - Properties

    public let params: [String : AnyObject]?

    public let cause: ExceptionError?

}

// ----------------------------------------------------------------------------
