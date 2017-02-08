// ----------------------------------------------------------------------------
//
//  LogcatLogger.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
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

public final class LogcatLogger: NonCreatable
{
// MARK: - Methods

    /// Checks to see whether or not a log is loggable at the specified level.
    public func isLoggable(level: Logger.LogLevel) -> Bool {
        return (level.rawValue >= Logger.instance.logLevel.rawValue)
    }

    /// Low-level logging call.
    public func println(level: Logger.LogLevel, msg: String)
    {
        if isLoggable(level) {
            NSLog("%@",msg)
        }
    }

}

// ----------------------------------------------------------------------------

extension LogcatLogger: ContractProtocol
{
// MARK: - Methods: VERBOSE

    public func v(tag: String, msg: String) {
        log(.Verbose, tag: tag, msg: msg, err: nil)
    }

// MARK: - Methods: DEBUG

    public func d(tag: String, msg: String) {
        log(.Debug, tag: tag, msg: msg, err: nil)
    }

// MARK: - Methods: INFO

    public func i(tag: String, msg: String) {
        log(.Info, tag: tag, msg: msg, err: nil)
    }

// MARK: - Methods: WARNING

    public func w(tag: String, err: NSError?) {
        log(.Warning, tag: tag, msg: nil, err: err)
    }

    public func w(tag: String, exc: NSException?) {
        log(.Warning, tag: tag, msg: nil, exc: exc)
    }

    public func w(tag: String, err: ErrorType?) {
        log(.Warning, tag: tag, msg: nil, err: err)
    }

    public func w(tag: String, msg: String, err: NSError?) {
        log(.Warning, tag: tag, msg: msg, err: err)
    }

    public func w(tag: String, msg: String, exc: NSException?) {
        log(.Warning, tag: tag, msg: msg, exc: exc)
    }

    public func w(tag: String, msg: String, err: ErrorType?) {
        log(.Warning, tag: tag, msg: msg, err: err)
    }

// MARK: - Methods: ERROR

    public func e(tag: String, err: NSError?) {
        log(.Error, tag: tag, msg: nil, err: err)
    }

    public func e(tag: String, exc: NSException?) {
        log(.Error, tag: tag, msg: nil, exc: exc)
    }

    public func e(tag: String, err: ErrorType?) {
        log(.Error, tag: tag, msg: nil, err: err)
    }

    public func e(tag: String, msg: String, err: NSError?) {
        log(.Error, tag: tag, msg: msg, err: err)
    }

    public func e(tag: String, msg: String, exc: NSException?) {
        log(.Error, tag: tag, msg: msg, exc: exc)
    }

    public func e(tag: String, msg: String, err: ErrorType?) {
        log(.Error, tag: tag, msg: msg, err: err)
    }

// MARK: - Private Methods

    private func log(level: Logger.LogLevel, tag: String, msg: String?, err: NSError?) {
        if isLoggable(level) {
            println(level, tag: tag, msg: msg, err: err)
        }
    }

    private func println(level: Logger.LogLevel, tag: String, msg: String?, err: NSError?)
    {
        guard let msg = msg, let err = err else { return }

        var logMessage = ""

        // Add raw message
        let message = msg.trimmed()
        if !message.isEmpty {
            logMessage += message
        }

        // Add error description
        if !logMessage.isEmpty {
            logMessage += "\nCaused by error: "
        }

        logMessage += "\(err.domain)(code: \(err.code))"

        let errMessage = err.localizedDescription.trimmed()
        if !errMessage.isEmpty {
            logMessage += " with reason: \(errMessage)"
        }

        // Log message
        println(level, msg: logMessage)
    }

    private func log(level: Logger.LogLevel, tag: String, msg: String?, exc: NSException?) {
        if isLoggable(level) {
            println(level, tag: tag, msg: msg, exc: exc)
        }
    }

    private func println(level: Logger.LogLevel, tag: String, msg: String?, exc: NSException?)
    {
        guard let msg = msg, exc = exc else { return }

        var logMessage = ""

        // Add raw message
        let message = msg.trimmed()
        if !message.isEmpty {
            logMessage += message
        }

        // Add exception description
        if !logMessage.isEmpty {
            logMessage += "\nCaused by exception: "
        }

        logMessage += "\(exc.name)"

        if let message = exc.reason?.trimmed() where !message.isEmpty {
            logMessage += " with reason: \(message)"
        }

        let stackTrace = exc.callStackSymbols
        if !stackTrace.isEmpty {
            logMessage += "\nStack trace:"

            for line in stackTrace {
                logMessage += "\n\(line)"
            }
        }

        // Log message
        println(level, msg: logMessage)
    }

    private func log(level: Logger.LogLevel, tag: String, msg: String?, err: ErrorType?) {
        if isLoggable(level) {
            println(level, tag: tag, msg: msg, err: err)
        }
    }

    private func println(level: Logger.LogLevel, tag: String, msg: String?, err: ErrorType?)
    {
        guard let msg = msg, let err = err else { return }

        var logMessage = ""

        // Add raw message
        let message = msg.trimmed()
        if !message.isEmpty {
            logMessage += message
        }

        // Add error description
        if let err = err as? MDPrintable {
            let message = err.description.trimmed()
            if !message.isEmpty {
                logMessage += "\nCaused by error with reason: \(message)"
            }
        }
        else
        if let err = err as? MDDebugPrintable
        {
            let message = err.debugDescription.trimmed()
            if !message.isEmpty {
                logMessage += "\nCaused by error with reason: \(message)"
            }
        }
        else {
            let message = typeName(err)
            if !message.isEmpty {
                logMessage += "\nCaused by error \(message)"
            }
        }

        // Log message
        println(level, msg: logMessage)
    }

}

// ----------------------------------------------------------------------------
