// ----------------------------------------------------------------------------
//
//  ChainedLogger.Error.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommonsLang

// ----------------------------------------------------------------------------

extension ChainedLogger {
// MARK: - Methods

    /// Formats and sends an error log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func e(_ tag: String, _ message: String, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.e(tag, message, file: file, line: line) }
    }

    /// Formats and sends an error log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func e(_ type: Any.Type, _ message: String, file: StaticString = #file, line: UInt = #line) {
        e(Reflection(of: type).type.fullName, message, file: file, line: line)
    }

// --

    /// Formats and sends an error log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func e(_ tag: String, _ message: String, _ error: Error?, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.e(tag, message, error, file: file, line: line) }
    }

    /// Formats and sends an error log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func e(_ type: Any.Type, _ message: String, _ error: Error?, file: StaticString = #file, line: UInt = #line) {
        e(Reflection(of: type).type.fullName, message, error, file: file, line: line)
    }

// --

    /// Formats and sends an error log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func e(_ tag: String, _ message: String, _ error: NSError?, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.e(tag, message, error, file: file, line: line) }
    }

    /// Formats and sends an error log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func e(_ type: Any.Type, _ message: String, _ error: NSError?, file: StaticString = #file, line: UInt = #line) {
        e(Reflection(of: type).type.fullName, message, error, file: file, line: line)
    }

// --

    /// Formats and sends an error log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - exception: An exception to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func e(_ tag: String, _ message: String, _ exception: NSException?, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.e(tag, message, exception, file: file, line: line) }
    }

    /// Formats and sends an error log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - exception: An exception to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func e(_ type: Any.Type, _ message: String, _ exception: NSException?, file: StaticString = #file, line: UInt = #line) {
        e(Reflection(of: type).type.fullName, message, exception, file: file, line: line)
    }

// --

    /// Formats and sends an error log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func e(_ tag: String, _ error: Error, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.e(tag, error, file: file, line: line) }
    }

    /// Formats and sends an error log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func e(_ type: Any.Type, _ error: Error, file: StaticString = #file, line: UInt = #line) {
        e(Reflection(of: type).type.fullName, error, file: file, line: line)
    }

// --

    /// Formats and sends an error log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func e(_ tag: String, _ error: NSError, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.e(tag, error, file: file, line: line) }
    }

    /// Formats and sends an error log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - error: An error to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func e(_ type: Any.Type, _ error: NSError, file: StaticString = #file, line: UInt = #line) {
        e(Reflection(of: type).type.fullName, error, file: file, line: line)
    }

// --

    /// Formats and sends an error log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - exception: An exception to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func e(_ tag: String, _ exception: NSException, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.e(tag, exception, file: file, line: line) }
    }

    /// Formats and sends an error log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - exception: An exception to log.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func e(_ type: Any.Type, _ exception: NSException, file: StaticString = #file, line: UInt = #line) {
        e(Reflection(of: type).type.fullName, exception, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------
