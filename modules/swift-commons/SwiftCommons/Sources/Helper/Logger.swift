// ----------------------------------------------------------------------------
//
//  Logger.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

// Android: Log
// @link http://developer.android.com/reference/android/util/Log.html

// Logging in Swift without overhead in production
// @link http://transition.io/logging-in-swift-without-overhead-in-production/

// ----------------------------------------------------------------------------

public final class Logger: NonCreatable
{
// MARK: - Properties

    public static var logLevel: Level {
        set {
            self.level = newValue
        }
        get {
            return self.level
        }
    }

// MARK: - Methods

    /// Checks to see whether or not a log is loggable at the specified level.
    public static func isLoggable(level: Level) -> Bool {
        return (level.rawValue >= self.level.rawValue)
    }

    /// Low-level logging call.
    public class func println(level: Level, msg: String)
    {
        if isLoggable(level) {
            NSLog("%@",msg)
        }
    }

// MARK: - Methods: VERBOSE

    /// Send a VERBOSE log message.
    public class func v(@autoclosure msg: (Void -> String?)) {
        log(.VERBOSE, msg: msg, err: nil)
    }

    /// Send a VERBOSE log message and log the error.
    public class func v(@autoclosure msg: (Void -> String?), @autoclosure err: (Void -> NSError?)) {
        log(.VERBOSE, msg: msg, err: err)
    }

    /// Send a VERBOSE log the error.
    public class func v(@autoclosure err: (Void -> NSError?)) {
        log(.VERBOSE, msg: nil, err: err)
    }

    /// Send a VERBOSE log message and log the exception.
    public class func v(@autoclosure msg: (Void -> String?), @autoclosure exc: (Void -> NSException?)) {
        log(.VERBOSE, msg: msg, exc: exc)
    }

    /// Send a VERBOSE log the exception.
    public class func v(@autoclosure exc: (Void -> NSException?)) {
        log(.VERBOSE, msg: nil, exc: exc)
    }

// MARK: - Methods: DEBUG

    /// Send a DEBUG log message.
    public class func d(@autoclosure msg: (Void -> String?)) {
        log(.DEBUG, msg: msg, err: nil)
    }

    /// Send a DEBUG log message and log the error.
    public class func d(@autoclosure msg: (Void -> String?), @autoclosure err: (Void -> NSError?)) {
        log(.DEBUG, msg: msg, err: err)
    }

    /// Send a DEBUG log the error.
    public class func d(@autoclosure err: (Void -> NSError?)) {
        log(.DEBUG, msg: nil, err: err)
    }

    /// Send a DEBUG log message and log the exception.
    public class func d(@autoclosure msg: (Void -> String?), @autoclosure exc: (Void -> NSException?)) {
        log(.DEBUG, msg: msg, exc: exc)
    }

    /// Send a DEBUG log the exception.
    public class func d(@autoclosure exc: (Void -> NSException?)) {
        log(.DEBUG, msg: nil, exc: exc)
    }

// MARK: - Methods: INFO

    /// Send an INFO log message.
    public class func i(@autoclosure msg: (Void -> String?)) {
        log(.INFO, msg: msg, err: nil)
    }

    /// Send a INFO log message and log the error.
    public class func i(@autoclosure msg: (Void -> String?), @autoclosure err: (Void -> NSError?)) {
        log(.INFO, msg: msg, err: err)
    }

    /// Send a INFO log the error.
    public class func i(@autoclosure err: (Void -> NSError?)) {
        log(.INFO, msg: nil, err: err)
    }

    /// Send a INFO log message and log the exception.
    public class func i(@autoclosure msg: (Void -> String?), @autoclosure exc: (Void -> NSException?)) {
        log(.INFO, msg: msg, exc: exc)
    }

    /// Send a INFO log the exception.
    public class func i(@autoclosure exc: (Void -> NSException?)) {
        log(.INFO, msg: nil, exc: exc)
    }

// MARK: - Methods: WARNING

    /// Send a WARNINIG log message.
    public class func w(@autoclosure msg: (Void -> String?)) {
        log(.WARNING, msg: msg, err: nil)
    }

    /// Send a WARNINIG log message and log the error.
    public class func w(@autoclosure msg: (Void -> String?), @autoclosure err: (Void -> NSError?)) {
        log(.WARNING, msg: msg, err: err)
    }

    /// Send a WARNINIG log the error.
    public class func w(@autoclosure err: (Void -> NSError?)) {
        log(.WARNING, msg: nil, err: err)
    }

    /// Send a WARNINIG log message and log the exception.
    public class func w(@autoclosure msg: (Void -> String?), @autoclosure exc: (Void -> NSException?)) {
        log(.WARNING, msg: msg, exc: exc)
    }

    /// Send a WARNINIG log the exception.
    public class func w(@autoclosure exc: (Void -> NSException?)) {
        log(.WARNING, msg: nil, exc: exc)
    }

// MARK: - Methods: ERROR

    /// Send an ERROR log message.
    public class func e(@autoclosure msg: (Void -> String?)) {
        log(.ERROR, msg: msg, err: nil)
    }

    /// Send a ERROR log message and log the error.
    public class func e(@autoclosure msg: (Void -> String?), @autoclosure err: (Void -> NSError?)) {
        log(.ERROR, msg: msg, err: err)
    }

    /// Send a ERROR log the error.
    public class func e(@autoclosure err: (Void -> NSError?)) {
        log(.ERROR, msg: nil, err: err)
    }

    /// Send a ERROR log message and log the exception.
    public class func e(@autoclosure msg: (Void -> String?), @autoclosure exc: (Void -> NSException?)) {
        log(.ERROR, msg: msg, exc: exc)
    }

    /// Send a ERROR log the exception.
    public class func e(@autoclosure exc: (Void -> NSException?)) {
        log(.ERROR, msg: nil, exc: exc)
    }

// MARK: - Methods: ASSERT

    /// What a Terrible Failure: Report a condition that should never happen.
    public class func wtf(@autoclosure msg: (Void -> String?)) {
        log(.ASSERT, msg: msg, err: nil)
    }

    /// What a Terrible Failure: Report a condition and an error that should never happen.
    public class func wtf(@autoclosure msg: (Void -> String?), @autoclosure err: (Void -> NSError?)) {
        log(.ASSERT, msg: msg, err: err)
    }

    /// What a Terrible Failure: Report an error that should never happen.
    public class func wtf(@autoclosure err: (Void -> NSError?)) {
        log(.ASSERT, msg: nil, err: err)
    }

    /// What a Terrible Failure: Report a condition and an exception that should never happen.
    public class func wtf(@autoclosure msg: (Void -> String?), @autoclosure exc: (Void -> NSException?)) {
        log(.ASSERT, msg: msg, exc: exc)
    }

    /// What a Terrible Failure: Report an exception that should never happen.
    public class func wtf(@autoclosure exc: (Void -> NSException?)) {
        log(.ASSERT, msg: nil, exc: exc)
    }

// MARK: - Private Methods

    private class func log(level: Level, @autoclosure msg: (Void -> String?), @autoclosure err: (Void -> NSError?)) {
        if isLoggable(level) {
            println(level, msg: msg(), err: err())
        }
    }

    private class func println(level: Level, msg: String?, err: NSError?)
    {
        if (msg == nil) && (err == nil) { return }

        var logMessage = ""

        // Add raw message
        if let message = msg?.trimmed() where !message.isEmpty {
            logMessage += message
        }

        // Add error description
        if let error = err
        {
            if !logMessage.isEmpty {
                logMessage += "\nCaused by error: "
            }

            logMessage += "\(error.domain)(code: \(error.code))"

            if let message = err?.localizedDescription.trimmed() where !message.isEmpty {
                logMessage += " with reason: \(message)"
            }
        }

        // Log message
        println(level, msg: logMessage)
    }

    private class func log(level: Level, @autoclosure msg: (Void -> String?), @autoclosure exc: (Void -> NSException?)) {
        if isLoggable(level) {
            println(level, msg: msg(), exc: exc())
        }
    }

    private class func println(level: Level, msg: String?, exc: NSException?)
    {
        if (msg == nil) && (exc == nil) { return }

        var logMessage = ""

        // Add raw message
        if let message = msg?.trimmed() where !message.isEmpty {
            logMessage += message
        }

        // Add exception description
        if let exception = exc
        {
            if !logMessage.isEmpty {
                logMessage += "\nCaused by exception: "
            }

            logMessage += "\(exception.name)"

            if let message = exception.reason?.trimmed() where !message.isEmpty {
                logMessage += " with reason: \(message)"
            }

            if let stackTrace = exc?.callStackSymbols where !stackTrace.isEmpty {
                logMessage += "\nStack trace:"

                for line in stackTrace {
                    logMessage += "\n\(line)"
                }
            }
        }

        // Log message
        println(level, msg: logMessage)
    }

// MARK: - Inner Types

    public enum Level: Int
    {
        // Log level constants for the println() function.
        case VERBOSE = 0
        case DEBUG
        case INFO
        case WARNING
        case ERROR
        case ASSERT

        // Will turn off all logging.
        case SUPPRESS
    }

// MARK: - Variables

    private static var level = Level.DEBUG

}

// ----------------------------------------------------------------------------
