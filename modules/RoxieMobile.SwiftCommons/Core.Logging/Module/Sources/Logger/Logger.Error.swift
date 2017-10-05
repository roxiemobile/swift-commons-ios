// ----------------------------------------------------------------------------
//
//  Logger.Error.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommons

// ----------------------------------------------------------------------------

extension Logger
{
// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    public static func e(_ tag: String, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, message(), file: file, line: line)
        }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func e(_ type: Any.Type, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(type, message(), file: file, line: line)
        }
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public static func e(_ tag: String, _ message: @autoclosure () -> String, _ error: Error?, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, message(), error, file: file, line: line)
        }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func e(_ type: Any.Type, _ message: @autoclosure () -> String, _ error: Error?, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(type, message(), error, file: file, line: line)
        }
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public static func e(_ tag: String, _ message: @autoclosure () -> String, _ error: NSError?, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, message(), error, file: file, line: line)
        }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func e(_ type: Any.Type, _ message: @autoclosure () -> String, _ error: NSError?, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(type, message(), error, file: file, line: line)
        }
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public static func e(_ tag: String, _ message: @autoclosure () -> String, _ exception: NSException?, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, message(), exception, file: file, line: line)
        }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func e(_ type: Any.Type, _ message: @autoclosure () -> String, _ exception: NSException?, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(type, message(), exception, file: file, line: line)
        }
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public static func e(_ tag: String, _ error: Error, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, error, file: file, line: line)
        }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func e(_ type: Any.Type, _ error: Error, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(type, error, file: file, line: line)
        }
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public static func e(_ tag: String, _ error: NSError, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, error, file: file, line: line)
        }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func e(_ type: Any.Type, _ error: NSError, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(type, error, file: file, line: line)
        }
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public static func e(_ tag: String, _ exception: NSException, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(tag, exception, file: file, line: line)
        }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func e(_ type: Any.Type, _ exception: NSException, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.error) {
            logger.e(type, exception, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------
