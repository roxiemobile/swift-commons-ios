// ----------------------------------------------------------------------------
//
//  JsonSyntaxError.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

@available(*, deprecated, message: "\n• Write a description.")
public struct JsonSyntaxError: Error
{
// MARK: - Construction

    @available(*, deprecated, message: "\n• Write a description.")
    public init(message: String? = nil, JSON: JsonObject? = nil, cause: NSException? = nil)
    {
        // Init instance variables
        self.message = message
        self.JSON = JSON
        self.cause = cause
    }

// MARK: - Properties

    @available(*, deprecated, message: "\n• Write a description.")
    public let message: String?

    @available(*, deprecated, message: "\n• Write a description.")
    public let JSON: JsonObject?

    @available(*, deprecated, message: "\n• Write a description.")
    public let cause: NSException?
}

// ----------------------------------------------------------------------------
