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
        /// Checks that two objects are <b>not</b> equals. If <code>unexpected</code> and <c>actual</c> are <c>null</c>, they are considered equal.
        /// </summary>
        /// <param name="unexpected">Unexpected value to check.</param>
        /// <param name="actual">The value to check against <c>unexpected</c>.</param>
        /// <param name="message">The identifying message for the <see cref="GuardError"/> (<c>null</c> okay).</param>
        /// <exception cref="GuardError" />
        public static void NotEqual(object unexpected, object actual, string message = null)
        {
            if (TryIsFailure(() => Check.NotEqual(unexpected, actual), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that two objects are <b>not</b> equals. If <code>unexpected</code> and <c>actual</c> are <c>null</c>, they are considered equal.
        /// </summary>
        /// <param name="unexpected">Unexpected value to check.</param>
        /// <param name="actual">The value to check against <c>unexpected</c>.</param>
        /// <param name="block">The function which returns identifying message for the <see cref="GuardError"/>.</param>
        /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
        /// <exception cref="GuardError" />
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
//    public static func isNotEqual<T:Equatable>(_ unexpected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isNotEqual(unexpected, actual) }
//    }
}

// ----------------------------------------------------------------------------
