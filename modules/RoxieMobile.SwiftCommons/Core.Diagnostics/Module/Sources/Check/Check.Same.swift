// ----------------------------------------------------------------------------
//
//  Check.Same.swift
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
        /// Checks that two objects refer to the same object. If they are not, an <see cref="CheckException"/>
        /// is thrown with the given message.
        /// </summary>
        /// <param name="expected">The expected object</param>
        /// <param name="actual">The object to compare to <c>expected</c></param>
        /// <param name="message">The identifying message for the <see cref="CheckException"/> (<c>null</c> okay)</param>
        /// <exception cref="CheckException" />
        public static void Same(object expected, object actual, string message = null)
        {
            if (!ReferenceEquals(expected, actual)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that two objects refer to the same object. If they are not, an <see cref="CheckException"/>
        /// is thrown with the given message.
        /// </summary>
        /// <param name="expected">The expected object</param>
        /// <param name="actual">The object to compare to <c>expected</c></param>
        /// <param name="block">The function which returns identifying message for the <see cref="CheckException"/></param>
        /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
        /// <exception cref="CheckException" />
        public static void Same(object expected, object actual, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!ReferenceEquals(expected, actual)) {
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
//    /// Expects that two objects refer to the same object. If they are not, an {@link ExpectationError}
//    /// is thrown with the given message.
//    @available(*, deprecated)
//    public static func isSame<T:AnyObject>(_ expected: T?, _ actual: T?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(expected === actual, message, file, line)
//    }
}

// ----------------------------------------------------------------------------
