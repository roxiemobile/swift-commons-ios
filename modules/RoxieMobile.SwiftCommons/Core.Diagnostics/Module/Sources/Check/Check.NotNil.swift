// ----------------------------------------------------------------------------
//
//  Check.NotNil.swift
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
        /// Checks that an object isn't `nil`.
        /// </summary>
        /// - reference: Object to check or `nil`.
        /// - message: The identifying message for the `CheckError` (`nil` okay).
        /// - Throws: CheckError
        public static void NotNull(object reference, string message = null)
        {
            if (reference == null) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that an object isn't `nil`.
        /// </summary>
        /// - reference: Object to check or `nil`.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void NotNull(object reference, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (reference == null) {
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
//    /// Expects that an object isn't nil. If it is an {@link ExpectationError} is thrown with the given message.
//    @available(*, deprecated)
//    public static func isNotNil(_ object: Any?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(object != nil, message, file, line)
//    }

//    /**
//     Checks that an object isn't `nil`.
//
//     - Parameters:
//         - object: Object to check or `nil`.
//         - message: Expects that an object isn't `nil`. If it is an {@link ExpectationError} is thrown with the given message.
//     */
//    public static func notNil(_ object: Any?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(object != nil, message, file, line)
//    }
}

// ----------------------------------------------------------------------------
