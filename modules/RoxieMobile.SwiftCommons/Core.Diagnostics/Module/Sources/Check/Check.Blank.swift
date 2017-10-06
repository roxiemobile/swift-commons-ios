// ----------------------------------------------------------------------------
//
//  Check.Blank.swift
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
        /// Checks that a string is `nil`, empty or contains only whitespace characters.
        /// </summary>
        /// - value: The string to check or `nil`.
        /// - message: The identifying message for the `CheckError` (`nil` okay).
        /// - Throws: CheckError
        public static void Blank(string value, string message = null)
        {
            if (!value.IsBlank()) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that a string is `nil`, empty or contains only whitespace characters.
        /// </summary>
        /// - value: The string to check or `nil`.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void Blank(string value, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!value.IsBlank()) {
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
//    public static func isBlank(_ value: String?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(value.isBlank, message, file, line)
//    }

//    /**
//     Checks that a string is `nil`, empty or contains only whitespace characters.
//
//     - Parameters:
//         - value: The string to check or `nil`
//         - message: The identifying message for the
//     */
////    public static func blank(_ value: String?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
////        try isTrue(StringUtils.isBlank(nil), message, file, line)
////    }
//
//    public static func blank(_ value: String?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if !(StringUtils.isBlank(value))
//        {
//            try throwError(message, file, line)
//        }
//    }
}

// ----------------------------------------------------------------------------
