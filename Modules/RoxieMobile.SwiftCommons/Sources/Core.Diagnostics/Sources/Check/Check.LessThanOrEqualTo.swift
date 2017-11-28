// ----------------------------------------------------------------------------
//
//  Check.LessThanOrEqualTo.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Check
{
// MARK: - Methods

    /// Checks that the parameter value is less than or equal to the maximum value.
    ///
    /// - Parameters:
    ///   - value: The parameter value.
    ///   - max: The maximum.
    ///   - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   CheckError
    ///
    public static func lessThanOrEqualTo<T:Comparable>(_ value: T, _ max: T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) throws {
        guard max >= value else {
            throw newCheckError(message, file, line)
        }
    }
}

// ----------------------------------------------------------------------------
