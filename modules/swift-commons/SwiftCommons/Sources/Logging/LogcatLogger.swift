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
// MARK: - Construction

    public init() {
        // Do nothing
    }

// MARK: - Methods

    public func v(_ tag: String, _ message: String) {
        let level = Logger.LogLevel.Verbose
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

    public func d(_ tag: String, _ message: String) {
        let level = Logger.LogLevel.Debug
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

    public func i(_ tag: String, _ message: String) {
        let level = Logger.LogLevel.Info
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

// --

    public func w(_ tag: String, _ message: String) {
        let level = Logger.LogLevel.Warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

    public func w(_ tag: String, _ message: String, _ error: Error?) {
        let level = Logger.LogLevel.Warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, error))
        }
    }

    public func w(_ tag: String, _ message: String, _ error: NSError?) {
        let level = Logger.LogLevel.Warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, error))
        }
    }

    public func w(_ tag: String, _ message: String, _ exception: NSException?) {
        let level = Logger.LogLevel.Warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, exception))
        }
    }

    public func w(_ tag: String, _ error: Error) {
        let level = Logger.LogLevel.Warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, error))
        }
    }

    public func w(_ tag: String, _ error: NSError) {
        let level = Logger.LogLevel.Warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, error))
        }
    }

    public func w(_ tag: String, _ exception: NSException) {
        let level = Logger.LogLevel.Warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, exception))
        }
    }

// --

    public func e(_ tag: String, _ message: String) {
        let level = Logger.LogLevel.Error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

    public func e(_ tag: String, _ message: String, _ error: Error?) {
        let level = Logger.LogLevel.Error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, error))
        }
    }

    public func e(_ tag: String, _ message: String, _ error: NSError?) {
        let level = Logger.LogLevel.Error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, error))
        }
    }

    public func e(_ tag: String, _ message: String, _ exception: NSException?) {
        let level = Logger.LogLevel.Error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, exception))
        }
    }

    public func e(_ tag: String, _ error: Error) {
        let level = Logger.LogLevel.Error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, error))
        }
    }

    public func e(_ tag: String, _ error: NSError) {
        let level = Logger.LogLevel.Error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, error))
        }
    }

    public func e(_ tag: String, _ exception: NSException) {
        let level = Logger.LogLevel.Error
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, exception))
        }
    }
}

// ----------------------------------------------------------------------------
