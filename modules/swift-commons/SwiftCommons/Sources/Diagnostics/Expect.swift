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

    private static func safeEqual<T:Equatable>(expected: T?, _ actual: T?) -> Bool {
        return (expected == nil && actual == nil) || (expected != nil && actual != nil && expected == actual)
    }

    private static func throwError(message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        throw ExpectationError(message, file: file, line: line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    /// Expects that a condition is true. If it isn't it throws an {@link ExpectationError} with the given message.
    public static func isTrue(condition: Bool, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if !condition {
            try throwError(message, file, line)
        }
    }

    /// Expects that a condition is false. If it isn't it throws an {@link ExpectationError} with the given message.
    public static func isFalse(condition: Bool, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
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
    public static func isEqual<T:Equatable>(expected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(safeEqual(expected, actual), message, file, line)
    }

    /// Expects that two objects are <b>not</b> equals. If they are, an {@link ExpectationError} is thrown
    /// with the given message. If <code>unexpected</code> and <code>actual</code> are <code>nil</code>,
    /// they are considered equal.
   public static func isNotEqual<T:Equatable>(unexpected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isFalse(safeEqual(unexpected, actual), message, file, line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    /// Expects that two objects refer to the same object. If they are not, an {@link ExpectationError}
    /// is thrown with the given message.
    public static func isSame<T:AnyObject>(expected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(expected === actual, message, file, line)
    }

    /// Expects that two objects do not refer to the same object. If they do refer to the same object,
    /// an {@link ExpectationError} is thrown with the given message.
    public static func isNotSame<T:AnyObject>(unexpected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isFalse(unexpected === actual, message, file, line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    /// Expects that an object is nil. If it is not, an {@link ExpectationError} is thrown with the given message.
    public static func isNil(object: Any?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(object == nil, message, file, line)
    }

    // TODO
    public static func isAllNil<T>(objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(objects!.all { $0 == nil }, message, file, line)
        }
    }

// MARK: -

    /// Expects that an object isn't nil. If it is an {@link ExpectationError} is thrown with the given message.
    public static func isNotNil(object: Any?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(object != nil, message, file, line)
    }

    // TODO
    public static func isAllNotNil<T>(objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
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
    public static func isEmpty(value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(StringUtils.isEmpty(value), message, file, line)
    }

    // TODO
    public static func isAllEmpty(values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(values) {
            try isTrue(StringUtils.isAllEmpty(values), message, file, line)
        }
    }

    public static func isAllEmpty(values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(values) {
            try isTrue(StringUtils.isAllEmpty(values), message, file, line)
        }
    }

// MARK: -

    // TODO
    public static func isNotEmpty(value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(StringUtils.isNotEmpty(value), message, file, line)
    }

    // TODO
    public static func isAllNotEmpty(values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(values) {
            try isTrue(StringUtils.isAllNotEmpty(values), message, file, line)
        }
    }

    public static func isAllNotEmpty(values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
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
    public static func isEmpty<T>(array: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(CollectionUtils.isEmpty(array), message, file, line)
    }

    // TODO
    public static func isEmpty<T>(set: Set<T>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(CollectionUtils.isEmpty(set), message, file, line)
    }

    // TODO
    public static func isEmpty<K, V>(map: Dictionary<K, V>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(CollectionUtils.isEmpty(map), message, file, line)
    }

// MARK: -

    // TODO
    public static func isNotEmpty<T>(array: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(CollectionUtils.isNotEmpty(array), message, file, line)
    }

    // TODO
    public static func isNotEmpty<T>(set: Set<T>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(CollectionUtils.isNotEmpty(set), message, file, line)
    }

    // TODO
    public static func isNotEmpty<K, V>(map: Dictionary<K, V>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(CollectionUtils.isNotEmpty(map), message, file, line)
    }
}

// ----------------------------------------------------------------------------

extension Expect
{
// MARK: - Methods

    // TODO
    public static func isBlank(value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(StringUtils.isBlank(value), message, file, line)
    }

    // TODO
    public static func isAllBlank(values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(values) {
            try isTrue(StringUtils.isAllBlank(values), message, file, line)
        }
    }

    public static func isAllBlank(values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(values) {
            try isTrue(StringUtils.isAllBlank(values), message, file, line)
        }
    }

// MARK: -

    // TODO
    public static func isNotBlank(value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(StringUtils.isNotBlank(value), message, file, line)
    }

    // TODO
    public static func isAllNotBlank(values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(values) {
            try isTrue(StringUtils.isAllNotBlank(values), message, file, line)
        }
    }

    public static func isAllNotBlank(values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
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
    public static func isValid(object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(ValidatableUtils.isValid(object), message, file, line)
    }

    // TODO
    public static func isAllValid(objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllValid(objects), message, file, line)
        }
    }

    public static func isAllValid(objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllValid(objects), message, file, line)
        }
    }

    public static func isAllValid<T:Validatable>(objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllValid(objects), message, file, line)
        }
    }

    public static func isAllValid<T:Validatable>(objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllValid(objects), message, file, line)
        }
    }

// MARK: -

    // TODO
    public static func isNotValid(object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(ValidatableUtils.isNotValid(object), message, file, line)
    }

    // TODO
    public static func isAllNotValid(objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
        }
    }

    public static func isAllNotValid(objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
        }
    }

    public static func isAllNotValid<T:Validatable>(objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
        }
    }

    public static func isAllNotValid<T:Validatable>(objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
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
    public static func isNilOrValid(object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(ValidatableUtils.isNilOrValid(object), message, file, line)
    }

    // TODO
    public static func isAllNilOrValid(objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
        }
    }

    public static func isAllNilOrValid(objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
        }
    }

    public static func isAllNilOrValid<T:Validatable>(objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
        }
    }

    public static func isAllNilOrValid<T:Validatable>(objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrValid(objects), message, file, line)
        }
    }

// MARK: -

    // TODO
    public static func isNilOrNotValid(object: Validatable?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        try isTrue(ValidatableUtils.isNilOrNotValid(object), message, file, line)
    }

    // TODO
    public static func isAllNilOrNotValid(objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrNotValid(objects), message, file, line)
        }
    }

    public static func isAllNilOrNotValid(objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrNotValid(objects), message, file, line)
        }
    }

    public static func isAllNilOrNotValid<T:Validatable>(objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrNotValid(objects), message, file, line)
        }
    }

    public static func isAllNilOrNotValid<T:Validatable>(objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
        if CollectionUtils.isNotEmpty(objects) {
            try isTrue(ValidatableUtils.isAllNilOrNotValid(objects), message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------
