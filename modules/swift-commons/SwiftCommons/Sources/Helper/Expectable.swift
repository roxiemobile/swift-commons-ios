// ----------------------------------------------------------------------------
//
//  Expectable.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public protocol Expectable {
    // Do nothing
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func throwIfTrue(condition: Bool, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        try checkSuccess(message, file: file, line: line) {
            Expect.isFalse(condition, message: message, file: file, line: line)
        }
    }

    public func throwIfTrue(condition: Bool, file: StaticString = #file, line: UInt = #line) throws
    {
        try checkSuccess(file: file, line: line) {
            Expect.isFalse(condition, message: nil, file: file, line: line)
        }
    }

    public func throwIfFalse(condition: Bool, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        try checkSuccess(message, file: file, line: line) {
            Expect.isTrue(condition, message: message, file: file, line: line)
        }
    }

    public func throwIfFalse(condition: Bool, file: StaticString = #file, line: UInt = #line) throws
    {
        try checkSuccess(file: file, line: line) {
            Expect.isTrue(condition, file: file, line: line)
        }
    }

    public func fail(message: String? = nil, file: StaticString = #file, line: UInt = #line) throws {
        throw ExpectationError(message: message, file: file, line: line)
    }

    public func throwIfEquals<T: Equatable>(expected: T?, actual: T?, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        try checkSuccess(message, file: file, line: line) {
            Expect.isNotEquals(expected, actual: actual, message: message, file: file, line: line)
        }
    }

    public func throwIfNotEquals<T: Equatable>(unexpected: T?, actual: T?, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        try checkSuccess(message, file: file, line: line) {
            Expect.isEquals(unexpected, actual: actual, message: message, file: file, line: line)
        }
    }

    public func throwIfNotNil(object: AnyObject?, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        try checkSuccess(message, file: file, line: line) {
            Expect.isNil(object, message: message, file: file, line: line)
        }
    }

    public func throwIfNil(object: AnyObject?, message: String?, file: StaticString = #file, line: UInt = #line) throws
    {
        try checkSuccess(message, file: file, line: line) {
            Expect.isNotNil(object, message: message, file: file, line: line)
        }
    }

// MARK: -

    public func throwIfNotValid(array: Validatable? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        try checkFailure(file: file, line: line) {
            Expect.isNilOrValidArray(array, file: file, line: line)
        }
    }

    public func throwIfNotValid(array: [Validatable]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        try checkFailure(file: file, line: line) {
            Expect.isNilOrValidArray(array, file: file, line: line)
        }
    }

    public func throwIfNotValid(array: [Validatable?]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        try checkFailure(file: file, line: line) {
            Expect.isNilOrValidArray(array, file: file, line: line)
        }
    }

    public func throwIfNilOrNotValid(array: Validatable? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        try checkFailure(file: file, line: line) {
            Expect.isValidArray(array, file: file, line: line)
        }
    }

    public func throwIfNilOrNotValid(array: [Validatable]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        try checkFailure(file: file, line: line) {
            Expect.isValidArray(array, file: file, line: line)
        }
    }

    public func throwIfNilOrNotValid(array: [Validatable?]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        try checkFailure(file: file, line: line) {
            Expect.isValidArray(array, file: file, line: line)
        }
    }

    public func throwIfNilOrEmpty(array: String? ..., file: StaticString = #file, line: UInt = #line) throws {
        try checkSuccess(file: file, line: line) {
            Expect.isNotEmptyArray(array, file: file, line: line)
        }
    }

    public func throwIfNilOrEmpty(array: [String]? ..., file: StaticString = #file, line: UInt = #line) throws {
        try checkSuccess(file: file, line: line) {
            Expect.isNotEmptyArray(array, file: file, line: line)
        }
    }

    public func throwIfNilOrEmpty(array: [String?]? ..., file: StaticString = #file, line: UInt = #line) throws {
        try checkSuccess(file: file, line: line) {
            Expect.isNotEmptyArray(array, file: file, line: line)
        }
    }

    public func throwIfNilOrWhiteSpace(array: String? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        let trimmed = array.map { $0?.trimmed() }
        try checkSuccess(file: file, line: line) {
            Expect.isNotEmptyArray(trimmed, file: file, line: line)
        }
    }

    public func throwIfNilOrWhiteSpace(array: [String]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        let trimmed = array.map { $0?.map({$0.trimmed()})  }
        try checkSuccess(file: file, line: line) {
            Expect.isNotEmptyArray(trimmed, file: file, line: line)
        }
    }

    public func throwIfNilOrWhiteSpace(array: [String?]? ..., file: StaticString = #file, line: UInt = #line) throws
    {
        let trimmed = array.map { $0?.map({$0?.trimmed()}) }
        try checkSuccess(file: file, line: line) {
            Expect.isNotEmptyArray(trimmed, file: file, line: line)
        }
    }

// MARK: - Private Methods

    private func checkSuccess(message: String? = nil, file: StaticString, line: UInt, block: () -> ()) throws
    {
        var cause: NSException?
        Try {
            block()
        }.Catch { e in
            cause = e
        }

        if cause != nil {
            try fail(message, file: file, line: line)
        }
    }

    private func checkFailure(message: String? = nil, file: StaticString, line: UInt, block: () -> ()) throws
    {
        var cause: NSException?
        Try {
            block()
        }.Catch { e in
            cause = e
        }

        if cause == nil {
            try fail(message, file: file, line: line)
        }
    }

}

// ----------------------------------------------------------------------------
