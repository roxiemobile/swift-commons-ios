// ----------------------------------------------------------------------------
//
//  Guard.Empty.swift
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
        /// Checks that a string is `nil` or empty.
        /// </summary>
        /// - value: The string to check or `nil`.
        /// - message: The identifying message for the `GuardException` (`nil` okay).
        /// - Throws: GuardException
        public static void Empty(string value, string message = null)
        {
            if (TryIsFailure(() => Check.Empty(value), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that a string is `nil` or empty.
        /// </summary>
        /// - value: The string to check or `nil`.
        /// - block: The function which returns identifying message for the `GuardException`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void Empty(string value, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.Empty(value), out Exception cause)) {
                throw NewGuardError(block(), cause);
            }
        }

// MARK: - Methods: Array

        /// <summary>
        /// Checks that an array is `nil` or empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - array: The array to check or `nil`.
        /// - message: The identifying message for the `GuardException` (`nil` okay).
        /// - Throws: GuardException
        public static void Empty<T>(T[] array, string message = null)
        {
            if (TryIsFailure(() => Check.Empty(array), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that an array is `nil` or empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - array: The array to check or `nil`.
        /// - block: The function which returns identifying message for the `GuardException`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void Empty<T>(T[] array, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.Empty(array), out Exception cause)) {
                throw NewGuardError(block(), cause);
            }
        }

// MARK: - Methods: Generic Collection

        /// <summary>
        /// Checks that a collection is `nil` or empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - collection: The collection to check or `nil`.
        /// - message: The identifying message for the `GuardException` (`nil` okay).
        /// - Throws: GuardException
        public static void Empty<T>(ICollection<T> collection, string message = null)
        {
            if (TryIsFailure(() => Check.Empty(collection), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that a collection is `nil` or empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - collection: The collection to check or `nil`.
        /// - block: The function which returns identifying message for the `GuardException`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void Empty<T>(ICollection<T> collection, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.Empty(collection), out Exception cause)) {
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
//    public static func isEmpty(_ value: String?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isEmpty(value) }
//    }

//    // TODO
//    @available(*, deprecated)
//    public static func isEmpty<T>(_ array: [T]?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isEmpty(array) }
//    }
//
//    // TODO
//    @available(*, deprecated)
//    public static func isEmpty<T>(_ set: Set<T>?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isEmpty(set) }
//    }
//
//    // TODO
//    @available(*, deprecated)
//    public static func isEmpty<K, V>(_ map: Dictionary<K, V>?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isEmpty(map) }
//    }

//// MARK: - Methods: String
//
//    /**
//     Checks that a string is `nil` or empty.
//
//     - Parameter value: The string to check or `nil`.
//     */
//    public static func empty(_ value: String?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.empty(value) }
//    }
//
//// MARK: - Methods: Array
//
//    /**
//     Checks that a string is `nil` or empty.
//
//     - Parameter value: The array to check or `nil`.
//     */
//    public static func empty<T>(_ array: [T]?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.empty(array) }
//    }
//
//// MARK: - Methods: Set
//    /**
//     Checks that a string is `nil` or empty.
//
//     - Parameter value: The set to check or `nil`.
//     */
//    public static func empty<T>(_ set: Set<T>?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.empty(set) }
//    }
//
//// MARK: - Methods: Dictionary
//
//    /**
//     Checks that a string is `nil` or empty.
//
//     - Parameter value: The dictionary to check or `nil`.
//     */
//    public static func empty<K, V>(_ map: Dictionary<K, V>?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.empty(map) }
//    }
}

// ----------------------------------------------------------------------------
