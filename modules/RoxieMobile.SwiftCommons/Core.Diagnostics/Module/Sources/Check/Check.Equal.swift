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
        /// Checks that two objects are equal. If `expected` and `actual` are `nil`, they are considered equal.
        /// </summary>
        /// - expected: Expected value.
        /// - actual: Actual value.
        /// - message: The identifying message for the `CheckError` (`nil` okay).
        /// - Throws: CheckError
        public static void Equal(object expected, object actual, string message = null)
        {
            if (!Equals(expected, actual)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that two objects are equal. If `expected` and `actual` are `nil`, they are considered equal.
        /// </summary>
        /// - expected: Expected value.
        /// - actual: Actual value.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
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
//    public static func isEqual<T:Equatable>(_ expected: T?, _ actual: T?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(safeEqual(expected, actual), message, file, line)
//    }

//    /**
//     Expects that two objects are equal. If they are not, an {@link ExpectationError} is thrown with the given message. If `expected` and `actual` are `nil`, they are considered equal.
//     -  Parameters:
//         - expected: Expected value
//         - actual: Actual value
//     */
// public static func equal<T:Equatable>(_ expected: T?, _ actual: T?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(safeEqual(expected, actual), message, file, line)
//    }
}

// ----------------------------------------------------------------------------
