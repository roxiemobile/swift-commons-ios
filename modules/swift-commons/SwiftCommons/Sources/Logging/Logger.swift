// ----------------------------------------------------------------------------
//
//  Logger.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2017, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

// Android: Log
// @link http://developer.android.com/reference/android/util/Log.html

// Logging in Swift without overhead in production
// @link http://transition.io/logging-in-swift-without-overhead-in-production/

// ----------------------------------------------------------------------------

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

public final class Logger
{
// MARK: - Construction

    public static let shared = Logger()

    private init() {
        // Do nothing
    }

// MARK: - Properties

    @discardableResult public func logger(logger: LoggerContract?) -> Logger {

        synchronized(object: self.innerLock) {
            self.innerLogger = logger
        }
        return self;
    }

    private func logger() -> LoggerContract? {
        var logger: LoggerContract? = nil

        synchronized(object: self.innerLock) {
            logger = self.innerLogger
        }
        return logger
    }

    @discardableResult public func logLevel(level: LogLevel) -> Logger {
        synchronized(object: self.innerLock) {
            self.innerLogLevel = level
        }
        return self;
    }

    public func logLevel() -> LogLevel {
        var level: LogLevel = .verbose

        synchronized(object: self.innerLock) {
            level = self.innerLogLevel
        }
        return level
    }

// MARK: - Methods

    public static func v(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.verbose) {
            logger.v(tag, message())
        }
    }

    public static func d(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.debug) {
            logger.d(tag, message())
        }
    }

    public static func i(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.info) {
            logger.i(tag, message())
        }
    }

// --

    public static func w(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, message())
        }
    }

    public static func w(_ tag: String, _ message: @autoclosure () -> String, _ error: Error?) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, message(), error)
        }
    }

    public static func w(_ tag: String, _ message: @autoclosure () -> String, _ error: NSError?) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, message(), error)
        }
    }

    public static func w(_ tag: String, _ message: @autoclosure () -> String, _ exception: NSException?) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, message(), exception)
        }
    }

    public static func w(_ tag: String, _ error: Error) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, error)
        }
    }

    public static func w(_ tag: String, _ error: NSError) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, error)
        }
    }

    public static func w(_ tag: String, _ exception: NSException) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, exception)
        }
    }

// --

    public static func e(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, message())
        }
    }

    public static func e(_ tag: String, _ message: @autoclosure () -> String, _ error: Error?) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, message(), error)
        }
    }

    public static func e(_ tag: String, _ message: @autoclosure () -> String, _ error: NSError?) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, message(), error)
        }
    }

    public static func e(_ tag: String, _ message: @autoclosure () -> String, _ exception: NSException?) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, message(), exception)
        }
    }

    public static func e(_ tag: String, _ error: Error) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, error)
        }
    }

    public static func e(_ tag: String, _ error: NSError) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, error)
        }
    }

    public static func e(_ tag: String, _ exception: NSException) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, exception)
        }
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
        case info
        // Use Logger.w()
        case warning
        // Use Logger.e()
        case error
        // Turn off all logging
        case suppress
    }

// MARK: - Variables

    private var innerLogger: LoggerContract?

    private var innerLogLevel = LogLevel.info

    private let innerLock = NSObject()
}

// ----------------------------------------------------------------------------

extension Logger
{
// MARK: - Methods

    public static func description(_ level: LogLevel, _ tag: String, _ message: @autoclosure () -> String?) -> String {
        var logMessage = ""

        // Add log level
        switch level {
            case .verbose:  logMessage += "[VRB]"
            case .debug:    logMessage += "[DBG]"
            case .info:     logMessage += "[INF]"
            case .warning:  logMessage += "[WRN]"
            case .error:    logMessage += "[ERR]"
            case .suppress: logMessage += "[SPR]"
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

    public static func description(_ level: LogLevel, _ tag: String, _ message: @autoclosure () -> String?, _ error: Error?) -> String {
        var logMessage = description(level, tag, message)

        // Add error description
        if let err = error {
            logMessage += "\nCaused by error: " + String(describing: err).trim()
        }

        // Done
        return logMessage
    }

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
