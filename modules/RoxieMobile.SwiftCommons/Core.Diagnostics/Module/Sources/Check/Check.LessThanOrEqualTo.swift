// ----------------------------------------------------------------------------
//
//  Check.LessThanOrEqualTo.swift
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
        /// Checks that the parameter value is less than or equal to the maximum value.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - value: The parameter value.
        /// - max: The maximum.
        /// - message: The identifying message for the `CheckError` (`nil` okay).
        /// - Throws: CheckError
        public static void LessThanOrEqualTo<T>(T value, T max, string message = null)
            where T : IComparable<T>
        {
            if (value.CompareTo(max) > 0) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that the parameter value is less than or equal to the maximum value.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - value: The parameter value.
        /// - max: The maximum.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
        public static void LessThanOrEqualTo<T>(T value, T max, Func<string> block)
            where T : IComparable<T>
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (value.CompareTo(max) > 0) {
                throw NewCheckException(block());
            }
        }
    }
}
*/

extension Check
{
// MARK: - Methods

    // TODO
}

// ----------------------------------------------------------------------------
