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

    func v(tag: String, _ message: String)
    func d(tag: String, _ message: String)
    func i(tag: String, _ message: String)

    func w(tag: String, _ message: String)
    func w(tag: String, _ message: String, _ error: ErrorType?)
    func w(tag: String, _ message: String, _ error: NSError?)
    func w(tag: String, _ message: String, _ exception: NSException?)

    func w(tag: String, _ error: ErrorType)
    func w(tag: String, _ error: NSError)
    func w(tag: String, _ exception: NSException)

    func e(tag: String, _ message: String)
    func e(tag: String, _ message: String, _ error: ErrorType?)
    func e(tag: String, _ message: String, _ error: NSError?)
    func e(tag: String, _ message: String, _ exception: NSException?)

    func e(tag: String, _ error: ErrorType)
    func e(tag: String, _ error: NSError)
    func e(tag: String, _ exception: NSException)
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

    public func logger(logger: LoggerContract?) -> Logger {
        synchronized(self.innerLock) {
            self.innerLogger = logger
        }
        return self;
    }

    private func logger() -> LoggerContract? {
        var logger: LoggerContract? = nil

        synchronized(self.innerLock) {
            logger = self.innerLogger
        }
        return logger
    }

    public func logLevel(level: LogLevel) -> Logger {
        synchronized(self.innerLock) {
            self.innerLogLevel = level
        }
        return self;
    }

    public func logLevel() -> LogLevel {
        var level: LogLevel = .Verbose

        synchronized(self.innerLock) {
            level = self.innerLogLevel
        }
        return level
    }

// MARK: - Methods

    public static func v(tag: String, @autoclosure _ message: () -> String) {
        if let logger = Logger.shared.logger() where isLoggable(.Verbose) {
            logger.v(tag, message())
        }
    }

    public static func d(tag: String, @autoclosure _ message: () -> String) {
        if let logger = Logger.shared.logger() where isLoggable(.Debug) {
            logger.d(tag, message())
        }
    }

    public static func i(tag: String, @autoclosure _ message: () -> String) {
        if let logger = Logger.shared.logger() where isLoggable(.Info) {
            logger.i(tag, message())
        }
    }

// --

    public static func w(tag: String, @autoclosure _ message: () -> String) {
        if let logger = Logger.shared.logger() where isLoggable(.Warning) {
            logger.w(tag, message())
        }
    }

    public static func w(tag: String, @autoclosure _ message: () -> String, _ error: ErrorType?) {
        if let logger = Logger.shared.logger() where isLoggable(.Warning) {
            logger.w(tag, message(), error)
        }
    }

    public static func w(tag: String, @autoclosure _ message: () -> String, _ error: NSError?) {
        if let logger = Logger.shared.logger() where isLoggable(.Warning) {
            logger.w(tag, message(), error)
        }
    }

    public static func w(tag: String, @autoclosure _ message: () -> String, _ exception: NSException?) {
        if let logger = Logger.shared.logger() where isLoggable(.Warning) {
            logger.w(tag, message(), exception)
        }
    }

    public static func w(tag: String, _ error: ErrorType) {
        if let logger = Logger.shared.logger() where isLoggable(.Warning) {
            logger.w(tag, error)
        }
    }

    public static func w(tag: String, _ error: NSError) {
        if let logger = Logger.shared.logger() where isLoggable(.Warning) {
            logger.w(tag, error)
        }
    }

    public static func w(tag: String, _ exception: NSException) {
        if let logger = Logger.shared.logger() where isLoggable(.Warning) {
            logger.w(tag, exception)
        }
    }

// --

    public static func e(tag: String, @autoclosure _ message: () -> String) {
        if let logger = Logger.shared.logger() where isLoggable(.Error) {
            logger.e(tag, message())
        }
    }

    public static func e(tag: String, @autoclosure _ message: () -> String, _ error: ErrorType?) {
        if let logger = Logger.shared.logger() where isLoggable(.Error) {
            logger.e(tag, message(), error)
        }
    }

    public static func e(tag: String, @autoclosure _ message: () -> String, _ error: NSError?) {
        if let logger = Logger.shared.logger() where isLoggable(.Error) {
            logger.e(tag, message(), error)
        }
    }

    public static func e(tag: String, @autoclosure _ message: () -> String, _ exception: NSException?) {
        if let logger = Logger.shared.logger() where isLoggable(.Error) {
            logger.e(tag, message(), exception)
        }
    }

    public static func e(tag: String, _ error: ErrorType) {
        if let logger = Logger.shared.logger() where isLoggable(.Error) {
            logger.e(tag, error)
        }
    }

    public static func e(tag: String, _ error: NSError) {
        if let logger = Logger.shared.logger() where isLoggable(.Error) {
            logger.e(tag, error)
        }
    }

    public static func e(tag: String, _ exception: NSException) {
        if let logger = Logger.shared.logger() where isLoggable(.Error) {
            logger.e(tag, exception)
        }
    }

// MARK: - Methods

    /// Checks to see whether or not a log is loggable at the specified level.
    public static func isLoggable(level: LogLevel) -> Bool {
        return level.rawValue >= Logger.shared.logLevel().rawValue
    }

// MARK: - Inner Types

    public enum LogLevel: Int
    {
        // Use Logger.v()
        case Verbose = 0
        // Use Logger.d()
        case Debug
        // Use Logger.i()
        case Info
        // Use Logger.w()
        case Warning
        // Use Logger.e()
        case Error
        // Turn off all logging
        case Suppress
    }

// MARK: - Variables

    private var innerLogger: LoggerContract?

    private var innerLogLevel = LogLevel.Info

    private let innerLock = NSObject()
}

// ----------------------------------------------------------------------------

extension Logger
{
// MARK: - Methods

    public static func description(level: LogLevel, _ tag: String, @autoclosure _ message: () -> String?) -> String {
        var logMessage = ""

        // Add log level
        switch level {
            case .Verbose:  logMessage += "[VRB]"
            case .Debug:    logMessage += "[DBG]"
            case .Info:     logMessage += "[INF]"
            case .Warning:  logMessage += "[WRN]"
            case .Error:    logMessage += "[ERR]"
            case .Suppress: logMessage += "[SPR]"
        }

        // Add tag
        if tag.trim().isNotEmpty {
            logMessage += " \(tag):"
        }

        // Add message
        if let msg = message()?.trim() where msg.isNotEmpty {
            logMessage += " \(msg)"
        }

        // Done
        return logMessage
    }

    public static func description(level: LogLevel, _ tag: String, @autoclosure _ message: () -> String?, _ error: ErrorType?) -> String {
        var logMessage = description(level, tag, message)

        // Add error description
        if let err = error {
            logMessage += "\nCaused by error: "

            if let msg = (err as? CustomStringConvertible)?.description.trim() where msg.isNotEmpty {
                logMessage += msg
            }
            else if let msg = (err as? CustomDebugStringConvertible)?.debugDescription.trim() where msg.isNotEmpty {
                logMessage += msg
            }
            else {
                logMessage += typeName(err)
            }
        }

        // Done
        return logMessage
    }

    public static func description(level: LogLevel, _ tag: String, @autoclosure _ message: () -> String?, _ error: NSError?) -> String {
        var logMessage = description(level, tag, message)

        // Add error description
        if let err = error {
            logMessage += "\nCaused by error: \(err.domain)(code: \(err.code))"

            if let msg = error?.localizedDescription.trim() where msg.isNotEmpty {
                logMessage += " with reason: \(msg)"
            }
        }

        // Done
        return logMessage
    }

    public static func description(level: LogLevel, _ tag: String, @autoclosure _ message: () -> String?, _ exception: NSException?) -> String {
        var logMessage = description(level, tag, message)

        // Add exception description
        if let exc = exception {
            logMessage += "\nCaused by exception: \(exc.name)"

            if let msg = exc.reason?.trim() where msg.isNotEmpty {
                logMessage += " with reason: \(msg)"
            }

            if let stackTrace = exception?.callStackSymbols where stackTrace.isNotEmpty {
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
