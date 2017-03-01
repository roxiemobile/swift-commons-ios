// ----------------------------------------------------------------------------
//
//  ChainedLogger.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2017, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

public final class ChainedLogger: LoggerContract
{
// MARK: - Construction

    public init(loggers: LoggerContract...) {
        // Init instance variables
        self.loggers = loggers ?? []
    }

// MARK: - Methods

    public func v(tag: String, _ message: String) {
        self.loggers.each { $0.v(tag, message) }
    }

    public func d(tag: String, _ message: String) {
        self.loggers.each { $0.d(tag, message) }
    }

    public func i(tag: String, _ message: String) {
        self.loggers.each { $0.i(tag, message) }
    }

// --

    public func w(tag: String, _ message: String) {
        self.loggers.each { $0.w(tag, message) }
    }

    public func w(tag: String, _ message: String, _ error: ErrorType?) {
        self.loggers.each { $0.w(tag, message, error) }
    }

    public func w(tag: String, _ message: String, _ error: NSError?) {
        self.loggers.each { $0.w(tag, message, error) }
    }

    public func w(tag: String, _ message: String, _ exception: NSException?) {
        self.loggers.each { $0.w(tag, message, exception) }
    }

    public func w(tag: String, _ error: ErrorType) {
        self.loggers.each { $0.w(tag, error) }
    }

    public func w(tag: String, _ error: NSError) {
        self.loggers.each { $0.w(tag, error) }
    }

    public func w(tag: String, _ exception: NSException) {
        self.loggers.each { $0.w(tag, exception) }
    }

// --

    public func e(tag: String, _ message: String) {
        self.loggers.each { $0.e(tag, message) }
    }

    public func e(tag: String, _ message: String, _ error: ErrorType?) {
        self.loggers.each { $0.e(tag, message, error) }
    }

    public func e(tag: String, _ message: String, _ error: NSError?) {
        self.loggers.each { $0.e(tag, message, error) }
    }

    public func e(tag: String, _ message: String, _ exception: NSException?) {
        self.loggers.each { $0.e(tag, message, exception) }
    }

    public func e(tag: String, _ error: ErrorType) {
        self.loggers.each { $0.e(tag, error) }
    }

    public func e(tag: String, _ error: NSError) {
        self.loggers.each { $0.e(tag, error) }
    }

    public func e(tag: String, _ exception: NSException) {
        self.loggers.each { $0.e(tag, exception) }
    }

// MARK: - Variables

    private let loggers: [LoggerContract]
}

// ----------------------------------------------------------------------------
