// ----------------------------------------------------------------------------
//
//  LogcatLogger.Verbose.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import Foundation
import SwiftCommons

// ----------------------------------------------------------------------------

extension LogcatLogger
{
// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    public func v(_ tag: String, _ message: String, file: StaticString = #file, line: UInt = #line) {
        let level = Logger.LogLevel.verbose
        if Logger.isLoggable(level) {
            NSLog("%@", Logger.description(level, tag, message))
        }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func v(_ type: Any.Type, _ message: String, file: StaticString = #file, line: UInt = #line) {
        v(Reflection(of: type).type.fullName, message, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------
