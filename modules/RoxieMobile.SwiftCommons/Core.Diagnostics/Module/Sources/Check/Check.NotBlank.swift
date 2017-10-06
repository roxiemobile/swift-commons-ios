// ----------------------------------------------------------------------------
//
//  Check.NotBlank.swift
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
using RoxieMobile.CSharpCommons.Extensions;

namespace RoxieMobile.CSharpCommons.Diagnostics
{
    /// <summary>
    /// A set of methods useful for validating objects states. Only failed checks are throws exceptions.
    /// </summary>
    public static partial class Check
    {
// MARK: - Methods

        /// <summary>
        /// Checks that a string is not `nil`, not empty and contains not only whitespace characters.
        /// </summary>
        /// - value: The string to check or `nil`.
        /// - message: The identifying message for the `CheckError` (`nil` okay).
        /// - Throws: CheckError
        public static void NotBlank(string value, string message = null)
        {
            if (!value.IsNotBlank()) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that a string is not `nil`, not empty and contains not only whitespace characters.
        /// </summary>
        /// - value: The string to check or `nil`.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void NotBlank(string value, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!value.IsNotBlank()) {
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
//    @available(*, deprecated)
//    public static func isNotBlank(_ value: String?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(value.isNotBlank, message, file, line)
//    }

//    /**
//     Checks that a string is not `nil`, not empty and contains not only whitespace characters.
//
//     - Parameter value: The string to check or `nil`.
//     */
//    public static func notBlank(_ value: String?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(StringUtils.isNotBlank(value), message, file, line)
//    }
}

// ----------------------------------------------------------------------------
