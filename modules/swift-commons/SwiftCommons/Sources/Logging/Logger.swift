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

    public func logger(logger: LoggerContract?) -> Logger {

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

    public func logLevel(level: LogLevel) -> Logger {
        synchronized(object: self.innerLock) {
            self.innerLogLevel = level
        }
        return self;
    }

    public func logLevel() -> LogLevel {
        var level: LogLevel = .Verbose

        synchronized(object: self.innerLock) {
            level = self.innerLogLevel
        }
        return level
    }

// MARK: - Methods

    public static func v(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.Verbose) {
            logger.v(tag, message())
        }
    }

    public static func d(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.Debug) {
            logger.d(tag, message())
        }
    }

    public static func i(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.Info) {
            logger.i(tag, message())
        }
    }

// --

    public static func w(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.Warning) {
            logger.w(tag, message())
        }
    }

    public static func w(_ tag: String, _ message: @autoclosure () -> String, _ error: Error?) {
        if let logger = Logger.shared.logger(), isLoggable(.Warning) {
            logger.w(tag, message(), error)
        }
    }

    public static func w(_ tag: String, _ message: @autoclosure () -> String, _ error: NSError?) {
        if let logger = Logger.shared.logger(), isLoggable(.Warning) {
            logger.w(tag, message(), error)
        }
    }

    public static func w(_ tag: String, _ message: @autoclosure () -> String, _ exception: NSException?) {
        if let logger = Logger.shared.logger(), isLoggable(.Warning) {
            logger.w(tag, message(), exception)
        }
    }

    public static func w(_ tag: String, _ error: Error) {
        if let logger = Logger.shared.logger(), isLoggable(.Warning) {
            logger.w(tag, error)
        }
    }

    public static func w(_ tag: String, _ error: NSError) {
        if let logger = Logger.shared.logger(), isLoggable(.Warning) {
            logger.w(tag, error)
        }
    }

    public static func w(_ tag: String, _ exception: NSException) {
        if let logger = Logger.shared.logger(), isLoggable(.Warning) {
            logger.w(tag, exception)
        }
    }

// --

    public static func e(_ tag: String, _ message: @autoclosure () -> String) {
        if let logger = Logger.shared.logger(), isLoggable(.Error) {
            logger.e(tag, message())
        }
    }

    public static func e(_ tag: String, _ message: @autoclosure () -> String, _ error: Error?) {
        if let logger = Logger.shared.logger(), isLoggable(.Error) {
            logger.e(tag, message(), error)
        }
    }

    public static func e(_ tag: String, _ message: @autoclosure () -> String, _ error: NSError?) {
        if let logger = Logger.shared.logger(), isLoggable(.Error) {
            logger.e(tag, message(), error)
        }
    }

    public static func e(_ tag: String, _ message: @autoclosure () -> String, _ exception: NSException?) {
        if let logger = Logger.shared.logger(), isLoggable(.Error) {
            logger.e(tag, message(), exception)
        }
    }

    public static func e(_ tag: String, _ error: Error) {
        if let logger = Logger.shared.logger(), isLoggable(.Error) {
            logger.e(tag, error)
        }
    }

    public static func e(_ tag: String, _ error: NSError) {
        if let logger = Logger.shared.logger(), isLoggable(.Error) {
            logger.e(tag, error)
        }
    }

    public static func e(_ tag: String, _ exception: NSException) {
        if let logger = Logger.shared.logger(), isLoggable(.Error) {
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

    public static func description(_ level: LogLevel, _ tag: String, _ message: @autoclosure () -> String?) -> String {
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
            logMessage += "\nCaused by error: "

            if let msg = (err as? CustomStringConvertible)?.description.trim(), msg.isNotEmpty {
                logMessage += msg
            }
            else if let msg = (err as? CustomDebugStringConvertible)?.debugDescription.trim(), msg.isNotEmpty {
                logMessage += msg
            }
            else {
                logMessage += typeName(err)
            }
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
