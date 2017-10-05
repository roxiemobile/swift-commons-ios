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
import SwiftCommons

// ----------------------------------------------------------------------------

extension ChainedLogger
{
// MARK: - Methods

    @available(*, deprecated, message: "\n• Write a description.")
    public func e(_ tag: String, _ message: String, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.e(tag, message, file: file, line: line) }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func e(_ type: Any.Type, _ message: String, file: StaticString = #file, line: UInt = #line) {
        e(Reflection(of: type).type.fullName, message, file: file, line: line)
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public func e(_ tag: String, _ message: String, _ error: Error?, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.e(tag, message, error, file: file, line: line) }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func e(_ type: Any.Type, _ message: String, _ error: Error?, file: StaticString = #file, line: UInt = #line) {
        e(Reflection(of: type).type.fullName, message, error, file: file, line: line)
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public func e(_ tag: String, _ message: String, _ error: NSError?, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.e(tag, message, error, file: file, line: line) }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func e(_ type: Any.Type, _ message: String, _ error: NSError?, file: StaticString = #file, line: UInt = #line) {
        e(Reflection(of: type).type.fullName, message, error, file: file, line: line)
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public func e(_ tag: String, _ message: String, _ exception: NSException?, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.e(tag, message, exception, file: file, line: line) }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func e(_ type: Any.Type, _ message: String, _ exception: NSException?, file: StaticString = #file, line: UInt = #line) {
        e(Reflection(of: type).type.fullName, message, exception, file: file, line: line)
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public func e(_ tag: String, _ error: Error, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.e(tag, error, file: file, line: line) }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func e(_ type: Any.Type, _ error: Error, file: StaticString = #file, line: UInt = #line) {
        e(Reflection(of: type).type.fullName, error, file: file, line: line)
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public func e(_ tag: String, _ error: NSError, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.e(tag, error, file: file, line: line) }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func e(_ type: Any.Type, _ error: NSError, file: StaticString = #file, line: UInt = #line) {
        e(Reflection(of: type).type.fullName, error, file: file, line: line)
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public func e(_ tag: String, _ exception: NSException, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.e(tag, exception, file: file, line: line) }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func e(_ type: Any.Type, _ exception: NSException, file: StaticString = #file, line: UInt = #line) {
        e(Reflection(of: type).type.fullName, exception, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------
