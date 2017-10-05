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
        /// Checks that a string is <c>null</c> or empty.
        /// </summary>
        /// <param name="value">The string to check or <c>null</c>.</param>
        /// <param name="message">The identifying message for the <see cref="GuardError"/> (<c>null</c> okay).</param>
        /// <exception cref="GuardError" />
        public static void Empty(string value, string message = null)
        {
            if (TryIsFailure(() => Check.Empty(value), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that a string is <c>null</c> or empty.
        /// </summary>
        /// <param name="value">The string to check or <c>null</c>.</param>
        /// <param name="block">The function which returns identifying message for the <see cref="GuardError"/>.</param>
        /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
        /// <exception cref="GuardError" />
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
        /// Checks that an array is <c>null</c> or empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// <param name="array">The array to check or <c>null</c>.</param>
        /// <param name="message">The identifying message for the <see cref="GuardError"/> (<c>null</c> okay).</param>
        /// <exception cref="GuardError" />
        public static void Empty<T>(T[] array, string message = null)
        {
            if (TryIsFailure(() => Check.Empty(array), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that an array is <c>null</c> or empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// <param name="array">The array to check or <c>null</c>.</param>
        /// <param name="block">The function which returns identifying message for the <see cref="GuardError"/>.</param>
        /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
        /// <exception cref="GuardError" />
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
        /// Checks that a collection is <c>null</c> or empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// <param name="collection">The collection to check or <c>null</c>.</param>
        /// <param name="message">The identifying message for the <see cref="GuardError"/> (<c>null</c> okay).</param>
        /// <exception cref="GuardError" />
        public static void Empty<T>(ICollection<T> collection, string message = null)
        {
            if (TryIsFailure(() => Check.Empty(collection), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that a collection is <c>null</c> or empty.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// <param name="collection">The collection to check or <c>null</c>.</param>
        /// <param name="block">The function which returns identifying message for the <see cref="GuardError"/>.</param>
        /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
        /// <exception cref="GuardError" />
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
//    public static func isEmpty(_ value: String?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isEmpty(value) }
//    }

//    // TODO
//    @available(*, deprecated)
//    public static func isEmpty<T>(_ array: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isEmpty(array) }
//    }
//
//    // TODO
//    @available(*, deprecated)
//    public static func isEmpty<T>(_ set: Set<T>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isEmpty(set) }
//    }
//
//    // TODO
//    @available(*, deprecated)
//    public static func isEmpty<K, V>(_ map: Dictionary<K, V>?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isEmpty(map) }
//    }
}

// ----------------------------------------------------------------------------
