// ----------------------------------------------------------------------------
//
//  Check.Throws.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

extension Check
{
// MARK: - Methods

    /// Verifies that the exact error is thrown (and not a derived error type).
    ///
    /// - Parameters:
    ///   - action: A delegate to the code that is expected to throw an error when executed.
    ///   - errorType: The type of the error expected to be thrown.
    ///   - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   CheckError
    ///
    public static func isThrows<T:Error>(
            _ action: () throws -> Void,
            _ errorType: T.Type,
            _ message: @autoclosure () -> String = "",
            file: StaticString = #file,
            line: UInt = #line
    ) throws {

        var cause: Error? = nil
        do {
            try action()
        }
        catch {
            cause = error
        }

        if (cause == nil) {
            let text = message()

            throw newCheckError(
                    text.isNotBlank ? text :
                            "Expected \(Roxie.typeName(of: errorType)) to be thrown, but nothing was thrown.",
                    file, line);
        }
        else if let error = cause, (type(of: error) != errorType) {
            let text = message()

            throw newCheckError(
                    text.isNotBlank ? text :
                            "Unexpected error type thrown. Expected: \(Roxie.typeName(of: errorType)) but was: \(Roxie.typeName(of: error))",
                    file, line);
        }
    }
}

// ----------------------------------------------------------------------------
