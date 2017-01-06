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
// MARK: - Private Methods

    private static func safeExpectEqual<T:Equatable>(expected: T?, actual: T?) -> Bool {
        return (expected == nil && actual == nil) || (expected != nil && actual != nil && expected == actual)
    }

    private static func recursiveForEach<T>(array: [[T]?], _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line,
                                            block:  (T) -> ())
    {
        array.forEach {
            expectNotNil($0, message: message, file: file, line: line)
            $0!.forEach() { block($0) }
        }
    }

    private static func throwException(message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        mdc_fatalError(message ?? "", file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func expectTrue(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if !condition {
            throwException(message, file, line)
        }
    }

    public static func expectFalse(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        expectTrue(!condition, message: message, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func expectEqual<T:Equatable>(expected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        expectTrue(safeExpectEqual(expected, actual: actual), message: message, file: file, line: line)
    }

    public static func expectNotEqual<T:Equatable>(unexpected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        expectFalse(safeExpectEqual(unexpected, actual: actual), message: message, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func expectNil(object: AnyObject?, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        expectTrue(object == nil, message: message, file: file, line: line)
    }

    public static func expectNil(object: Any?, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        expectTrue(object == nil, message: message, file: file, line: line)
    }

// --

    public static func expectNotNil(object: AnyObject?, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        expectTrue(object != nil, message: message, file: file, line: line)
    }

    public static func expectNotNil(object: Any?, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        expectTrue(object != nil, message: message, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func expectNilOrEmpty(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 == nil || $0!.isEmpty, message: message, file: file, line: line)
        }
    }

    public static func expectNilOrEmpty(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue($0.isEmpty, message: message, file: file, line: line)
        }
    }

    public static func expectNilOrEmpty(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue($0 == nil || $0!.isEmpty, message: message, file: file, line: line)
        }
    }

// --

    public static func expectNotEmpty(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 != nil && !$0!.isEmpty, message: message, file: file, line: line)
        }
    }

    public static func expectNotEmpty(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue(!$0.isEmpty, message: message, file: file, line: line)
        }
    }

    public static func expectNotEmpty(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue($0 != nil && !$0!.isEmpty, message: message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func expectNilOrWhiteSpace(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 == nil || $0!.trimmed().isEmpty, message: message, file: file, line: line)
        }
    }

    public static func expectNilOrWhiteSpace(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue($0.trimmed().isEmpty, message: message, file: file, line: line)
        }
    }

    public static func expectNilOrWhiteSpace(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue($0 == nil || $0!.trimmed().isEmpty, message: message, file: file, line: line)
        }
    }

// --

    public static func expectNotWhiteSpace(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 != nil && !$0!.trimmed().isEmpty, message: message, file: file, line: line)
        }
    }

    public static func expectNotWhiteSpace(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue(!$0.trimmed().isEmpty, message: message, file: file, line: line)
        }
    }

    public static func expectNotWhiteSpace(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue($0 != nil && !$0!.trimmed().isEmpty, message: message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func expectValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 != nil && $0!.isValid(), message: message, file: file, line: line)
        }
    }

    public static func expectValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue($0.isValid(), message: message, file: file, line: line)
        }
    }

    public static func expectValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue($0 != nil && $0!.isValid(), message: message, file: file, line: line)
        }
    }

// --

    public static func expectNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 != nil && !$0!.isValid(), message: message, file: file, line: line)
        }
    }

    public static func expectNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue(!$0.isValid(), message: message, file: file, line: line)
        }
    }

    public static func expectNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue($0 != nil && !$0!.isValid(), message: message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func expectNilOrValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 == nil || $0!.isValid(), message: message, file: file, line: line)
        }
    }

    public static func expectNilOrValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue($0.isValid(), message: message, file: file, line: line)
        }
    }

    public static func expectNilOrValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue($0 == nil || $0!.isValid(), message: message, file: file, line: line)
        }
    }

// --

    public static func expectNilOrNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 == nil || !$0!.isValid(), message: message, file: file, line: line)
        }
    }

    public static func expectNilOrNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue(!$0.isValid(), message: message, file: file, line: line)
        }
    }

    public static func expectNilOrNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            expectTrue($0 == nil || !$0!.isValid(), message: message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------
