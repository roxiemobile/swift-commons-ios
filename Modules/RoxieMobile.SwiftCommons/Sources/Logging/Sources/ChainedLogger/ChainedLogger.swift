// ----------------------------------------------------------------------------
//
//  ChainedLogger.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

/// A logger which allows to chain multiple loggers together.
public final class ChainedLogger: LoggerContract
{
// MARK: - Construction

    /// Initializes and returns a newly created logger object.
    ///
    /// - Parameters:
    ///   - loggers: A loggers which must be chained together.
    ///
    public init(loggers: LoggerContract...) {
        self.loggers = loggers
    }

// MARK: - Properties

    internal let loggers: [LoggerContract]
}

// ----------------------------------------------------------------------------
