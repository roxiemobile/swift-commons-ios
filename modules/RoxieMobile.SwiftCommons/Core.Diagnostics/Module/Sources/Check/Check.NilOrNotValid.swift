// ----------------------------------------------------------------------------
//
//  Check.NilOrNotValid.swift
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
        /// Checks that an object is `nil` or not valid.
        /// </summary>
        /// - obj: Object to check or `nil`.
        /// - message: The identifying message for the `CheckError` (`nil` okay).
        /// - Throws: CheckError
        public static void NullOrNotValid(IValidatable obj, string message = null)
        {
            if (!obj.IsNullOrNotValid()) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that an object is `nil` or not valid.
        /// </summary>
        /// - obj: Object to check or `nil`.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void NullOrNotValid(IValidatable obj, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!obj.IsNullOrNotValid()) {
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
//    public static func isNilOrNotValid(_ object: Validatable?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(ValidatableUtils.isNilOrNotValid(object), message, file, line)
//    }

//    /**
//     Checks that an object is `nil` or not valid.
//
//     - Parameter object: Object to check or `nil`.
//     */
//    public static func nilOrNotValid(_ object: Validatable?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(ValidatableUtils.isNilOrNotValid(object), message, file, line)
//    }
}

// ----------------------------------------------------------------------------
