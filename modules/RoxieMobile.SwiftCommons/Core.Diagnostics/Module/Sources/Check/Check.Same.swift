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
        /// Checks that two objects refer to the same object. If they are not, an `CheckError`
        /// is thrown with the given message.
        /// </summary>
        /// - expected: The expected object
        /// - actual: The object to compare to `expected`
        /// - message: The identifying message for the `CheckError` (`nil` okay)
        /// - Throws: CheckError
        public static void Same(object expected, object actual, string message = null)
        {
            if (!ReferenceEquals(expected, actual)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that two objects refer to the same object. If they are not, an `CheckError`
        /// is thrown with the given message.
        /// </summary>
        /// - expected: The expected object
        /// - actual: The object to compare to `expected`
        /// - block: The function which returns identifying message for the `CheckError`
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
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
//    public static func isSame<T:AnyObject>(_ expected: T?, _ actual: T?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(expected === actual, message, file, line)
//    }

//    /**
//     Checks that two objects refer to the same object. If they are not, an `GuardException` is thrown with the given message.
//
//     - Parameters:
//         - expected: Expects that two objects refer to the same object. If they are not, an {@link ExpectationError} is thrown with the given message.
//         - actual: The object to compare to `expected`.
//     */
//    public static func same<T:AnyObject>(_ expected: T?, _ actual: T?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(expected === actual, message, file, line)
//    }
}

// ----------------------------------------------------------------------------
