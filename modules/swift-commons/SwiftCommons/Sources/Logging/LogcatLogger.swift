// ----------------------------------------------------------------------------
//
//  LogcatLogger.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public final class LogcatLogger: LoggerContract
{
// MARK: - Methods

    public func v(tag: String, _ message: String) {
        let level = Logger.LogLevel.Verbose
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

    public func d(tag: String, _ message: String) {
        let level = Logger.LogLevel.Debug
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

    public func i(tag: String, _ message: String) {
        let level = Logger.LogLevel.Info
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

// --

    public func w(tag: String, _ message: String) {
        let level = Logger.LogLevel.Warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

    public func w(tag: String, _ message: String, _ error: ErrorType?) {
        let level = Logger.LogLevel.Warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, error))
        }
    }

    public func w(tag: String, _ message: String, _ error: NSError?) {
        let level = Logger.LogLevel.Warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, error))
        }
    }

    public func w(tag: String, _ message: String, _ exception: NSException?) {
        let level = Logger.LogLevel.Warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, exception))
        }
    }

    public func w(tag: String, _ error: ErrorType) {
        let level = Logger.LogLevel.Warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, error))
        }
    }

    public func w(tag: String, _ error: NSError) {
        let level = Logger.LogLevel.Warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, error))
        }
    }

    public func w(tag: String, _ exception: NSException) {
        let level = Logger.LogLevel.Warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, exception))
        }
    }

// --

    public func e(tag: String, _ message: String) {
        let level = Logger.LogLevel.Error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

    public func e(tag: String, _ message: String, _ error: ErrorType?) {
        let level = Logger.LogLevel.Error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, error))
        }
    }

    public func e(tag: String, _ message: String, _ error: NSError?) {
        let level = Logger.LogLevel.Error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, error))
        }
    }

    public func e(tag: String, _ message: String, _ exception: NSException?) {
        let level = Logger.LogLevel.Error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, exception))
        }
    }

    public func e(tag: String, _ error: ErrorType) {
        let level = Logger.LogLevel.Error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, error))
        }
    }

    public func e(tag: String, _ error: NSError) {
        let level = Logger.LogLevel.Error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, error))
        }
    }

    public func e(tag: String, _ exception: NSException) {
        let level = Logger.LogLevel.Error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, exception))
        }
    }
}

// ----------------------------------------------------------------------------
