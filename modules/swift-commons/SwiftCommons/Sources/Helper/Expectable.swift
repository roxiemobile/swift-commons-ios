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
            try throwError(message, file, line)
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
            try throwError(message, file, line)
        }
    }

    private func throwError(message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
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
            Expect.expectTrue(condition)
        }
    }

    public func throwIfFalse(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            Expect.expectFalse(condition)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func throwIfEqual<T:Equatable>(expected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            Expect.expectEqual(expected, actual)
        }
    }

    public func throwIfNotEqual<T:Equatable>(unexpected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            Expect.expectNotEqual(unexpected, actual)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func throwIfNil(object: Any?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            Expect.expectNil(object)
        }
    }

    public func throwIfNotNil(object: Any?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            Expect.expectNotNil(object)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func throwIfNilOrEmpty(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.expectNotEmpty($0)
            }
        }
    }

    public func throwIfNilOrEmpty(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.expectNotEmpty($0)
            }
        }
    }

    public func throwIfNilOrEmpty(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.expectNotEmpty($0)
            }
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func throwIfNilOrWhiteSpace(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.expectNotWhiteSpace($0)
            }
        }
    }

    public func throwIfNilOrWhiteSpace(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.expectNotWhiteSpace($0)
            }
        }
    }

    public func throwIfNilOrWhiteSpace(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.expectNotWhiteSpace($0)
            }
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func throwIfNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.expectNilOrValid($0)
            }
        }
    }

    public func throwIfNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.expectNilOrValid($0)
            }
        }
    }

    public func throwIfNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.expectNilOrValid($0)
            }
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func throwIfNilOrNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.expectValid($0)
            }
        }
    }

    public func throwIfNilOrNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.expectValid($0)
            }
        }
    }

    public func throwIfNilOrNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.expectValid($0)
            }
        }
    }
}

// ----------------------------------------------------------------------------
