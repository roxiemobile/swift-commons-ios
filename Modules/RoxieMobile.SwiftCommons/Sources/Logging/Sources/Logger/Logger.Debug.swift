// ----------------------------------------------------------------------------
//
//  Logger.Debug.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Logger
{
// MARK: - Methods

    /// Formats and sends a debug log message.
    ///
    /// - Parameters:
    ///   - tag: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func d(_ tag: String, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.debug) {
            logger.d(tag, message(), file: file, line: line)
        }
    }

    /// Formats and sends a debug log message.
    ///
    /// - Parameters:
    ///   - type: Used to identify the source of a log message. It usually identifies the class where the log call occurs.
    ///   - message: The message you would like logged.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    public static func d(_ type: Any.Type, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.debug) {
            logger.d(type, message(), file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------
