// ----------------------------------------------------------------------------
//
//  Check.NotEqual.swift
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
        /// Checks that two objects are *not* equals. If `unexpected` and `actual` are `nil`, they are considered equal.
        /// </summary>
        /// - unexpected: Unexpected value to check.
        /// - actual: The value to check against `unexpected`.
        /// - message: The identifying message for the `CheckError` (`nil` okay).
        /// - Throws: CheckError
        public static void NotEqual(object unexpected, object actual, string message = null)
        {
            if (Equals(unexpected, actual)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that two objects are *not* equals. If `unexpected` and `actual` are `nil`, they are considered equal.
        /// </summary>
        /// - unexpected: Unexpected value to check.
        /// - actual: The value to check against `unexpected`.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void NotEqual(object unexpected, object actual, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (Equals(unexpected, actual)) {
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
//    /// Expects that two objects are *not* equals. If they are, an {@link ExpectationError} is thrown
//    /// with the given message. If `unexpected` and <code>actual</code> are <code>nil</code>,
//    /// they are considered equal.
//    @available(*, deprecated)
//    public static func isNotEqual<T:Equatable>(_ unexpected: T?, _ actual: T?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isFalse(safeEqual(unexpected, actual), message, file, line)
//    }

//    /**
//     Checks that two objects are `not` equals. If `unexpected` and `actual` are `nil`, they are considered equal.
//
//     - Parameters:
//         - unexpected: Unexpected value to check.
//         - actual: The value to check against `unexpected`.
//     */
//    public static func notEqual<T:Equatable>(_ unexpected: T?, _ actual: T?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isFalse(safeEqual(unexpected, actual), message, file, line)
//    }
}

// ----------------------------------------------------------------------------
