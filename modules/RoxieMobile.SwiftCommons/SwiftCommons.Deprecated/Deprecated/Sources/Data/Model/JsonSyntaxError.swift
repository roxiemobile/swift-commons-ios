// ----------------------------------------------------------------------------
//
//  JsonSyntaxError.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

@available(*, deprecated)
public class JsonSyntaxError: Error
{
// MARK: - Construction

    @available(*, deprecated)
    public init(message: String? = nil, params: [String: AnyObject]? = nil, cause: NSException? = nil)
    {
        // Init instance variables
        self.message = message
        self.params = params
        self.cause = cause
    }

// MARK: - Properties

    public let message: String?

    public let params: [String: AnyObject]?

    public let cause: NSException?
}

// ----------------------------------------------------------------------------
