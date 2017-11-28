// ----------------------------------------------------------------------------
//
//  Check.Equal.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Check
{
// MARK: - Methods

    /// Checks that two objects are equal. If `expected` and `actual` are `nil`, they are considered equal.
    ///
    /// - Parameters:
    ///   - expected: Expected value to check.
    ///   - actual: Actual value.
    ///   - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   CheckError
    ///
    public static func equal<T:Equatable>(_ expected: T?, _ actual: T?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) throws {
        guard safeEqual(expected, actual) else {
            throw newCheckError(message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------
