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
import SwiftCommonsConcurrent

// ----------------------------------------------------------------------------

// Logging in Swift without overhead in production
// @link http://transition.io/logging-in-swift-without-overhead-in-production/

// ----------------------------------------------------------------------------

/// A `Logger` object is used to perform logging.
public final class Logger {
// MARK: - Construction

    /// Shared `Logger` instance.
    public static let shared = Logger()

    /// Initializes and returns a newly created logger object.
    private init() {
        // Do nothing
    }

// MARK: - Properties

    /// Sets the logger used by the application. Early during the initialization process
    /// of an application, a logger should be set.
    ///
    /// - Parameters:
    ///   - logger: The new logger.
    ///
    /// - Returns:
    ///   A reference to this object for method chaining.
    ///
    @discardableResult
    public func logger(logger: LoggerContract?) -> Logger {
        synchronized(self.syncLock) {
            self.innerLogger = logger
        }
        return self
    }

    /// Returns the logger used by the application.
    internal func logger() -> LoggerContract? {
        var logger: LoggerContract?

        synchronized(self.syncLock) {
            logger = self.innerLogger
        }
        return logger
    }

    /// Set the log level specifying which message levels will be logged by the `Logger`.
    /// 
    /// - Parameters:
    ///   - level: The new value for the log level.
    ///
    /// - Returns:
    ///   A reference to this object for method chaining.
    ///
    @discardableResult
    public func logLevel(level: LogLevel) -> Logger {
        synchronized(self.syncLock) {
            self.innerLogLevel = level
        }
        return self
    }

    /// Get the log Level that has been specified for the `Logger`.
    ///
    /// - Returns:
    ///   The log level of the `Logger`.
    ///
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

    /// The LogLevel enum defines a set of standard logging levels that can be used
    /// to control logging output.
    public enum LogLevel: Int {
        /// Logs that contain the most detailed messages. These messages may contain
        /// sensitive application data. Use Logger.v()
        case verbose = 0

        /// Logs that are used for interactive investigation during development.
        /// Use Logger.d()
        case debug

        /// Logs that track the general flow of the application. Use Logger.i()
        case information

        /// Logs that highlight an abnormal or unexpected event in the application
        /// flow, but do not otherwise cause the application execution to stop.
        /// Use Logger.w()
        case warning

        /// Logs that highlight when the current flow of execution is stopped due
        /// to a failure. Use Logger.e()
        case error

        // Turn off all logging. Specifies that a logger should not sends any messages.
        case suppress
    }

// MARK: - Variables

    private var innerLogger: LoggerContract?

    private var innerLogLevel = LogLevel.information

    private let syncLock = NSObject()
}

// ----------------------------------------------------------------------------

extension Logger {
// MARK: - Methods

    /// Formats log message.
    ///
    /// - Parameters:
    ///   - level: The log level value.
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///
    /// - Returns:
    ///   Formatted log message.
    ///
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

    /// Formats log message.
    ///
    /// - Parameters:
    ///   - level: The log level.
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - error: An error to log.
    ///
    /// - Returns:
    ///   Formatted log message.
    ///
    public static func description(_ level: LogLevel, _ tag: String, _ message: @autoclosure () -> String?, _ error: Error?) -> String {
        var logMessage = description(level, tag, message)

        // Add error description
        if let err = error {
            logMessage += "\nCaused by error: " + String(describing: err).trim()
        }

        // Done
        return logMessage
    }

    /// Formats log message.
    ///
    /// - Parameters:
    ///   - level: The log level.
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - error: An error to log.
    ///
    /// - Returns:
    ///   Formatted log message.
    ///
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

    /// Formats log message.
    ///
    /// - Parameters:
    ///   - level: The log level.
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - exception: An exception to log.
    ///
    /// - Returns:
    ///   Formatted log message.
    ///
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
