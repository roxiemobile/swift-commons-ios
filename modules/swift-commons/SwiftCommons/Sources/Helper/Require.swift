// ----------------------------------------------------------------------------
//
//  Require.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public class Require: NonCreatable
{
// MARK: - Private Methods

    private static func rethrowOnFailure(message: String?, file: StaticString, line: UInt, block: () throws -> ())
    {
        do {
            try block()
        }
        catch let _ as ExpectationError {
            throwError(message, file, line)
        }
        catch {
            rxm_fatalError(message ?? "", file: file, line: line)
        }
    }

    private static func throwError(message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        RequirementException(reason: "Fatal error: \(message)\nFile: \(file)\nLine: \(line)", userInfo: nil).raise()
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    public static func isTrue(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try Expect.isTrue(condition)
        }
    }

    public static func isFalse(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try Expect.isFalse(condition)
        }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    public static func isEqual<T:Equatable>(expected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try Expect.isEqual(expected, actual)
        }
    }

    public static func isNotEqual<T:Equatable>(unexpected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try Expect.isNotEqual(unexpected, actual)
        }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    public static func isNil(object: Any?, message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try Expect.isNil(object)
        }
    }

    public static func isNotNil(object: Any?, message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try Expect.isNotNil(object)
        }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    public static func isNilOrEmpty(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNilOrEmpty($0)
            }
        }
    }

    public static func isNilOrEmpty(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNilOrEmpty($0)
            }
        }
    }

    public static func isNilOrEmpty(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNilOrEmpty($0)
            }
        }
    }

    public static func isNotEmpty(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNotEmpty($0)
            }
        }
    }

    public static func isNotEmpty(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNotEmpty($0)
            }
        }
    }

    public static func isNotEmpty(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNotEmpty($0)
            }
        }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    public static func isNilOrWhiteSpace(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNilOrWhiteSpace($0)
            }
        }
    }

    public static func isNilOrWhiteSpace(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNilOrWhiteSpace($0)
            }
        }
    }

    public static func isNilOrWhiteSpace(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNilOrWhiteSpace($0)
            }
        }
    }

    public static func isNotBlank(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNotBlank($0)
            }
        }
    }

    public static func isNotBlank(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNotBlank($0)
            }
        }
    }

    public static func isNotBlank(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNotBlank($0)
            }
        }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    public static func isValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isValid($0)
            }
        }
    }

    public static func isValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isValid($0)
            }
        }
    }

    public static func isValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isValid($0)
            }
        }
    }

    public static func isNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNotValid($0)
            }
        }
    }

    public static func isNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line) 
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNotValid($0)
            }
        }
    }

    public static func isNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNotValid($0)
            }
        }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    public static func isNilOrValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNilOrValid($0)
            }
        }
    }

    public static func isNilOrValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNilOrValid($0)
            }
        }
    }

    public static func isNilOrValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNilOrValid($0)
            }
        }
    }

    public static func isNilOrNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNilOrNotValid($0)
            }
        }
    }

    public static func isNilOrNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNilOrNotValid($0)
            }
        }
    }

    public static func isNilOrNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        rethrowOnFailure(message, file: file, line: line) {
            try array.forEach {
                try Expect.isNilOrNotValid($0)
            }
        }
    }
}

// ----------------------------------------------------------------------------
