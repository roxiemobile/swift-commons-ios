// ----------------------------------------------------------------------------
//
//  Check.NilOrValid.swift
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
using RoxieMobile.CSharpCommons.Abstractions.Models;
using RoxieMobile.CSharpCommons.Extensions;

namespace RoxieMobile.CSharpCommons.Diagnostics
{
    /// <summary>
    /// A set of methods useful for validating objects states. Only failed checks are throws exceptions.
    /// </summary>
    public partial class Check
    {
// MARK: - Methods

        /// <summary>
        /// Checks that an object is `nil` or valid.
        /// </summary>
        /// - obj: Object to check or `nil`.
        /// - message: The identifying message for the `CheckError` (`nil` okay). The default is an empty string.
        /// - Throws: CheckError
        public static void NullOrValid(IValidatable obj, string message = null)
        {
            if (!obj.IsNullOrValid()) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that an object is `nil` or valid.
        /// </summary>
        /// - obj: Object to check or `nil`.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void NullOrValid(IValidatable obj, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!obj.IsNullOrValid()) {
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
//    public static func isNilOrValid(_ object: Validatable?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(ValidatableUtils.isNilOrValid(object), message, file, line)
//    }

//    /**
//     Checks that an object is `nil` or valid.
//
//     - Parameter object: Object to check or `nil`.
//     */
//    public static func nilOrValid(_ object: Validatable?, _ message: @autoclosure () -> String = "", _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(ValidatableUtils.isNilOrValid(object), message, file, line)
//    }
}

// ----------------------------------------------------------------------------
