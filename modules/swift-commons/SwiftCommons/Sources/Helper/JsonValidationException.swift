// ----------------------------------------------------------------------------
//
//  JsonValidationException.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

class JsonValidationException: ErrorType
{
// MARK: - Construction

    public convenience init() {
        self.init(message: nil, params: nil, line: nil, file: nil)
    }

//    public convenience init(message: String) {
//        self.init(message: message, cause: nil)
//    }

    public convenience init(message: String?, params: [String : AnyObject], line: UInt? = #line, file: String? = #file)  {
        self.init(message: message, params: params, line: line, file: file)
    }

//    public convenience init(cause: NSException)  {
//        self.init(message: nil, cause: nil)
//    }
//
//    public convenience init(cause: NSException)  {
//        self.init(message: nil, cause: nil)
//    }

    private init(message: String?, params: [String : AnyObject]?, line: UInt?, file: String?)
    {
        self.message = message
        self.params = params
        self.line = line
        self.file = file
    }

// MARK: - Properties

    public let message: String?

    public let params: [String : AnyObject]?

    public let line: UInt?

    public let file: String?
    
}

// ----------------------------------------------------------------------------
