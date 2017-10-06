// ----------------------------------------------------------------------------
//
//  Guard.NotEqual.swift
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
        /// Checks that two objects are *not* equals. If `unexpected` and `actual` are `nil`, they are considered equal.
        /// </summary>
        /// - unexpected: Unexpected value to check.
        /// - actual: The value to check against `unexpected`.
        /// - message: The identifying message for the `GuardException` (`nil` okay).
        /// - Throws: GuardException
        public static void NotEqual(object unexpected, object actual, string message = null)
        {
            if (TryIsFailure(() => Check.NotEqual(unexpected, actual), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that two objects are *not* equals. If `unexpected` and `actual` are `nil`, they are considered equal.
        /// </summary>
        /// - unexpected: Unexpected value to check.
        /// - actual: The value to check against `unexpected`.
        /// - block: The function which returns identifying message for the `GuardException`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void NotEqual(object unexpected, object actual, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.NotEqual(unexpected, actual), out Exception cause)) {
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
//    public static func isNotEqual<T:Equatable>(_ unexpected: T?, _ actual: T?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isNotEqual(unexpected, actual) }
//    }

//    /**
//     Checks that two objects are `not` equals. If `unexpected` and `actual` are `nil`, they are considered equal.
//
//     - Parameters:
//         - unexpected: Unexpected value to check.
//         - actual: The value to check against `unexpected`.
//     */
//    public static func notEqual<T:Equatable>(_ unexpected: T?, _ actual: T?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.notEqual(unexpected, actual) }
//    }
}

// ----------------------------------------------------------------------------
