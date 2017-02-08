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

// ----------------------------------------------------------------------------

public protocol ContractProtocol
{
// MARK: - Construction

    func v(tag: String, msg: String)
    func d(tag: String, msg: String)
    func i(tag: String, msg: String)

    func w(tag: String, err: NSError?)
    func w(tag: String, exc: NSException?)
    func w(tag: String, err: ErrorType?)

    func w(tag: String, msg: String, err: NSError?)
    func w(tag: String, msg: String, exc: NSException?)
    func w(tag: String, msg: String, err: ErrorType?)

    func e(tag: String, err: NSError?)
    func e(tag: String, exc: NSException?)
    func e(tag: String, err: ErrorType?)

    func e(tag: String, msg: String, err: NSError?)
    func e(tag: String, msg: String, exc: NSException?)
    func e(tag: String, msg: String, err: ErrorType?)

}

// ----------------------------------------------------------------------------

public final class Logger
{
// MARK: - Construction

    static let instance = Logger()

// MARK: - Properties

    public var logger: ContractProtocol? {
        set {
            Logger.instance.mLogger = newValue
        }
        get {
            return Logger.instance.mLogger
        }
    }

    public var logLevel: LogLevel {
        set {
            Logger.instance.mLogLevel = newValue
        }
        get {
            return Logger.instance.mLogLevel
        }
    }

// MARK: - Methods

    /// Checks to see whether or not a log is loggable at the specified level.
    public static func isLoggable(level: LogLevel) -> Bool {
        return (level.rawValue >= Logger.instance.logLevel.rawValue)
    }

// MARK: - Methods

    public class func v(tag: String, msg: String) {
        if let logger = Logger.instance.logger where isLoggable(.Verbose) {
            logger.v(tag, msg: msg)
        }
    }

    public class func d(tag: String, msg: String) {
        if let logger = Logger.instance.logger where isLoggable(.Debug) {
            logger.d(tag, msg: msg)
        }
    }

    public class func i(tag: String, msg: String) {
        if let logger = Logger.instance.logger where isLoggable(.Info) {
            logger.i(tag, msg: msg)
        }
    }

    public class func w(tag: String, msg: String) {
        if let logger = Logger.instance.logger where isLoggable(.Warning) {
            logger.w(tag, msg: msg, err: nil)
        }
    }

    public class func w(tag: String, err: NSError?) {
        if let logger = Logger.instance.logger where isLoggable(.Warning) {
            logger.w(tag, err: err)
        }
    }

    public class func w(tag: String, exc: NSException?) {
        if let logger = Logger.instance.logger where isLoggable(.Warning) {
            logger.w(tag, exc: exc)
        }
    }

    public class func w(tag: String, err: ErrorType?) {
        if let logger = Logger.instance.logger where isLoggable(.Warning) {
            logger.w(tag, err: err)
        }
    }

    public class func w(tag: String, msg: String, err: NSError?) {
        if let logger = Logger.instance.logger where isLoggable(.Warning) {
            logger.w(tag, msg: msg, err: err)
        }
    }

    public class func w(tag: String, msg: String, exc: NSException?) {
        if let logger = Logger.instance.logger where isLoggable(.Warning) {
            logger.e(tag, msg: msg, exc: exc)
        }
    }

    public class func w(tag: String, msg: String, err: ErrorType?) {
        if let logger = Logger.instance.logger where isLoggable(.Warning) {
            logger.w(tag, msg: msg, err: err)
        }
    }

    public class func e(tag: String, err: NSError?) {
        if let logger = Logger.instance.logger where isLoggable(.Error) {
            logger.e(tag, err: err)
        }
    }

    public class func e(tag: String, exc: NSException?) {
        if let logger = Logger.instance.logger where isLoggable(.Error) {
            logger.e(tag, exc: exc)
        }
    }

    public class func e(tag: String, err: ErrorType?) {
        if let logger = Logger.instance.logger where isLoggable(.Error) {
            logger.e(tag, err: err)
        }
    }

    public class func e(tag: String, msg: String, err: NSError?) {
        if let logger = Logger.instance.logger where isLoggable(.Error) {
            logger.e(tag, msg: msg, err: err)
        }
    }

    public class func e(tag: String, msg: String, exc: NSException?) {
        if let logger = Logger.instance.logger where isLoggable(.Error) {
            logger.e(tag, msg: msg, exc: exc)
        }
    }

    public class func e(tag: String, msg: String, err: ErrorType?) {
        if let logger = Logger.instance.logger where isLoggable(.Error) {
            logger.w(tag, msg: msg, err: err)
        }
    }

// MARK: - Private Methods

    // ...

// MARK: - Inner Types

    public enum LogLevel: Int
    {
        // Log level constants for the println() function.
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

        // Will turn off all logging.
        case Suppress
    }

// MARK: - Variables

    private var mLogger: ContractProtocol?

    private var mLogLevel = LogLevel.Info

}

// ----------------------------------------------------------------------------
