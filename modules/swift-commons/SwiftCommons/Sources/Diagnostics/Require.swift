// ----------------------------------------------------------------------------
//
//  Require.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

/// A set of requirement methods useful for validating objects states. Only failed requirements are recorded.
/// These methods can be used directly: <code>Require.isTrue(...)</code>.
public final class Require: NonCreatable
{
// MARK: - Private Methods

    private static func rethrowOnFailure(message: String?, _ file: StaticString, _ line: UInt, _ block: () throws -> ()) {
        do {
            try block()
        }
        catch _ as ExpectationError {
            raiseException(message, file, line)
        }
        catch {
            rxm_fatalError(message ?? "", file: file, line: line)
        }
    }

    private static func raiseException(message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        RequirementException("Fatal error: \(message)\nFile: \(file)\nLine: \(line)", userInfo: nil).raise()
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    public static func isTrue(condition: Bool, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isTrue(condition) }
    }

    // TODO
    public static func isFalse(condition: Bool, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isFalse(condition) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    public static func isEqual<T:Equatable>(expected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isEqual(expected, actual) }
    }

    // TODO
    public static func isNotEqual<T:Equatable>(unexpected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotEqual(unexpected, actual) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    public static func isSame<T:AnyObject>(expected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isSame(expected, actual) }
    }

    // TODO
    public static func isNotSame<T:AnyObject>(unexpected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotSame(unexpected, actual) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    public static func isNil(object: Any?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNil(object) }
    }

    // TODO
    public static func isAllNil<T>(objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNil(objects) }
    }

// --

    // TODO
    public static func isNotNil(object: Any?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotNil(object) }
    }

    // TODO
    public static func isAllNotNil<T>(objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotNil(objects) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    public static func isEmpty(value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isEmpty(value) }
    }

    // TODO
    public static func isAllEmpty(values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllEmpty(values) }
    }

    public static func isAllEmpty(values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllEmpty(values) }
    }

// --

    // TODO
    public static func isNotEmpty(value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotEmpty(value) }
    }

    // TODO
    public static func isAllNotEmpty(values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotEmpty(values) }
    }

    public static func isAllNotEmpty(values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotEmpty(values) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    public static func isEmpty<T>(array: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isEmpty(array) }
    }

    // TODO
    public static func isEmpty<T>(set: Set<T>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isEmpty(set) }
    }

    // TODO
    public static func isEmpty<K, V>(map: Dictionary<K, V>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isEmpty(map) }
    }

// --

    // TODO
    public static func isNotEmpty<T>(array: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotEmpty(array) }
    }

    // TODO
    public static func isNotEmpty<T>(set: Set<T>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotEmpty(set) }
    }

    // TODO
    public static func isNotEmpty<K, V>(map: Dictionary<K, V>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotEmpty(map) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    public static func isBlank(value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isBlank(value) }
    }

    // TODO
    public static func isAllBlank(values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllBlank(values) }
    }

    public static func isAllBlank(values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllBlank(values) }
    }

// --

    // TODO
    public static func isNotBlank(value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotBlank(value) }
    }

    // TODO
    public static func isAllNotBlank(values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotBlank(values) }
    }

    public static func isAllNotBlank(values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotBlank(values) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    public static func isValid(object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isValid(object) }
    }

    // TODO
    public static func isAllValid(objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllValid(objects) }
    }

    public static func isAllValid(objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllValid(objects) }
    }

    public static func isAllValid<T:Validatable>(objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllValid(objects) }
    }

    public static func isAllValid<T:Validatable>(objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllValid(objects) }
    }

// --

    // TODO
    public static func isNotValid(object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotValid(object) }
    }

    // TODO
    public static func isAllNotValid(objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotValid(objects) }
    }

    public static func isAllNotValid(objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotValid(objects) }
    }

    public static func isAllNotValid<T:Validatable>(objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotValid(objects) }
    }

    public static func isAllNotValid<T:Validatable>(objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotValid(objects) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    public static func isNilOrValid(object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNilOrValid(object) }
    }

    // TODO
    public static func isAllNilOrValid(objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrValid(objects) }
    }

    public static func isAllNilOrValid(objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrValid(objects) }
    }

    public static func isAllNilOrValid<T:Validatable>(objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrValid(objects) }
    }

    public static func isAllNilOrValid<T:Validatable>(objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrValid(objects) }
    }

// --

    // TODO
    public static func isNilOrNotValid(object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNilOrNotValid(object) }
    }

    // TODO
    public static func isAllNilOrNotValid(objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
    }

    public static func isAllNilOrNotValid(objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
    }

    public static func isAllNilOrNotValid<T:Validatable>(objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
    }

    public static func isAllNilOrNotValid<T:Validatable>(objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
    }
}

// ----------------------------------------------------------------------------
