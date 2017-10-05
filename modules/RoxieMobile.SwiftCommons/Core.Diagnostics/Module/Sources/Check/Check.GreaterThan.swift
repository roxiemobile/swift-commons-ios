// ----------------------------------------------------------------------------
//
//  Check.GreaterThan.swift
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
        /// Checks that the parameter value is greater than the minimum value.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// <param name="value">The parameter value.</param>
        /// <param name="min">The minimum.</param>
        /// <param name="message">The identifying message for the <see cref="CheckException"/> (<c>null</c> okay).</param>
        /// <exception cref="CheckException" />
        public static void GreaterThan<T>(T value, T min, string message = null)
            where T : IComparable<T>
        {
            if (value.CompareTo(min) <= 0) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that the parameter value is greater than the minimum value.
        /// </summary>
        /// <typeparam name="T">The type of the parameter.</typeparam>
        /// <param name="value">The parameter value.</param>
        /// <param name="min">The minimum.</param>
        /// <param name="block">The function which returns identifying message for the <see cref="CheckException"/>.</param>
        /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
        /// <exception cref="CheckException" />
        public static void GreaterThan<T>(T value, T min, Func<string> block)
            where T : IComparable<T>
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (value.CompareTo(min) <= 0) {
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
