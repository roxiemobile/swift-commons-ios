// ----------------------------------------------------------------------------
//
//  Guard.AllNil.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Guard
{
// MARK: - Methods

    /// Checks that all an objects in collection is `nil`.
    ///
    /// - Parameters:
    ///   - objects: An collection of an objects.
    ///   - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
    ///   - file: The file name. The default is the file where function is called.
    ///   - line: The line number. The default is the line number where function is called.
    ///
    /// - Throws:
    ///   CheckError
    ///
    public static func allNil<T:Collection, V>(
            _ objects: T?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line
    ) where T.Element == Optional<V> {
        // objects: Collection<Any?>?

        if let error = tryIsFailure(try Check.allNil(objects)) {
            newGuardException(message, error, file, line).raise()
        }
    }
}

// ----------------------------------------------------------------------------
