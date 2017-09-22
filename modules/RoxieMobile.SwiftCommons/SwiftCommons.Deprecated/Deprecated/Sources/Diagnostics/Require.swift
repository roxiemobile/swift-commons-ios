// ----------------------------------------------------------------------------
//
//  Require.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import SwiftCommonsLang

// ----------------------------------------------------------------------------

/// A set of requirement methods useful for validating objects states. Only failed requirements are recorded.
/// These methods can be used directly: <code>Require.isTrue(...)</code>.
@available(*, deprecated)
public final class Require: NonCreatable
{
// MARK: - Private Methods

    @available(*, deprecated)
    fileprivate static func rethrowOnFailure(_ message: String?, _ file: StaticString, _ line: UInt, _ block: () throws -> ()) {
        do {
            try block()
        }
        catch _ as ExpectationError {
            raiseException(message, file, line)
        }
        catch {
            roxie_fatalError(message: message ?? "", file: file, line: line)
        }
    }

    @available(*, deprecated)
    fileprivate static func raiseException(_ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        RequirementException("Fatal error: \(message ?? "")\nFile: \(file)\nLine: \(line)", userInfo: nil).raise()
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    @available(*, deprecated)
    public static func isTrue(_ condition: Bool, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isTrue(condition) }
    }

    // TODO
    @available(*, deprecated)
    public static func isFalse(_ condition: Bool, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isFalse(condition) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    @available(*, deprecated)
    public static func isEqual<T:Equatable>(_ expected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isEqual(expected, actual) }
    }

    // TODO
    @available(*, deprecated)
    public static func isNotEqual<T:Equatable>(_ unexpected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotEqual(unexpected, actual) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    @available(*, deprecated)
    public static func isSame<T:AnyObject>(_ expected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isSame(expected, actual) }
    }

    // TODO
    @available(*, deprecated)
    public static func isNotSame<T:AnyObject>(_ unexpected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotSame(unexpected, actual) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    @available(*, deprecated)
    public static func isNil(_ object: Any?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNil(object) }
    }

    // TODO
    @available(*, deprecated)
    public static func isAllNil<T>(_ objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNil(objects) }
    }

// --

    // TODO
    @available(*, deprecated)
    public static func isNotNil(_ object: Any?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotNil(object) }
    }

    // TODO
    @available(*, deprecated)
    public static func isAllNotNil<T>(_ objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotNil(objects) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    @available(*, deprecated)
    public static func isEmpty(_ value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isEmpty(value) }
    }

    // TODO
    @available(*, deprecated)
    public static func isAllEmpty(_ values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllEmpty(values) }
    }

    @available(*, deprecated)
    public static func isAllEmpty(_ values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllEmpty(values) }
    }

// --

    // TODO
    @available(*, deprecated)
    public static func isNotEmpty(_ value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotEmpty(value) }
    }

    // TODO
    @available(*, deprecated)
    public static func isAllNotEmpty(_ values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotEmpty(values) }
    }

    @available(*, deprecated)
    public static func isAllNotEmpty(_ values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotEmpty(values) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    @available(*, deprecated)
    public static func isEmpty<T>(_ array: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isEmpty(array) }
    }

    // TODO
    @available(*, deprecated)
    public static func isEmpty<T>(_ set: Set<T>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isEmpty(set) }
    }

    // TODO
    @available(*, deprecated)
    public static func isEmpty<K, V>(_ map: Dictionary<K, V>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isEmpty(map) }
    }

// --

    // TODO
    @available(*, deprecated)
    public static func isNotEmpty<T>(_ array: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotEmpty(array) }
    }

    // TODO
    @available(*, deprecated)
    public static func isNotEmpty<T>(_ set: Set<T>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotEmpty(set) }
    }

    // TODO
    @available(*, deprecated)
    public static func isNotEmpty<K, V>(_ map: Dictionary<K, V>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotEmpty(map) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    @available(*, deprecated)
    public static func isBlank(_ value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isBlank(value) }
    }

    // TODO
    @available(*, deprecated)
    public static func isAllBlank(_ values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllBlank(values) }
    }

    @available(*, deprecated)
    public static func isAllBlank(_ values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllBlank(values) }
    }

// --

    // TODO
    @available(*, deprecated)
    public static func isNotBlank(_ value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotBlank(value) }
    }

    // TODO
    @available(*, deprecated)
    public static func isAllNotBlank(_ values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotBlank(values) }
    }

    @available(*, deprecated)
    public static func isAllNotBlank(_ values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotBlank(values) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    @available(*, deprecated)
    public static func isValid(_ object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isValid(object) }
    }

    // TODO
    @available(*, deprecated)
    public static func isAllValid(_ objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllValid(objects) }
    }

    @available(*, deprecated)
    public static func isAllValid(_ objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllValid(objects) }
    }

    @available(*, deprecated)
    public static func isAllValid<T:Validatable>(_ objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllValid(objects) }
    }

    @available(*, deprecated)
    public static func isAllValid<T:Validatable>(_ objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllValid(objects) }
    }

// --

    // TODO
    @available(*, deprecated)
    public static func isNotValid(_ object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNotValid(object) }
    }

    // TODO
    @available(*, deprecated)
    public static func isAllNotValid(_ objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotValid(objects) }
    }

    @available(*, deprecated)
    public static func isAllNotValid(_ objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotValid(objects) }
    }

    @available(*, deprecated)
    public static func isAllNotValid<T:Validatable>(_ objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotValid(objects) }
    }

    @available(*, deprecated)
    public static func isAllNotValid<T:Validatable>(_ objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNotValid(objects) }
    }
}

// ----------------------------------------------------------------------------

extension Require
{
// MARK: - Methods

    // TODO
    @available(*, deprecated)
    public static func isNilOrValid(_ object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNilOrValid(object) }
    }

    // TODO
    @available(*, deprecated)
    public static func isAllNilOrValid(_ objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrValid(objects) }
    }

    @available(*, deprecated)
    public static func isAllNilOrValid(_ objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrValid(objects) }
    }

    @available(*, deprecated)
    public static func isAllNilOrValid<T:Validatable>(_ objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrValid(objects) }
    }

    @available(*, deprecated)
    public static func isAllNilOrValid<T:Validatable>(_ objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrValid(objects) }
    }

// --

    // TODO
    @available(*, deprecated)
    public static func isNilOrNotValid(_ object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isNilOrNotValid(object) }
    }

    // TODO
    @available(*, deprecated)
    public static func isAllNilOrNotValid(_ objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
    }

    @available(*, deprecated)
    public static func isAllNilOrNotValid(_ objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
    }

    @available(*, deprecated)
    public static func isAllNilOrNotValid<T:Validatable>(_ objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
    }

    @available(*, deprecated)
    public static func isAllNilOrNotValid<T:Validatable>(_ objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
        rethrowOnFailure(message, file, line) { try Expect.isAllNilOrNotValid(objects) }
    }
}

// ----------------------------------------------------------------------------
