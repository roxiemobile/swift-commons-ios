// ----------------------------------------------------------------------------
//
//  Guard.ThrowsAny.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Guard
{
// MARK: - Methods

    /// Verifies that the exact error or a derived error type is thrown.
    ///
    /// - Parameters:
    ///   - action: A delegate to the code that is expected to throw an error when executed.
    ///   - errorType: The type of the error expected to be thrown.
    ///   - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   GuardException
    ///
    public static func throwsAny<T:Error>(
            _ action: () throws -> Void,
            _ errorType: T.Type,
            _ message: @autoclosure () -> String = "",
            file: StaticString = #file,
            line: UInt = #line
    ) {

        if let error = tryIsFailure(try Check.throwsAny(action, errorType)) {
            let text = message()
            newGuardException(text.isBlank ? ((error as? CheckError)?.message) ?? text : text, error, file, line).raise()
        }
    }
}

// ----------------------------------------------------------------------------
