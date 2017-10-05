// ----------------------------------------------------------------------------
//
//  Check.Equal.swift
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
    public static partial class Check
    {
// MARK: - Methods

        /// <summary>
        /// Checks that two objects are equal. If <c>expected</c> and <c>actual</c> are <c>null</c>, they are considered equal.
        /// </summary>
        /// <param name="expected">Expected value.</param>
        /// <param name="actual">Actual value.</param>
        /// <param name="message">The identifying message for the <see cref="CheckException"/> (<c>null</c> okay).</param>
        /// <exception cref="CheckException" />
        public static void Equal(object expected, object actual, string message = null)
        {
            if (!Equals(expected, actual)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that two objects are equal. If <c>expected</c> and <c>actual</c> are <c>null</c>, they are considered equal.
        /// </summary>
        /// <param name="expected">Expected value.</param>
        /// <param name="actual">Actual value.</param>
        /// <param name="block">The function which returns identifying message for the <see cref="CheckException"/>.</param>
        /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
        /// <exception cref="CheckException" />
        public static void Equal(object expected, object actual, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!Equals(expected, actual)) {
                throw NewCheckException(block());
            }
        }
    }
}
*/

extension Check
{
// MARK: - Methods

//    // TODO
//    /// Expects that two objects are equal. If they are not, an {@link ExpectationError} is thrown with
//    /// the given message. If <code>expected</code> and <code>actual</code> are <code>nil</code>,
//    /// they are considered equal.
//    @available(*, deprecated)
//    public static func isEqual<T:Equatable>(_ expected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(safeEqual(expected, actual), message, file, line)
//    }
}

// ----------------------------------------------------------------------------
