// ----------------------------------------------------------------------------
//
//  Check.AllNotValid.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

/*
    {
// MARK: - Methods

        /// <summary>
        ///
        /// </summary>
        /// - objects: An array of objects.
        /// - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
        /// - Throws: CheckError
        public static void AllNotValid(IValidatable[] objects, string message = null)
        {
            if (!TryAllNotValid(objects)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that all an objects in array is not `nil` and not valid.
        /// </summary>
        /// - objects: An array of objects.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void AllNotValid(IValidatable[] objects, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!TryAllNotValid(objects)) {
                throw NewCheckException(block());
            }
        }

// MARK: - Private Methods

        private static bool TryAllNotValid(IValidatable[] objects) =>
            objects.IsEmpty() || objects.All(o => o?.IsNotValid() ?? false);
    }
}
*/

extension Check
{
// MARK: - Methods

    /// Checks that all an objects in collection is not valid.
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
    public static func allNotValid<T:Collection>(
            _ objects: T?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line
    ) throws where T.Element == Validatable {
        // objects: Collection<Validatable>?

        if let collection = objects, collection.isNotEmpty {
            guard collection.all({ $0.isNotValid }) else {
                throw newCheckError(message, file, line)
            }
        }
    }

    /// Checks that all an objects in collection is not valid.
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
    public static func allNotValid<T:Collection>(
            _ objects: T?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line
    ) throws where T.Element: Validatable {
        // objects: Collection<Subtype: Validatable>?

        if let collection = objects, collection.isNotEmpty {
            guard collection.all({ $0.isNotValid }) else {
                throw newCheckError(message, file, line)
            }
        }
    }

// MARK: - Methods

    /// Checks that all an objects in collection is not `nil` and not valid.
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
    public static func allNotValid<T:Collection>(
            _ objects: T?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line
    ) throws where T.Element == Optional<Validatable> {
        // objects: Collection<Validatable?>?

        if let collection = objects, collection.isNotEmpty {
            guard collection.all({ ($0 != nil) && $0!.isNotValid }) else {
                throw newCheckError(message, file, line)
            }
        }
    }

    /// Checks that all an objects in collection is not `nil` and not valid.
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
    public static func allNotValid<T:Collection, V:Validatable>(
            _ objects: T?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line
    ) throws where T.Element == Optional<V> {
        // objects: Collection<Subtype: Validatable?>?

        if let collection = objects, collection.isNotEmpty {
            guard collection.all({ ($0 != nil) && $0!.isNotValid }) else {
                throw newCheckError(message, file, line)
            }
        }
    }
}

// ----------------------------------------------------------------------------
