// ----------------------------------------------------------------------------
//
//  Check.NotSame.swift
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
        /// Checks that two objects do not refer to the same object.
        /// </summary>
        /// <param name="unexpected">The object you don't expect.</param>
        /// <param name="actual">The object to compare to <code>unexpected</code>.</param>
        /// <param name="message">The identifying message for the <see cref="CheckException"/> (<c>null</c> okay).</param>
        /// <exception cref="CheckException" />
        public static void NotSame(object unexpected, object actual, string message = null)
        {
            if (ReferenceEquals(unexpected, actual)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that two objects do not refer to the same object.
        /// </summary>
        /// <param name="unexpected">The object you don't expect.</param>
        /// <param name="actual">The object to compare to <code>unexpected</code>.</param>
        /// <param name="block">The function which returns identifying message for the <see cref="CheckException"/>.</param>
        /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
        /// <exception cref="CheckException" />
        public static void NotSame(object unexpected, object actual, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (ReferenceEquals(unexpected, actual)) {
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
//    /// Expects that two objects do not refer to the same object. If they do refer to the same object,
//    /// an {@link ExpectationError} is thrown with the given message.
//    @available(*, deprecated)
//    public static func isNotSame<T:AnyObject>(_ unexpected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isFalse(unexpected === actual, message, file, line)
//    }
}

// ----------------------------------------------------------------------------
