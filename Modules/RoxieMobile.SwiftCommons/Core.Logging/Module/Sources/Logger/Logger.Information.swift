// ----------------------------------------------------------------------------
//
//  Logger.Information.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

extension Logger
{
// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    public static func i(_ tag: String, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.information) {
            logger.i(tag, message(), file: file, line: line)
        }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func i(_ type: Any.Type, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.information) {
            logger.i(type, message(), file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------
