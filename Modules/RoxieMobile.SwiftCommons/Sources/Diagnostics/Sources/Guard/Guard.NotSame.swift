// ----------------------------------------------------------------------------
//
//  Guard.NotSame.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Guard
{
// MARK: - Methods

    /// Checks that two objects do not refer to the same object.
    ///
    /// - Parameters:
    ///   - unexpected: The object you don't expect.
    ///   - actual: Actual object.
    ///   - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   CheckError
    ///
    public static func notSame<T:AnyObject>(_ unexpected: T?, _ actual: T?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
        if let error = tryIsFailure(try Check.notSame(unexpected, actual)) {
            newGuardException(message, error, file, line).raise()
        }
    }
}

// ----------------------------------------------------------------------------
