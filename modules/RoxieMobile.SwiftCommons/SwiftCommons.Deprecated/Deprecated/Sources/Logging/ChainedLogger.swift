// ----------------------------------------------------------------------------
//
//  ChainedLogger.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2017, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

@available(*, deprecated)
public final class ChainedLogger: LoggerContract
{
// MARK: - Construction

    @available(*, deprecated)
    public init(loggers: LoggerContract...)
    {
        // Init instance variables
        self.loggers = loggers
    }

// MARK: - Methods

    @available(*, deprecated)
    public func v(_ tag: String, _ message: String) {
        self.loggers.each { $0.v(tag, message) }
    }

    @available(*, deprecated)
    public func d(_ tag: String, _ message: String) {
        self.loggers.each { $0.d(tag, message) }
    }

    @available(*, deprecated)
    public func i(_ tag: String, _ message: String) {
        self.loggers.each { $0.i(tag, message) }
    }

// --

    @available(*, deprecated)
    public func w(_ tag: String, _ message: String) {
        self.loggers.each { $0.w(tag, message) }
    }

    @available(*, deprecated)
    public func w(_ tag: String, _ message: String, _ error: Error?) {
        self.loggers.each { $0.w(tag, message, error) }
    }

    @available(*, deprecated)
    public func w(_ tag: String, _ message: String, _ error: NSError?) {
        self.loggers.each { $0.w(tag, message, error) }
    }

    @available(*, deprecated)
    public func w(_ tag: String, _ message: String, _ exception: NSException?) {
        self.loggers.each { $0.w(tag, message, exception) }
    }

    @available(*, deprecated)
    public func w(_ tag: String, _ error: Error) {
        self.loggers.each { $0.w(tag, error) }
    }

    @available(*, deprecated)
    public func w(_ tag: String, _ error: NSError) {
        self.loggers.each { $0.w(tag, error) }
    }

    @available(*, deprecated)
    public func w(_ tag: String, _ exception: NSException) {
        self.loggers.each { $0.w(tag, exception) }
    }

// --

    @available(*, deprecated)
    public func e(_ tag: String, _ message: String) {
        self.loggers.each { $0.e(tag, message) }
    }

    @available(*, deprecated)
    public func e(_ tag: String, _ message: String, _ error: Error?) {
        self.loggers.each { $0.e(tag, message, error) }
    }

    @available(*, deprecated)
    public func e(_ tag: String, _ message: String, _ error: NSError?) {
        self.loggers.each { $0.e(tag, message, error) }
    }

    @available(*, deprecated)
    public func e(_ tag: String, _ message: String, _ exception: NSException?) {
        self.loggers.each { $0.e(tag, message, exception) }
    }

    @available(*, deprecated)
    public func e(_ tag: String, _ error: Error) {
        self.loggers.each { $0.e(tag, error) }
    }

    @available(*, deprecated)
    public func e(_ tag: String, _ error: NSError) {
        self.loggers.each { $0.e(tag, error) }
    }

    @available(*, deprecated)
    public func e(_ tag: String, _ exception: NSException) {
        self.loggers.each { $0.e(tag, exception) }
    }

// MARK: - Variables

    private let loggers: [LoggerContract]
}

// ----------------------------------------------------------------------------
