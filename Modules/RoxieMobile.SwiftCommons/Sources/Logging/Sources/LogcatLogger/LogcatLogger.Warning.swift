// ----------------------------------------------------------------------------
//
//  LogcatLogger.Warning.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommonsLang

// ----------------------------------------------------------------------------

extension LogcatLogger {

// MARK: - Methods

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class
    ///          where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func w(_ tag: String, _ message: String, file: StaticString = #file, line: UInt = #line) {
        let level = Logger.LogLevel.warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class
    ///           where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func w(_ type: Any.Type, _ message: String, file: StaticString = #file, line: UInt = #line) {
        w(Reflection(of: type).type.fullName, message, file: file, line: line)
    }

// --

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class
    ///          where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func w(
        _ tag: String,
        _ message: String,
        _ error: Error?,
        file: StaticString = #file,
        line: UInt = #line
    ) {

        let level = Logger.LogLevel.warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, error))
        }
    }

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class
    ///           where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func w(
        _ type: Any.Type,
        _ message: String,
        _ error: Error?,
        file: StaticString = #file,
        line: UInt = #line
    ) {

        w(Reflection(of: type).type.fullName, message, error, file: file, line: line)
    }

// --

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class
    ///          where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func w(
        _ tag: String,
        _ message: String,
        _ error: NSError?,
        file: StaticString = #file,
        line: UInt = #line
    ) {

        let level = Logger.LogLevel.warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, error))
        }
    }

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class
    ///           where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func w(
        _ type: Any.Type,
        _ message: String,
        _ error: NSError?,
        file: StaticString = #file,
        line: UInt = #line
    ) {

        w(Reflection(of: type).type.fullName, message, error, file: file, line: line)
    }

// --

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class
    ///          where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - exception: An exception to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func w(
        _ tag: String,
        _ message: String,
        _ exception: NSException?,
        file: StaticString = #file,
        line: UInt = #line
    ) {

        let level = Logger.LogLevel.warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message, exception))
        }
    }

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class
    ///           where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - exception: An exception to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func w(
        _ type: Any.Type,
        _ message: String,
        _ exception: NSException?,
        file: StaticString = #file,
        line: UInt = #line
    ) {

        w(Reflection(of: type).type.fullName, message, exception, file: file, line: line)
    }

// --

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class
    ///          where the log call occurs.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func w(_ tag: String, _ error: Error, file: StaticString = #file, line: UInt = #line) {
        let level = Logger.LogLevel.warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, error))
        }
    }

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class
    ///           where the log call occurs.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func w(_ type: Any.Type, _ error: Error, file: StaticString = #file, line: UInt = #line) {
        w(Reflection(of: type).type.fullName, error, file: file, line: line)
    }

// --

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class
    ///          where the log call occurs.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func w(_ tag: String, _ error: NSError, file: StaticString = #file, line: UInt = #line) {
        let level = Logger.LogLevel.warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, error))
        }
    }

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class
    ///           where the log call occurs.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func w(_ type: Any.Type, _ error: NSError, file: StaticString = #file, line: UInt = #line) {
        w(Reflection(of: type).type.fullName, error, file: file, line: line)
    }

// --

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class
    ///          where the log call occurs.
    ///   - exception: An exception to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func w(_ tag: String, _ exception: NSException, file: StaticString = #file, line: UInt = #line) {
        let level = Logger.LogLevel.warning
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, nil, exception))
        }
    }

    /// Formats and sends a warning log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class
    ///           where the log call occurs.
    ///   - exception: An exception to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func w(_ type: Any.Type, _ exception: NSException, file: StaticString = #file, line: UInt = #line) {
        w(Reflection(of: type).type.fullName, exception, file: file, line: line)
    }
}
