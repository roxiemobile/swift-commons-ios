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

    private static func safeEqual<T:Equatable>(expected: T?, _ actual: T?) -> Bool {
        return (expected == nil && actual == nil) || (expected != nil && actual != nil && expected == actual)
    }

    private static func recursiveForEach<T>(array: [[T]?], _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line,
                                            block:  (T) -> ())
    {
        array.forEach {
            isNotNil($0, message, file, line)
            $0!.forEach() { block($0) }
        }
    }

    private static func throwException(message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rxm_fatalError(message ?? "", file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    public static func isTrue(condition: Bool, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        if !condition {
            throwException(message, file, line)
        }
    }

    public static func isFalse(condition: Bool, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        isTrue(!condition, message, file, line)
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    public static func isEqual<T:Equatable>(expected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        isTrue(safeEqual(expected, actual), message, file, line)
    }

    public static func isNotEqual<T:Equatable>(unexpected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        isFalse(safeEqual(unexpected, actual), message, file, line)
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    public static func isNil(object: Any?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        isTrue(object == nil, message, file, line)
    }

    public static func isNotNil(object: Any?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        isTrue(object != nil, message, file, line)
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    public static func isNilOrEmpty(array: String?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        array.forEach() {
            isTrue($0 == nil || $0!.isEmpty, message, file, line)
        }
    }

    public static func isNilOrEmpty(array: [String]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue($0.isEmpty, message, file, line)
        }
    }

    public static func isNilOrEmpty(array: [String?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue($0 == nil || $0!.isEmpty, message, file, line)
        }
    }

// --

    public static func isNotEmpty(array: String?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        array.forEach() {
            isTrue($0 != nil && !$0!.isEmpty, message, file, line)
        }
    }

    public static func isNotEmpty(array: [String]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue(!$0.isEmpty, message, file, line)
        }
    }

    public static func isNotEmpty(array: [String?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue($0 != nil && !$0!.isEmpty, message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    public static func isNilOrWhiteSpace(array: String?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        array.forEach() {
            isTrue($0 == nil || $0!.trimmed().isEmpty, message, file, line)
        }
    }

    public static func isNilOrWhiteSpace(array: [String]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue($0.trimmed().isEmpty, message, file, line)
        }
    }

    public static func isNilOrWhiteSpace(array: [String?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue($0 == nil || $0!.trimmed().isEmpty, message, file, line)
        }
    }

// --

    public static func isNotWhiteSpace(array: String?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        array.forEach() {
            isTrue($0 != nil && !$0!.trimmed().isEmpty, message, file, line)
        }
    }

    public static func isNotWhiteSpace(array: [String]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue(!$0.trimmed().isEmpty, message, file, line)
        }
    }

    public static func isNotWhiteSpace(array: [String?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue($0 != nil && !$0!.trimmed().isEmpty, message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    public static func isValid(array: Validatable?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        array.forEach() {
            isTrue($0 != nil && $0!.isValid(), message, file, line)
        }
    }

    public static func isValid(array: [Validatable]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue($0.isValid(), message, file, line)
        }
    }

    public static func isValid(array: [Validatable?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue($0 != nil && $0!.isValid(), message, file, line)
        }
    }

// --

    public static func isNotValid(array: Validatable?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        array.forEach() {
            isTrue($0 != nil && !$0!.isValid(), message, file, line)
        }
    }

    public static func isNotValid(array: [Validatable]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue(!$0.isValid(), message, file, line)
        }
    }

    public static func isNotValid(array: [Validatable?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue($0 != nil && !$0!.isValid(), message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    public static func isNilOrValid(array: Validatable?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        array.forEach() {
            isTrue($0 == nil || $0!.isValid(), message, file, line)
        }
    }

    public static func isNilOrValid(array: [Validatable]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue($0.isValid(), message, file, line)
        }
    }

    public static func isNilOrValid(array: [Validatable?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue($0 == nil || $0!.isValid(), message, file, line)
        }
    }

// --

    public static func isNilOrNotValid(array: Validatable?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        array.forEach() {
            isTrue($0 == nil || !$0!.isValid(), message, file, line)
        }
    }

    public static func isNilOrNotValid(array: [Validatable]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue(!$0.isValid(), message, file, line)
        }
    }

    public static func isNilOrNotValid(array: [Validatable?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line)
    {
        recursiveForEach(array, message, file, line) {
            isTrue($0 == nil || !$0!.isValid(), message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------
