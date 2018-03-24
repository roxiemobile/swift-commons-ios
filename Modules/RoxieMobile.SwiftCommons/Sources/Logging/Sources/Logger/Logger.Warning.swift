// ----------------------------------------------------------------------------
//
//  Logger.Warning.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

extension Logger
{
// MARK: - Methods

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func w(_ tag: String, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, message(), file: file, line: line)
        }
    }

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func w(_ type: Any.Type, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(type, message(), file: file, line: line)
        }
    }

// --

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func w(_ tag: String, _ message: @autoclosure () -> String, _ error: Error?, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, message(), error, file: file, line: line)
        }
    }

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func w(_ type: Any.Type, _ message: @autoclosure () -> String, _ error: Error?, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(type, message(), error, file: file, line: line)
        }
    }

// --

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func w(_ tag: String, _ message: @autoclosure () -> String, _ error: NSError?, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, message(), error, file: file, line: line)
        }
    }

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func w(_ type: Any.Type, _ message: @autoclosure () -> String, _ error: NSError?, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(type, message(), error, file: file, line: line)
        }
    }

// --

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - exception: An exception to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func w(_ tag: String, _ message: @autoclosure () -> String, _ exception: NSException?, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, message(), exception, file: file, line: line)
        }
    }

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - exception: An exception to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func w(_ type: Any.Type, _ message: @autoclosure () -> String, _ exception: NSException?, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(type, message(), exception, file: file, line: line)
        }
    }

// --

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func w(_ tag: String, _ error: Error, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, error, file: file, line: line)
        }
    }

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func w(_ type: Any.Type, _ error: Error, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(type, error, file: file, line: line)
        }
    }

// --

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func w(_ tag: String, _ error: NSError, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, error, file: file, line: line)
        }
    }

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func w(_ type: Any.Type, _ error: NSError, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(type, error, file: file, line: line)
        }
    }

// --

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - exception: An exception to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func w(_ tag: String, _ exception: NSException, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(tag, exception, file: file, line: line)
        }
    }

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - exception: An exception to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func w(_ type: Any.Type, _ exception: NSException, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.warning) {
            logger.w(type, exception, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------
