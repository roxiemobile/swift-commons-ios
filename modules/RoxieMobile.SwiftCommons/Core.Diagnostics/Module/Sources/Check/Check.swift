// ----------------------------------------------------------------------------
//
//  Check.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

/// A set of methods useful for validating objects states. Only failed checks are throws errors.
/// These methods can be used directly: `Check.isTrue(...)`.
public final class Check: NonCreatable
{
// MARK: - Internal Methods

    /// Initializes a new instance of the `CheckError` class with a specified error message.
    ///
    /// - Parameters:
    ///   - message: The error message that explains the reason for the error. The default is an empty string.
    ///   - file: The file name.
    ///   - line: The line number.
    ///
    /// - Returns:
    ///   A new instance of a CheckError.
    ///
    internal static func newCheckError(_ message: @autoclosure () -> String = "", _ file: StaticString, _ line: UInt) -> CheckError {
        return CheckError(message(), file: file, line: line)
    }

// MARK: - Private Methods

    /// Checks that two objects are equal. If `expected` and `actual` are `nil`, they are considered equal.
    ///
    /// - Parameters:
    ///   - expected: Expected object.
    ///   - actual: Actual object.
    ///
    /// - Returns:
    ///   A boolean value indicating whether two objects are equal.
    ///
    internal static func safeEqual<T:Equatable>(_ expected: T?, _ actual: T?) -> Bool {
        return (expected == nil && actual == nil) || (expected != nil && actual != nil && expected == actual)
    }
}

// ----------------------------------------------------------------------------
