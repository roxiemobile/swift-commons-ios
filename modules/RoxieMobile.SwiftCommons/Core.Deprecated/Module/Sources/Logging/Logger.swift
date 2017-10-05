// ----------------------------------------------------------------------------
//
//  Logger.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2017, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommons

// ----------------------------------------------------------------------------

// Android: Log
// @link http://developer.android.com/reference/android/util/Log.html

// Logging in Swift without overhead in production
// @link http://transition.io/logging-in-swift-without-overhead-in-production/

// ----------------------------------------------------------------------------

@available(*, deprecated)
public protocol LoggerContract
{
// MARK: - Methods

    func v(_ tag: String, _ message: String)
    func d(_ tag: String, _ message: String)
    func i(_ tag: String, _ message: String)

    func w(_ tag: String, _ message: String)
    func w(_ tag: String, _ message: String, _ error: Error?)
    func w(_ tag: String, _ message: String, _ error: NSError?)
    func w(_ tag: String, _ message: String, _ exception: NSException?)

    func w(_ tag: String, _ error: Error)
    func w(_ tag: String, _ error: NSError)
    func w(_ tag: String, _ exception: NSException)

    func e(_ tag: String, _ message: String)
    func e(_ tag: String, _ message: String, _ error: Error?)
    func e(_ tag: String, _ message: String, _ error: NSError?)
    func e(_ tag: String, _ message: String, _ exception: NSException?)

    func e(_ tag: String, _ error: Error)
    func e(_ tag: String, _ error: NSError)
    func e(_ tag: String, _ exception: NSException)
}

// ----------------------------------------------------------------------------

@available(*, deprecated)
public final class Logger
{
// MARK: - Construction

    @available(*, deprecated)
    public static let shared = Logger()

    @available(*, deprecated)
    private init() {
        // Do nothing
    }

// MARK: - Properties

    @available(*, deprecated)
    @discardableResult public func logger(logger: LoggerContract?) -> Logger
    {
        synchronized(self.syncLock) {
            self.innerLogger = logger
        }
        return self;
    }

    @available(*, deprecated)
    private func logger() -> LoggerContract?
    {
        var logger: LoggerContract? = nil

        synchronized(self.syncLock) {
            logger = self.innerLogger
        }
        return logger
    }

    @available(*, deprecated)
    @discardableResult public func logLevel(level: LogLevel) -> Logger
    {
        synchronized(self.syncLock) {
            self.innerLogLevel = level
        }
        return self;
    }

    @available(*, deprecated)
    public func logLevel() -> LogLevel
    {
        var level: LogLevel = .verbose

        synchronized(self.syncLock) {
            level = self.innerLogLevel
        }
        return level
    }

// MARK: - Methods

    @available(*, deprecated)
    public static func v(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.verbose) {
            logger.v(tag, message())
        }
    }

    @available(*, deprecated)
    public static func d(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.debug) {
            logger.d(tag, message())
        }
    }

    @available(*, deprecated)
    public static func i(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.information) {
            logger.i(tag, message())
        }
    }

// --

    @available(*, deprecated)
    public static func w(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, message())
        }
    }

    @available(*, deprecated)
    public static func w(_ tag: String, _ message: @autoclosure () -> String, _ error: Error?) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, message(), error)
        }
    }

    @available(*, deprecated)
    public static func w(_ tag: String, _ message: @autoclosure () -> String, _ error: NSError?) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, message(), error)
        }
    }

    @available(*, deprecated)
    public static func w(_ tag: String, _ message: @autoclosure () -> String, _ exception: NSException?) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, message(), exception)
        }
    }

    @available(*, deprecated)
    public static func w(_ tag: String, _ error: Error) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, error)
        }
    }

    @available(*, deprecated)
    public static func w(_ tag: String, _ error: NSError) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, error)
        }
    }

    @available(*, deprecated)
    public static func w(_ tag: String, _ exception: NSException) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, exception)
        }
    }

// --

    @available(*, deprecated)
    public static func e(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, message())
        }
    }

    @available(*, deprecated)
    public static func e(_ tag: String, _ message: @autoclosure () -> String, _ error: Error?) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, message(), error)
        }
    }

    @available(*, deprecated)
    public static func e(_ tag: String, _ message: @autoclosure () -> String, _ error: NSError?) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, message(), error)
        }
    }

    @available(*, deprecated)
    public static func e(_ tag: String, _ message: @autoclosure () -> String, _ exception: NSException?) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, message(), exception)
        }
    }

    @available(*, deprecated)
    public static func e(_ tag: String, _ error: Error) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, error)
        }
    }

    @available(*, deprecated)
    public static func e(_ tag: String, _ error: NSError) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, error)
        }
    }

    @available(*, deprecated)
    public static func e(_ tag: String, _ exception: NSException) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, exception)
        }
    }

// MARK: - Methods

    /// Checks to see whether or not a log is loggable at the specified level.
    @available(*, deprecated)
    public static func isLoggable(_ level: LogLevel) -> Bool {
        return level.rawValue >= Logger.shared.logLevel().rawValue
    }

// MARK: - Inner Types

    @available(*, deprecated)
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

    @available(*, deprecated)
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

    @available(*, deprecated)
    public static func description(_ level: LogLevel, _ tag: String, _ message: @autoclosure () -> String?, _ error: Error?) -> String {
        var logMessage = description(level, tag, message)

        // Add error description
        if let err = error {
            logMessage += "\nCaused by error: " + String(describing: err).trim()
        }

        // Done
        return logMessage
    }

    @available(*, deprecated)
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

    @available(*, deprecated)
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
