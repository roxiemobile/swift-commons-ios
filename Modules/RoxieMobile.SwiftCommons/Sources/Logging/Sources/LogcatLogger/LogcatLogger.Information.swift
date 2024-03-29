// ----------------------------------------------------------------------------
//
//  LogcatLogger.Information.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import OSLog
import SwiftCommonsLang

// ----------------------------------------------------------------------------

extension LogcatLogger {

// MARK: - Methods

    /// Formats and sends an informational log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class
    ///          where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func i(_ tag: String, _ message: String, file: StaticString = #file, line: UInt = #line) {
        let level = Logger.LogLevel.information
        if Logger.isLoggable(level) {
            os_log("%{public}s", type: .default, Logger.description(level, tag, message))
        }
    }

    /// Formats and sends an informational log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class
    ///           where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public func i(_ type: Any.Type, _ message: String, file: StaticString = #file, line: UInt = #line) {
        i(Reflection(of: type).type.fullName, message, file: file, line: line)
    }
}
