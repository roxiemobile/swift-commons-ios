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

    public func fail(message: String? = nil, file: StaticString = #file, line: UInt = #line) throws {
        throw ExpectationError(message ?? "", file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func throwIfTrue(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            Expect.isTrue(condition)
        }
    }

    public func throwIfFalse(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            Expect.isFalse(condition)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func throwIfEquals<T:Equatable>(expected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            Expect.isEquals(expected, actual)
        }
    }

    public func throwIfNotEquals<T:Equatable>(unexpected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            Expect.isNotEquals(unexpected, actual)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func throwIfNil(object: AnyObject?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            Expect.isNil(object)
        }
    }

    public func throwIfNotNil(object: AnyObject?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            Expect.isNotNil(object)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func throwIfNilOrEmpty(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            array.forEach {
                Expect.isNilOrEmpty($0)
            }
        }
    }

    public func throwIfNilOrEmpty(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try self.throwIfNilOrEmpty($0, message: message, file: file, line: line)
        }
    }

    public func throwIfNilOrEmpty(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try self.throwIfNilOrEmpty($0, message: message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func throwIfNilOrWhiteSpace(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            array.forEach {
                Expect.isNilOrWhiteSpace($0)
            }
        }
    }

    public func throwIfNilOrWhiteSpace(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try self.throwIfNilOrWhiteSpace($0, message: message, file: file, line: line)
        }
    }

    public func throwIfNilOrWhiteSpace(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try self.throwIfNilOrWhiteSpace($0, message: message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func throwIfNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            array.forEach {
                Expect.isNotValid($0)
            }
        }
    }

    public func throwIfNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try self.throwIfNotValid($0, message: message, file: file, line: line)
        }
    }

    public func throwIfNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try self.throwIfNotValid($0, message: message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func throwIfNilOrNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            array.forEach {
                Expect.isNilOrNotValid($0)
            }
        }
    }

    public func throwIfNilOrNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try self.throwIfNilOrNotValid($0, message: message, file: file, line: line)
        }
    }

    public func throwIfNilOrNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try self.throwIfNilOrNotValid($0, message: message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Private Methods

    private func rethrowOnSuccess(message: String?, file: StaticString, line: UInt, block: () -> ()) throws
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

    private func rethrowOnFailure(message: String?, file: StaticString, line: UInt, block: () -> ()) throws
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

    private func recursiveForEach<T>(array: [[T]?], _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line,
                                  block: (T) throws -> ()) rethrows
    {
        try array.forEach {
            if let strings = $0 {

                try strings.forEach {
                    try block($0)
                }
            }
            else {
                try fail(message, file: file, line: line)
            }
        }
    }
}

// ----------------------------------------------------------------------------
