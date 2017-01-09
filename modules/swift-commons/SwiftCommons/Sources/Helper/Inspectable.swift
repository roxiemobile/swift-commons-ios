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

public protocol Inspectable {
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

extension Inspectable
{
// MARK: - Methods

    public func throwIfEqual<T:Equatable>(expected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            Expect.isEqual(expected, actual)
        }
    }

    public func throwIfNotEqual<T:Equatable>(unexpected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            Expect.isNotEqual(unexpected, actual)
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
            Expect.isNil(object)
        }
    }

    public func throwIfNotNil(object: Any?, message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnFailure(message, file: file, line: line) {
            Expect.isNotNil(object)
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
                Expect.isNotEmpty($0)
            }
        }
    }

    public func throwIfNilOrEmpty(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.isNotEmpty($0)
            }
        }
    }

    public func throwIfNilOrEmpty(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.isNotEmpty($0)
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
                Expect.isNotWhiteSpace($0)
            }
        }
    }

    public func throwIfNilOrWhiteSpace(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.isNotWhiteSpace($0)
            }
        }
    }

    public func throwIfNilOrWhiteSpace(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.isNotWhiteSpace($0)
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
                Expect.isNilOrValid($0)
            }
        }
    }

    public func throwIfNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.isNilOrValid($0)
            }
        }
    }

    public func throwIfNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.isNilOrValid($0)
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
                Expect.isValid($0)
            }
        }
    }

    public func throwIfNilOrNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.isValid($0)
            }
        }
    }

    public func throwIfNilOrNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) throws
    {
        try rethrowOnSuccess(message, file: file, line: line) {
            array.forEach {
                Expect.isValid($0)
            }
        }
    }
}

// ----------------------------------------------------------------------------
