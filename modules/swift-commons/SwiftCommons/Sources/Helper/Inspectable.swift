// ----------------------------------------------------------------------------
//
//  Inspectable.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public protocol Inspectable: Expectable {
    // Do nothing
}

// ----------------------------------------------------------------------------

extension Inspectable
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
        throw ValidationError(message ?? "", file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Inspectable
{
// MARK: - Methods

    public func throwIfTrue(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            self.expectTrue(condition)
        }
    }

    public func throwIfFalse(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            self.expectFalse(condition)
        }
    }
}

// ----------------------------------------------------------------------------

extension Inspectable
{
// MARK: - Methods

    public func throwIfEqual<T:Equatable>(expected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            self.expectEqual(expected, actual)
        }
    }

    public func throwIfNotEqual<T:Equatable>(unexpected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            self.expectNotEqual(unexpected, actual)
        }
    }
}

// ----------------------------------------------------------------------------

extension Inspectable
{
// MARK: - Methods

    public func throwIfNil(object: Any?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            self.expectNil(object)
        }
    }

    public func throwIfNotNil(object: Any?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            self.expectNotNil(object)
        }
    }
}

// ----------------------------------------------------------------------------

extension Inspectable
{
// MARK: - Methods

    public func throwIfNilOrEmpty(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                self.expectNotEmpty($0)
            }
        }
    }

    public func throwIfNilOrEmpty(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                self.expectNotEmpty($0)
            }
        }
    }

    public func throwIfNilOrEmpty(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                self.expectNotEmpty($0)
            }
        }
    }
}

// ----------------------------------------------------------------------------

extension Inspectable
{
// MARK: - Methods

    public func throwIfNilOrWhiteSpace(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                self.expectNotWhiteSpace($0)
            }
        }
    }

    public func throwIfNilOrWhiteSpace(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                self.expectNotWhiteSpace($0)
            }
        }
    }

    public func throwIfNilOrWhiteSpace(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                self.expectNotWhiteSpace($0)
            }
        }
    }
}

// ----------------------------------------------------------------------------

extension Inspectable
{
// MARK: - Methods

    public func throwIfNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                self.expectNilOrValid($0)
            }
        }
    }

    public func throwIfNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                self.expectNilOrValid($0)
            }
        }
    }

    public func throwIfNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                self.expectNilOrValid($0)
            }
        }
    }
}

// ----------------------------------------------------------------------------

extension Inspectable
{
// MARK: - Methods

    public func throwIfNilOrNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                self.expectValid($0)
            }
        }
    }

    public func throwIfNilOrNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                self.expectValid($0)
            }
        }
    }

    public func throwIfNilOrNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                self.expectValid($0)
            }
        }
    }
}

// ----------------------------------------------------------------------------
