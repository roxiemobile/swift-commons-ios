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

    private func safeExpectEqual<T:Equatable>(expected: T?, actual: T?) -> Bool {
        return (expected == nil && actual == nil) || (expected != nil && actual != nil && expected == actual)
    }

    private func recursiveForEach<T>(array: [[T]?], _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line,
                                            block:  (T) -> ())
    {
        array.forEach {
            expectNotNil($0, message: message, file: file, line: line)
            $0!.forEach() { block($0) }
        }
    }

    private func throwException(message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        mdc_fatalError(message ?? "", file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func expectTrue(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        if !condition {
            throwException(message, file, line)
        }
    }

    public func expectFalse(condition: Bool, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        expectTrue(!condition, message: message, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func expectEqual<T:Equatable>(expected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        expectTrue(safeExpectEqual(expected, actual: actual), message: message, file: file, line: line)
    }

    public func expectNotEqual<T:Equatable>(unexpected: T?, _ actual: T?, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        expectFalse(safeExpectEqual(unexpected, actual: actual), message: message, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func expectNil(object: Any?, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        expectTrue(object == nil, message: message, file: file, line: line)
    }

    public func expectNotNil(object: Any?, message: String? = nil, file: StaticString = #file, line: UInt = #line) {
        expectTrue(object != nil, message: message, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func expectNilOrEmpty(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 == nil || $0!.isEmpty, message: message, file: file, line: line)
        }
    }

    public func expectNilOrEmpty(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue($0.isEmpty, message: message, file: file, line: line)
        }
    }

    public func expectNilOrEmpty(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue($0 == nil || $0!.isEmpty, message: message, file: file, line: line)
        }
    }

// --

    public func expectNotEmpty(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 != nil && !$0!.isEmpty, message: message, file: file, line: line)
        }
    }

    public func expectNotEmpty(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue(!$0.isEmpty, message: message, file: file, line: line)
        }
    }

    public func expectNotEmpty(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue($0 != nil && !$0!.isEmpty, message: message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func expectNilOrWhiteSpace(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 == nil || $0!.trimmed().isEmpty, message: message, file: file, line: line)
        }
    }

    public func expectNilOrWhiteSpace(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue($0.trimmed().isEmpty, message: message, file: file, line: line)
        }
    }

    public func expectNilOrWhiteSpace(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue($0 == nil || $0!.trimmed().isEmpty, message: message, file: file, line: line)
        }
    }

// --

    public func expectNotWhiteSpace(array: String?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 != nil && !$0!.trimmed().isEmpty, message: message, file: file, line: line)
        }
    }

    public func expectNotWhiteSpace(array: [String]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue(!$0.trimmed().isEmpty, message: message, file: file, line: line)
        }
    }

    public func expectNotWhiteSpace(array: [String?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue($0 != nil && !$0!.trimmed().isEmpty, message: message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func expectValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 != nil && $0!.isValid(), message: message, file: file, line: line)
        }
    }

    public func expectValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue($0.isValid(), message: message, file: file, line: line)
        }
    }

    public func expectValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue($0 != nil && $0!.isValid(), message: message, file: file, line: line)
        }
    }

// --

    public func expectNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 != nil && !$0!.isValid(), message: message, file: file, line: line)
        }
    }

    public func expectNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue(!$0.isValid(), message: message, file: file, line: line)
        }
    }

    public func expectNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue($0 != nil && !$0!.isValid(), message: message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expectable
{
// MARK: - Methods

    public func expectNilOrValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 == nil || $0!.isValid(), message: message, file: file, line: line)
        }
    }

    public func expectNilOrValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue($0.isValid(), message: message, file: file, line: line)
        }
    }

    public func expectNilOrValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue($0 == nil || $0!.isValid(), message: message, file: file, line: line)
        }
    }

// --

    public func expectNilOrNotValid(array: Validatable?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        array.forEach() {
            expectTrue($0 == nil || !$0!.isValid(), message: message, file: file, line: line)
        }
    }

    public func expectNilOrNotValid(array: [Validatable]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue(!$0.isValid(), message: message, file: file, line: line)
        }
    }

    public func expectNilOrNotValid(array: [Validatable?]?..., message: String? = nil, file: StaticString = #file, line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            self.expectTrue($0 == nil || !$0!.isValid(), message: message, file: file, line: line)
        }
    }
}

// ----------------------------------------------------------------------------
