// ----------------------------------------------------------------------------
//
//  Check.IsTrue.swift
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
        /// Checks that a condition is <c>true</c>.
        /// </summary>
        /// <param name="condition">Condition to be checked.</param>
        /// <param name="message">The identifying message for the <see cref="CheckException"/> (<c>null</c> okay).</param>
        /// <exception cref="CheckException" />
        public static void True(bool condition, string message = null)
        {
            if (!condition) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that a condition is <c>true</c>.
        /// </summary>
        /// <param name="condition">Condition to be checked.</param>
        /// <param name="block">The function which returns identifying message for the <see cref="CheckException"/>.</param>
        /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
        /// <exception cref="CheckException" />
        public static void True(bool condition, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!condition) {
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
//    /// Expects that a condition is true. If it isn't it throws an {@link ExpectationError} with the given message.
//    @available(*, deprecated)
//    public static func isTrue(_ condition: Bool, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if !condition {
//            try throwError(message, file, line)
//        }
//    }
}

// ----------------------------------------------------------------------------
