// ----------------------------------------------------------------------------
//
//  Check.Valid.swift
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

namespace RoxieMobile.CSharpCommons.Diagnostics
{
    /// <summary>
    /// A set of methods useful for validating objects states. Only failed checks are throws exceptions.
    /// </summary>
    public partial class Check
    {
// MARK: - Methods

        /// <summary>
        /// Checks that an object is not `nil` and valid.
        /// </summary>
        /// - obj: Object to check or `nil`.
        /// - message: The identifying message for the `CheckError` (`nil` okay).
        /// - Throws: CheckError
        public static void Valid(IValidatable obj, string message = null)
        {
            if (!obj?.IsValid() ?? true) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that an object is not `nil` and valid.
        /// </summary>
        /// - obj: Object to check or `nil`.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void Valid(IValidatable obj, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!obj?.IsValid() ?? true) {
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
//    public static func isValid(_ object: Validatable?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(ValidatableUtils.isValid(object), message, file, line)
//    }

//    /**
//     Checks that an object is not `nil` and valid.
//
//     - Parameter object: Object to check or `nil`.
//     */
//    public static func valid(_ object: Validatable?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        try isTrue(ValidatableUtils.isValid(object), message, file, line)
//    }
}

// ----------------------------------------------------------------------------
