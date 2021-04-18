// ----------------------------------------------------------------------------
//
//  Check.GreaterThanOrEqualTo.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       https://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Check {

// MARK: - Methods

    /// Checks that the parameter value is greater than or equal to the minimum value.
    ///
    /// - Parameters:
    ///   - value: The parameter value.
    ///   - min: The minimum.
    ///   - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   CheckError
    ///
    public static func greaterThanOrEqualTo<T: Comparable>(
        _ value: T,
        _ min: T,
        _ message: @autoclosure () -> String = "",
        file: StaticString = #file,
        line: UInt = #line
    ) throws {

        guard value >= min else {
            throw newCheckError(message(), file, line)
        }
    }
}
