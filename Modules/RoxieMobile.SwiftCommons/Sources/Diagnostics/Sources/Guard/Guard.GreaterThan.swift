// ----------------------------------------------------------------------------
//
//  Guard.GreaterThan.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Guard
{
// MARK: - Methods

    /// Checks that the parameter value is greater than the minimum value.
    ///
    /// - Parameters:
    ///   - value: The parameter value.
    ///   - min: The minimum.
    ///   - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   GuardException
    ///
    public static func greaterThan<T:Comparable>(_ value: T, _ min: T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
        if let error = tryIsFailure(try Check.greaterThan(value, min)) {
            newGuardException(message, error, file, line).raise()
        }
    }
}

// ----------------------------------------------------------------------------
