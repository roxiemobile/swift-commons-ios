// ----------------------------------------------------------------------------
//
//  Check.AllNotNil.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

extension Check
{
// MARK: - Methods

    /// Checks that all an objects in collection is not `nil`.
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
    public static func allNotNil<T:Collection, V>(
            _ objects: T?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line
    ) throws where T.Element == Optional<V> {
        // objects: Collection<Any?>?

        if let collection = objects, collection.isNotEmpty {
            guard collection.all({ $0 != nil }) else {
                throw newCheckError(message, file, line)
            }
        }
    }
}

// ----------------------------------------------------------------------------
