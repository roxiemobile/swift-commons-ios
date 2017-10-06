// ----------------------------------------------------------------------------
//
//  Guard.AllNotEmpty.swift
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
        /// Checks that all a string objects in array is not `nil` and not empty.
        /// </summary>
        /// - values: An array of string objects.
        /// - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
        /// - Throws: GuardException
        public static void AllNotEmpty(string[] values, string message = null)
        {
            if (TryIsFailure(() => Check.AllNotEmpty(values), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that all a string objects in array is not `nil` and not empty.
        /// </summary>
        /// - values: An array of string objects.
        /// - block: The function which returns identifying message for the `GuardException`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void AllNotEmpty(string[] values, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.AllNotEmpty(values), out Exception cause)) {
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
//    public static func isAllNotEmpty(_ values: [String]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllNotEmpty(values) }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNotEmpty(_ values: [String?]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Expect.isAllNotEmpty(values) }
//    }

//    /**
//     Checks that all a string objects in array is not `nil` and not empty.
//
//     - Parameters:
//     -  values: An array of string objects.
//     */
//    public static func allNotEmpty(_ values: [String]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.allNotEmpty(values) }
//    }
//
//    /**
//     Checks that all a string objects in array is not `nil` and not empty.
//
//     - Parameters:
//     -  values: An array of string objects.
//     */
//    public static func allNotEmpty(_ values: [String?]?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
//        rethrowOnFailure(message, file, line) { try Check.allNotEmpty(values) }
//    }
}

// ----------------------------------------------------------------------------
