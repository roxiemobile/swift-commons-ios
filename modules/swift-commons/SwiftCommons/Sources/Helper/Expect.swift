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

public class Expect: NonCreatable
{
// MARK: - Private Methods

    private static func safeEqual<T:Equatable>(expected: T?, _ actual: T?) -> Bool {
        return (expected == nil && actual == nil) || (expected != nil && actual != nil && expected == actual)
    }

    private static func recursiveForEach<T>(array: [[T]?], _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line,
                                            block:  (T) throws -> ()) rethrows
    {
        try array.forEach {
            try isNotNil($0, message, file, line)
            try $0!.forEach() { try block($0) }
        }
    }

    private static func throwException(message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        throw ValidationError(message ?? "", file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func isTrue(condition: Bool, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        if !condition {
            try throwException(message, file, line)
        }
    }

    public static func isFalse(condition: Bool, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(!condition, message, file, line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func isEqual<T:Equatable>(expected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(safeEqual(expected, actual), message, file, line)
    }

    public static func isNotEqual<T:Equatable>(unexpected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isFalse(safeEqual(unexpected, actual), message, file, line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func isSame<T: AnyObject>(expected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(expected === actual, message, file, line)
    }

    public static func isNotSame<T: AnyObject>(unexpected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isFalse(unexpected === actual, message, file, line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func isNil(object: Any?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(object == nil, message, file, line)
    }

    public static func isNotNil(object: Any?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(object != nil, message, file, line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func isNilOrEmpty(array: String?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try array.forEach() {
            try isTrue($0 == nil || $0!.isEmpty, message, file, line)
        }
    }

    public static func isNilOrEmpty(array: [String]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try isTrue($0.isEmpty, message, file, line)
        }
    }

    public static func isNilOrEmpty(array: [String?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try isTrue($0 == nil || $0!.isEmpty, message, file, line)
        }
    }

// --

    public static func isNotEmpty(array: String?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try array.forEach() {
            try isTrue($0 != nil && !$0!.isEmpty, message, file, line)
        }
    }

    public static func isNotEmpty(array: [String]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try isTrue(!$0.isEmpty, message, file, line)
        }
    }

    public static func isNotEmpty(array: [String?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try isTrue($0 != nil && !$0!.isEmpty, message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func isNilOrWhiteSpace(array: String?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try array.forEach() {
            try isTrue($0 == nil || $0!.trimmed().isEmpty, message, file, line)
        }
    }

    public static func isNilOrWhiteSpace(array: [String]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try isTrue($0.trimmed().isEmpty, message, file, line)
        }
    }

    public static func isNilOrWhiteSpace(array: [String?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try isTrue($0 == nil || $0!.trimmed().isEmpty, message, file, line)
        }
    }

// --

    public static func isNotBlank(array: String?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try isNotEmpty(array)
        try array.forEach() {
            try isTrue(String.isNotBlank($0), message, file, line)
        }
    }

    public static func isNotBlank(array: [String]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
//        try isNotEmpty(array)
        try recursiveForEach(array, message, file, line) {
            try isNotEmpty($0)
            try isTrue(String.isNotBlank($0), message, file, line)
        }
    }

    public static func isNotBlank(array: [String?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
//        try isNotEmpty(array)
        try recursiveForEach(array, message, file, line) {
            try isNotEmpty($0)
            try isTrue(String.isNotBlank($0), message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func isValid(array: Validatable?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try array.forEach() {
            try isTrue($0 != nil && $0!.isValid(), message, file, line)
        }
    }

    public static func isValid(array: [Validatable]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try isTrue($0.isValid(), message, file, line)
        }
    }

    public static func isValid(array: [Validatable?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try isTrue($0 != nil && $0!.isValid(), message, file, line)
        }
    }

// --

    public static func isNotValid(array: Validatable?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try array.forEach() {
            try isTrue($0 != nil && !$0!.isValid(), message, file, line)
        }
    }

    public static func isNotValid(array: [Validatable]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try isTrue(!$0.isValid(), message, file, line)
        }
    }

    public static func isNotValid(array: [Validatable?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try isTrue($0 != nil && !$0!.isValid(), message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    public static func isNilOrValid(array: Validatable?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try array.forEach() {
            try isTrue($0 == nil || $0!.isValid(), message, file, line)
        }
    }

    public static func isNilOrValid(array: [Validatable]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try isTrue($0.isValid(), message, file, line)
        }
    }

    public static func isNilOrValid(array: [Validatable?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try isTrue($0 == nil || $0!.isValid(), message, file, line)
        }
    }

// --

    public static func isNilOrNotValid(array: Validatable?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try array.forEach() {
            try isTrue($0 == nil || !$0!.isValid(), message, file, line)
        }
    }

    public static func isNilOrNotValid(array: [Validatable]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try isTrue(!$0.isValid(), message, file, line)
        }
    }

    public static func isNilOrNotValid(array: [Validatable?]?..., _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws
    {
        try recursiveForEach(array, message, file, line) {
            try isTrue($0 == nil || !$0!.isValid(), message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------
