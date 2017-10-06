// ----------------------------------------------------------------------------
//
//  Guard.NotEmpty.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import SwiftCommons

// ----------------------------------------------------------------------------

/*
using System;
using System.Collections.Generic;

namespace RoxieMobile.CSharpCommons.Diagnostics
{
    /// <summary>
    /// A set of methods useful for validating objects states. Only failed checks are throws exceptions.
    /// </summary>
    public static partial class Guard
    {
// MARK: - Methods: String

        /// <summary>
        /// Checks that a string is not `nil` and not empty.
        /// </summary>
        /// - value: The string to check or `nil`.
        /// - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
        /// - Throws: GuardException
        public static void NotEmpty(string value, string message = null)
        {
            if (TryIsFailure(() => Check.NotEmpty(value), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that a string is not `nil` and not empty.
        /// </summary>
        /// - value: The string to check or `nil`.
        /// - block: The function which returns identifying message for the `GuardException`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void NotEmpty(string value, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.NotEmpty(value), out Exception cause)) {
                throw NewGuardError(block(), cause);
            }
        }

// MARK: - Methods: Array

        /// <summary>
        /// Checks that an array is not `nil` and not empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - array: The array to check or `nil`.
        /// - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
        /// - Throws: GuardException
        public static void NotEmpty<T>(T[] array, string message = null)
        {
            if (TryIsFailure(() => Check.NotEmpty(array), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that an array is not `nil` and not empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - array: The array to check or `nil`.
        /// - block: The function which returns identifying message for the `GuardException`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void NotEmpty<T>(T[] array, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.NotEmpty(array), out Exception cause)) {
                throw NewGuardError(block(), cause);
            }
        }

// MARK: - Methods: Generic Collection

        /// <summary>
        /// Checks that a collection is not `nil` and not empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - collection: The collection to check or `nil`.
        /// - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
        /// - Throws: GuardException
        public static void NotEmpty<T>(ICollection<T> collection, string message = null)
        {
            if (TryIsFailure(() => Check.NotEmpty(collection), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that a collection is not `nil` and not empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - collection: The collection to check or `nil`.
        /// - block: The function which returns identifying message for the `GuardException`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void NotEmpty<T>(ICollection<T> collection, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.NotEmpty(collection), out Exception cause)) {
                throw NewGuardError(block(), cause);
            }
        }
    }
}
*/

extension Guard
{
// MARK: - Methods

//    // TODO
//    @available(*, deprecated)
//    public static func isNotEmpty(_ value: String?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isNotEmpty(value) }
//    }

//    // TODO
//    @available(*, deprecated)
//    public static func isNotEmpty<T>(_ array: [T]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isNotEmpty(array) }
//    }
//
//    // TODO
//    @available(*, deprecated)
//    public static func isNotEmpty<T>(_ set: Set<T>?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isNotEmpty(set) }
//    }
//
//    // TODO
//    @available(*, deprecated)
//    public static func isNotEmpty<K, V>(_ map: Dictionary<K, V>?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isNotEmpty(map) }
//    }

//// MARK: - Methods: String
//
//    /**
//     Checks that a string is not `nil` and not empty.
//
//     - Parameter value: The string to check or `nil`.
//     */
//    public static func notEmpty(_ value: String?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.notEmpty(value) }
//    }
//
//// MARK: - Methods: Array
//
//    /**
//     Checks that an array is not `nil` and not empty.
//
//     - Parameter array: The array to check or `nil`.
//     */
//    public static func notEmpty<T>(_ array: [T]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.notEmpty(array) }
//    }
//
//// MARK: - Methods: Set
//
//    /**
//     Checks that a set is not `nil` and not empty.
//
//     - Parameter set: The set to check or `nil`.
//     */
//    public static func notEmpty<T>(_ set: Set<T>?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.notEmpty(set) }
//    }
//
//// MARK: - Methods: Dictionary
//
//    /**
//     Checks that a dictionary is not `nil` and not empty.
//
//     - Parameter map: The dictionary to check or `nil`.
//     */
//    public static func notEmpty<K, V>(_ map: Dictionary<K, V>?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.notEmpty(map) }
//    }
}

// ----------------------------------------------------------------------------
