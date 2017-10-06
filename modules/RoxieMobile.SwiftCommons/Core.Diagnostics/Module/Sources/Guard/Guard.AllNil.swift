// ----------------------------------------------------------------------------
//
//  Guard.AllNil.swift
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
// MARK: - Methods: Array

        /// <summary>
        /// Checks that all an objects in array is `nil`.
        /// </summary>
        /// - objects: An array of objects.
        /// - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
        /// - Throws: GuardException
        public static void AllNull<T>(T[] objects, string message = null)
        {
            if (TryIsFailure(() => Check.AllNull(objects), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that all an objects in array is `nil`.
        /// </summary>
        /// - objects: An array of objects.
        /// - block: The function which returns identifying message for the `GuardException`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void AllNull<T>(T[] objects, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.AllNull(objects), out Exception cause)) {
                throw NewGuardError(block(), cause);
            }
        }

// MARK: - Methods: Generic Collection

        /// <summary>
        /// Checks that all an objects in collection is `nil`.
        /// </summary>
        /// - collection: A collection of objects.
        /// - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
        /// - Throws: GuardException
        public static void AllNull<T>(ICollection<T> collection, string message = null)
        {
            if (TryIsFailure(() => Check.AllNull(collection), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that all an objects in collection is `nil`.
        /// </summary>
        /// - collection: A collection of objects.
        /// - block: The function which returns identifying message for the `GuardException`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void AllNull<T>(ICollection<T> collection, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.AllNull(collection), out Exception cause)) {
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
//    public static func isAllNil<T>(_ objects: [T]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllNil(objects) }
//    }

//    /**
//     Checks that all an objects in array is `nil`.
//
//     - Parameter objects: An array of objects.
//     */
//    public static func allNil<T>(_ objects: [T]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.allNil(objects) }
//    }
}

// ----------------------------------------------------------------------------
