// ----------------------------------------------------------------------------
//
//  Expect.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

/// A set of expectation methods useful for validating objects states. Only failed expectations are recorded.
/// These methods can be used directly: <code>Expect.isTrue(...)</code>.
public final class Expect: NonCreatable
{
// MARK: - Private Methods

    fileprivate static func safeEqual<T:Equatable>(_ expected: T?, _ actual: T?) -> Bool {
        return (expected == nil && actual == nil) || (expected != nil && actual != nil && expected == actual)
    }

    fileprivate static func throwError(_ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        throw ExpectationError(message, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    /// Expects that a condition is true. If it isn't it throws an {@link ExpectationError} with the given message.
    public static func isTrue(_ condition: Bool, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if !condition {
            try throwError(message, file, line)
        }
    }

    /// Expects that a condition is false. If it isn't it throws an {@link ExpectationError} with the given message.
    public static func isFalse(_ condition: Bool, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(!condition, message, file, line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    /// Expects that two objects are equal. If they are not, an {@link ExpectationError} is thrown with
    /// the given message. If <code>expected</code> and <code>actual</code> are <code>nil</code>,
    /// they are considered equal.
    public static func isEqual<T:Equatable>(_ expected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(safeEqual(expected, actual), message, file, line)
    }

    /// Expects that two objects are <b>not</b> equals. If they are, an {@link ExpectationError} is thrown
    /// with the given message. If <code>unexpected</code> and <code>actual</code> are <code>nil</code>,
    /// they are considered equal.
   public static func isNotEqual<T:Equatable>(_ unexpected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isFalse(safeEqual(unexpected, actual), message, file, line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    /// Expects that two objects refer to the same object. If they are not, an {@link ExpectationError}
    /// is thrown with the given message.
    public static func isSame<T:AnyObject>(_ expected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(expected === actual, message, file, line)
    }

    /// Expects that two objects do not refer to the same object. If they do refer to the same object,
    /// an {@link ExpectationError} is thrown with the given message.
    public static func isNotSame<T:AnyObject>(_ unexpected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isFalse(unexpected === actual, message, file, line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    /// Expects that an object is nil. If it is not, an {@link ExpectationError} is thrown with the given message.
    public static func isNil(_ object: Any?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(object == nil, message, file, line)
    }

    // TODO
    public static func isAllNil<T>(_ objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(objects!.all { $0 == nil }, message, file, line)
        }
    }

// MARK: -

    /// Expects that an object isn't nil. If it is an {@link ExpectationError} is thrown with the given message.
    public static func isNotNil(_ object: Any?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(object != nil, message, file, line)
    }

    // TODO
    public static func isAllNotNil<T>(_ objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(objects!.all { $0 != nil }, message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    // TODO
    public static func isEmpty(_ value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(StringUtils.isEmpty(value), message, file, line)
    }

    // TODO
    public static func isAllEmpty(_ values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(values) {
            try isTrue(StringUtils.isAllEmpty(values), message, file, line)
        }
    }

    public static func isAllEmpty(_ values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(values) {
            try isTrue(StringUtils.isAllEmpty(values), message, file, line)
        }
    }

// MARK: -

    // TODO
    public static func isNotEmpty(_ value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(StringUtils.isNotEmpty(value), message, file, line)
    }

    // TODO
    public static func isAllNotEmpty(_ values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(values) {
            try isTrue(StringUtils.isAllNotEmpty(values), message, file, line)
        }
    }

    public static func isAllNotEmpty(_ values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(values) {
            try isTrue(StringUtils.isAllNotEmpty(values), message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    // TODO
    public static func isEmpty<T>(_ array: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(CollectionUtils.isEmpty(array), message, file, line)
    }

    // TODO
    public static func isEmpty<T>(_ set: Set<T>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(CollectionUtils.isEmpty(set), message, file, line)
    }

    // TODO
    public static func isEmpty<K, V>(_ map: Dictionary<K, V>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(CollectionUtils.isEmpty(map), message, file, line)
    }

// MARK: -

    // TODO
    public static func isNotEmpty<T>(_ array: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(CollectionUtils.isNotEmpty(array), message, file, line)
    }

    // TODO
    public static func isNotEmpty<T>(_ set: Set<T>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(CollectionUtils.isNotEmpty(set), message, file, line)
    }

    // TODO
    public static func isNotEmpty<K, V>(_ map: Dictionary<K, V>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(CollectionUtils.isNotEmpty(map), message, file, line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    // TODO
    public static func isBlank(_ value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(StringUtils.isBlank(value), message, file, line)
    }

    // TODO
    public static func isAllBlank(_ values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(values) {
            try isTrue(StringUtils.isAllBlank(values), message, file, line)
        }
    }

    public static func isAllBlank(_ values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(values) {
            try isTrue(StringUtils.isAllBlank(values), message, file, line)
        }
    }

// MARK: -

    // TODO
    public static func isNotBlank(_ value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(StringUtils.isNotBlank(value), message, file, line)
    }

    // TODO
    public static func isAllNotBlank(_ values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(values) {
            try isTrue(StringUtils.isAllNotBlank(values), message, file, line)
        }
    }

    public static func isAllNotBlank(_ values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(values) {
            try isTrue(StringUtils.isAllNotBlank(values), message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    // TODO
    public static func isValid(_ object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(ValidatableUtils.isValid(object), message, file, line)
    }

    // TODO
    public static func isAllValid(_ objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllValid(objects), message, file, line)
        }
    }

    public static func isAllValid(_ objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllValid(objects), message, file, line)
        }
    }

    public static func isAllValid<T:Validatable>(_ objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllValid(objects), message, file, line)
        }
    }

    public static func isAllValid<T:Validatable>(_ objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllValid(objects), message, file, line)
        }
    }

// MARK: -

    // TODO
    public static func isNotValid(_ object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(ValidatableUtils.isNotValid(object), message, file, line)
    }

    // TODO
    public static func isAllNotValid(_ objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
        }
    }

    public static func isAllNotValid(_ objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
        }
    }

    public static func isAllNotValid<T:Validatable>(_ objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
        }
    }

    public static func isAllNotValid<T:Validatable>(_ objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    // TODO
    public static func isNilOrValid(_ object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(ValidatableUtils.isNilOrValid(object), message, file, line)
    }

    // TODO
    public static func isAllNilOrValid(_ objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
        }
    }

    public static func isAllNilOrValid(_ objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
        }
    }

    public static func isAllNilOrValid<T:Validatable>(_ objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
        }
    }

    public static func isAllNilOrValid<T:Validatable>(_ objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
        }
    }

// MARK: -

    // TODO
    public static func isNilOrNotValid(_ object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(ValidatableUtils.isNilOrNotValid(object), message, file, line)
    }

    // TODO
    public static func isAllNilOrNotValid(_ objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrNotValid(objects), message, file, line)
        }
    }

    public static func isAllNilOrNotValid(_ objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrNotValid(objects), message, file, line)
        }
    }

    public static func isAllNilOrNotValid<T:Validatable>(_ objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrNotValid(objects), message, file, line)
        }
    }

    public static func isAllNilOrNotValid<T:Validatable>(_ objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrNotValid(objects), message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------
