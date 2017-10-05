// ----------------------------------------------------------------------------
//
//  Logger.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommons

// ----------------------------------------------------------------------------

// Logging in Swift without overhead in production
// @link http://transition.io/logging-in-swift-without-overhead-in-production/

// ----------------------------------------------------------------------------

@available(*, deprecated, message: "\n• Write a description.")
public final class Logger
{
// MARK: - Construction

    @available(*, deprecated, message: "\n• Write a description.")
    public static let shared = Logger()

    private init() {
        // Do nothing
    }

// MARK: - Properties

    @available(*, deprecated, message: "\n• Write a description.")
    @discardableResult
    public func logger(logger: LoggerContract?) -> Logger {
        synchronized(self.syncLock) {
            self.innerLogger = logger
        }
        return self;
    }

    internal func logger() -> LoggerContract? {
        var logger: LoggerContract? = nil

        synchronized(self.syncLock) {
            logger = self.innerLogger
        }
        return logger
    }

    @available(*, deprecated, message: "\n• Write a description.")
    @discardableResult
    public func logLevel(level: LogLevel) -> Logger {
        synchronized(self.syncLock) {
            self.innerLogLevel = level
        }
        return self;
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func logLevel() -> LogLevel {
        var level: LogLevel = .verbose

        synchronized(self.syncLock) {
            level = self.innerLogLevel
        }
        return level
    }

// MARK: - Methods

    /// Checks to see whether or not a log is loggable at the specified level.
    public static func isLoggable(_ level: LogLevel) -> Bool {
        return level.rawValue >= Logger.shared.logLevel().rawValue
    }

// MARK: - Inner Types

    public enum LogLevel: Int
    {
        // Use Logger.v()
        case verbose = 0

        // Use Logger.d()
        case debug

        // Use Logger.i()
        case information

        // Use Logger.w()
        case warning

        // Use Logger.e()
        case error

        // Turn off all logging
        case suppress
    }

// MARK: - Variables

    private var innerLogger: LoggerContract?

    private var innerLogLevel = LogLevel.information

    private let syncLock = NSObject()
}

// ----------------------------------------------------------------------------

extension Logger
{
// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    public static func description(_ level: LogLevel, _ tag: String, _ message: @autoclosure () -> String?) -> String {
        var logMessage = ""

        // Add log level
        switch level {
            case .verbose:     logMessage += "[VRB]"
            case .debug:       logMessage += "[DBG]"
            case .information: logMessage += "[INF]"
            case .warning:     logMessage += "[WRN]"
            case .error:       logMessage += "[ERR]"
            case .suppress:    logMessage += "[SPR]"
        }

        // Add tag
        if tag.trim().isNotEmpty {
            logMessage += " \(tag):"
        }

        // Add message
        if let msg = message()?.trim(), msg.isNotEmpty {
            logMessage += " \(msg)"
        }

        // Done
        return logMessage
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func description(_ level: LogLevel, _ tag: String, _ message: @autoclosure () -> String?, _ error: Error?) -> String {
        var logMessage = description(level, tag, message)

        // Add error description
        if let err = error {
            logMessage += "\nCaused by error: " + String(describing: err).trim()
        }

        // Done
        return logMessage
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func description(_ level: LogLevel, _ tag: String, _ message: @autoclosure () -> String?, _ error: NSError?) -> String {
        var logMessage = description(level, tag, message)

        // Add error description
        if let err = error {
            logMessage += "\nCaused by error: \(err.domain)(code: \(err.code))"

            if let msg = error?.localizedDescription.trim(), msg.isNotEmpty {
                logMessage += " with reason: \(msg)"
            }
        }

        // Done
        return logMessage
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func description(_ level: LogLevel, _ tag: String, _ message: @autoclosure () -> String?, _ exception: NSException?) -> String {
        var logMessage = description(level, tag, message)

        // Add exception description
        if let exc = exception {
            logMessage += "\nCaused by exception: \(exc.name)"

            if let msg = exc.reason?.trim(), msg.isNotEmpty {
                logMessage += " with reason: \(msg)"
            }

            if let stackTrace = exception?.callStackSymbols, stackTrace.isNotEmpty {
                logMessage += "\nStack trace:"

                for line in stackTrace {
                    logMessage += "\n\(line)"
                }
            }
        }

        // Done
        return logMessage
    }
}

// ----------------------------------------------------------------------------
