// ----------------------------------------------------------------------------
//
//  ChainedLogger.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

@available(*, deprecated, message: "\n• Write a description.")
public final class ChainedLogger: LoggerContract
{
// MARK: - Construction

    @available(*, deprecated, message: "\n• Write a description.")
    public init(loggers: LoggerContract...)
    {
        // Init instance variables
        self.loggers = loggers
    }

// MARK: - Properties

    internal let loggers: [LoggerContract]
}

// ----------------------------------------------------------------------------
