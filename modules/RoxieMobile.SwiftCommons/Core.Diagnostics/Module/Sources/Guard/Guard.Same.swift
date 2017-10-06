// ----------------------------------------------------------------------------
//
//  Guard.Same.swift
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

namespace RoxieMobile.CSharpCommons.Diagnostics
{
    /// <summary>
    /// A set of methods useful for validating objects states. Only failed checks are throws exceptions.
    /// </summary>
    public static partial class Guard
    {
// MARK: - Methods

        /// <summary>
        /// Checks that two objects refer to the same object. If they are not, an `GuardException`
        /// is thrown with the given message.
        /// </summary>
        /// - expected: The expected object
        /// - actual: The object to compare to `expected`
        /// - message: The identifying message for the `GuardException` (`nil` okay)
        /// - Throws: GuardException
        public static void Same(object expected, object actual, string message = null)
        {
            if (TryIsFailure(() => Check.Same(expected, actual), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that two objects refer to the same object. If they are not, an `GuardException`
        /// is thrown with the given message.
        /// </summary>
        /// - expected: The expected object
        /// - actual: The object to compare to `expected`
        /// - block: The function which returns identifying message for the `GuardException`
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void Same(object expected, object actual, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.Same(expected, actual), out Exception cause)) {
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
//    public static func isSame<T:AnyObject>(_ expected: T?, _ actual: T?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isSame(expected, actual) }
//    }

//    /**
//     Checks that two objects refer to the same object. If they are not, an `GuardException` is thrown with the given message.
//
//     - Parameters:
//         - message: Verifies that the exact exception is thrown (and not a derived exception type)
//         - line: A delegate to the code that is expected to throw an exception when executed.
//     */
//    public static func same<T:AnyObject>(_ expected: T?, _ actual: T?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.same(expected, actual) }
//    }
}

// ----------------------------------------------------------------------------
