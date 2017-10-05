// ----------------------------------------------------------------------------
//
//  Logger.Debug.swift
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
    public static func d(_ tag: String, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.debug) {
            logger.d(tag, message(), file: file, line: line)
        }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public static func d(_ type: Any.Type, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) {
        if let logger = Logger.shared.logger(), isLoggable(.debug) {
            logger.d(type, message(), file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------
