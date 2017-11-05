// ----------------------------------------------------------------------------
//
//  ChainedLogger.Warning.swift
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
    public func w(_ tag: String, _ message: String, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.w(tag, message, file: file, line: line) }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func w(_ type: Any.Type, _ message: String, file: StaticString = #file, line: UInt = #line) {
        w(Reflection(of: type).type.fullName, message, file: file, line: line)
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public func w(_ tag: String, _ message: String, _ error: Error?, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.w(tag, message, error, file: file, line: line) }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func w(_ type: Any.Type, _ message: String, _ error: Error?, file: StaticString = #file, line: UInt = #line) {
        w(Reflection(of: type).type.fullName, message, error, file: file, line: line)
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public func w(_ tag: String, _ message: String, _ error: NSError?, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.w(tag, message, error, file: file, line: line) }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func w(_ type: Any.Type, _ message: String, _ error: NSError?, file: StaticString = #file, line: UInt = #line) {
        w(Reflection(of: type).type.fullName, message, error, file: file, line: line)
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public func w(_ tag: String, _ message: String, _ exception: NSException?, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.w(tag, message, exception, file: file, line: line) }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func w(_ type: Any.Type, _ message: String, _ exception: NSException?, file: StaticString = #file, line: UInt = #line) {
        w(Reflection(of: type).type.fullName, message, exception, file: file, line: line)
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public func w(_ tag: String, _ error: Error, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.w(tag, error, file: file, line: line) }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func w(_ type: Any.Type, _ error: Error, file: StaticString = #file, line: UInt = #line) {
        w(Reflection(of: type).type.fullName, error, file: file, line: line)
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public func w(_ tag: String, _ error: NSError, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.w(tag, error, file: file, line: line) }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func w(_ type: Any.Type, _ error: NSError, file: StaticString = #file, line: UInt = #line) {
        w(Reflection(of: type).type.fullName, error, file: file, line: line)
    }

// --

    @available(*, deprecated, message: "\n• Write a description.")
    public func w(_ tag: String, _ exception: NSException, file: StaticString = #file, line: UInt = #line) {
        self.loggers.forEach { $0.w(tag, exception, file: file, line: line) }
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public func w(_ type: Any.Type, _ exception: NSException, file: StaticString = #file, line: UInt = #line) {
        w(Reflection(of: type).type.fullName, exception, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------
