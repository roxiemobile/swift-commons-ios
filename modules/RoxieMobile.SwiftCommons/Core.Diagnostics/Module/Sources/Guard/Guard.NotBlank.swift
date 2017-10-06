// ----------------------------------------------------------------------------
//
//  Guard.NotBlank.swift
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
        /// Checks that a string is not `nil`, not empty and contains not only whitespace characters.
        /// </summary>
        /// - value: The string to check or `nil`.
        /// - message: The identifying message for the `GuardException` (`nil` okay).
        /// - Throws: GuardException
        public static void NotBlank(string value, string message = null)
        {
            if (TryIsFailure(() => Check.NotBlank(value), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that a string is not `nil`, not empty and contains not only whitespace characters.
        /// </summary>
        /// - value: The string to check or `nil`.
        /// - block: The function which returns identifying message for the `GuardException`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void NotBlank(string value, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.NotBlank(value), out Exception cause)) {
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
//    public static func isNotBlank(_ value: String?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isNotBlank(value) }
//    }

//    /**
//     Checks that a string is not `nil`, not empty and contains not only whitespace characters.
//
//     - Parameter value: The string to check or `nil`.
//     */
//    public static func notBlank(_ value: String?, _ message: @autoclosure () -> String? = nil, file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.notBlank(value) }
//    }
}

// ----------------------------------------------------------------------------
