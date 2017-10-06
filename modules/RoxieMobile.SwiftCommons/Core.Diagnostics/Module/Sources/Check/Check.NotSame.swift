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
        /// - unexpected: The object you don't expect.
        /// - actual: The object to compare to `unexpected`.
        /// - message: The identifying message for the `CheckError` (`nil` okay).
        /// - Throws: CheckError
        public static void NotSame(object unexpected, object actual, string message = null)
        {
            if (ReferenceEquals(unexpected, actual)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that two objects do not refer to the same object.
        /// </summary>
        /// - unexpected: The object you don't expect.
        /// - actual: The object to compare to `unexpected`.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
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
//    public static func isNotSame<T:AnyObject>(_ unexpected: T?, _ actual: T?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isFalse(unexpected === actual, message, file, line)
//    }

//    /**
//     Checks that two objects do not refer to the same object.
//
//     - Parameters:
//         - unexpected: The object you don't expect.
//         - actual: The object to compare to `unexpected`.
//     */
//    public static func notSame<T:AnyObject>(_ unexpected: T?, _ actual: T?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isFalse(unexpected === actual, message, file, line)
//    }
}

// ----------------------------------------------------------------------------
