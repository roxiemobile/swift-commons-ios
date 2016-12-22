// ----------------------------------------------------------------------------
//
//  Expect.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public final class Expect: NonCreatable
{
// MARK: - Methods

    public static func fail(message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        mdc_fatalError(message ?? "", file: file, line: line)
    }

// MARK: - Private Methods

    private static func safeIsEquals<T:Equatable>(expected: T?, actual: T?) -> Bool {
        return (expected == nil && actual == nil) || (expected != nil && actual != nil && expected == actual)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func isTrue(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if !condition {
            fail(message, file: file, line: line)
        }
    }

    public static func isFalse(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        isTrue(!condition, message: message, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func isEquals<T:Equatable>(expected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if !safeIsEquals(expected, actual: actual) {
            fail(message, file: file, line: line)
        }
    }

    public static func isNotEquals<T:Equatable>(unexpected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if safeIsEquals(unexpected, actual: actual) {
            fail(message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func isNil(object: AnyObject?, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        isTrue(object == nil, message: message, file: file, line: line)
    }

    public static func isNotNil(object: AnyObject?, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        isTrue(object != nil, message: message, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func isNilOrEmpty(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        for (_, value) in array.enumerate() {
            if str_isNotEmpty(value) {
                fail(message, file: file, line: line)
            }
        }
    }

    public static func isNilOrWhiteSpace(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        for (_, value) in array.enumerate() {
            if str_isNotEmpty(value?.trimmed()) {
                fail(message, file: file, line: line)
            }
        }
    }

    public static func isNotEmpty(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if !str_isNotEmpty(array) {
            fail(message, file: file, line: line)
        }
    }

    public static func isNotEmpty(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if !str_isNotEmpty(array) {
            fail(message, file: file, line: line)
        }
    }

    public static func isNotEmpty(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if !str_isNotEmpty(array) {
            fail(message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func isValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if !vld_isValid(array) {
            fail(message, file: file, line: line)
        }
    }

    public static func isValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if !vld_isValid(array) {
            fail(message, file: file, line: line)
        }
    }

    public static func isValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if !vld_isValid(array) {
            fail(message, file: file, line: line)
        }
    }

    public static func isNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if vld_isValid(array) {
            fail(message, file: file, line: line)
        }
    }

    public static func isNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if vld_isValid(array) {
            fail(message, file: file, line: line)
        }
    }

    public static func isNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if vld_isValid(array) {
            fail(message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func isNilOrValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach {
            if let value = $0 {
                Expect.isValid(value, message: message, file: file, line: line)
            }
        }
    }

    public static func isNilOrValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach {
            if let value = $0 {
                Expect.isValid(value, message: message, file: file, line: line)
            }
        }
    }

    public static func isNilOrValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach {
            if let value = $0 {
                Expect.isValid(value, message: message, file: file, line: line)
            }
        }
    }

    public static func isNilOrNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach {
            if let value = $0 {
                Expect.isNotValid(value, message: message, file: file, line: line)
            }
        }
    }

    public static func isNilOrNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach {
            if let value = $0 {
                Expect.isNotValid(value, message: message, file: file, line: line)
            }
        }
    }

    public static func isNilOrNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach {
            if let value = $0 {
                Expect.isNotValid(value, message: message, file: file, line: line)
            }
        }
    }
}

// ----------------------------------------------------------------------------
