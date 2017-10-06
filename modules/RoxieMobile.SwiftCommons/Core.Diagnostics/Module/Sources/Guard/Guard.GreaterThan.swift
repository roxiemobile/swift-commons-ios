// ----------------------------------------------------------------------------
//
//  Guard.GreaterThan.swift
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
        /// Checks that the parameter value is greater than the minimum value.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - value: The parameter value.
        /// - min: The minimum.
        /// - message: The identifying message for the `GuardException` (`nil` okay). The default is an empty string.
        /// - Throws: GuardException
        public static void GreaterThan<T>(T value, T min, string message = null)
            where T : IComparable<T>
        {
            if (TryIsFailure(() => Check.GreaterThan(value, min), out Exception cause)) {
                throw NewGuardError(message, cause);
            }
        }

        /// <summary>
        /// Checks that the parameter value is greater than the minimum value.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// - value: The parameter value.
        /// - min: The minimum.
        /// - block: The function which returns identifying message for the `GuardException`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: GuardException
        public static void GreaterThan<T>(T value, T min, Func<string> block)
            where T : IComparable<T>
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (TryIsFailure(() => Check.GreaterThan(value, min), out Exception cause)) {
                throw NewGuardError(block(), cause);
            }
        }
    }
}
*/

extension Guard
{
// MARK: - Methods

    // TODO
}

// ----------------------------------------------------------------------------
