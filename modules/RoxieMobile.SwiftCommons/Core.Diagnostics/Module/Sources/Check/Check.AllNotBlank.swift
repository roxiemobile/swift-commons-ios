// ----------------------------------------------------------------------------
//
//  Check.AllNotBlank.swift
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
using System.Linq;
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
        /// Checks that all a string objects in array is not <c>null</c>, not empty and contains not only whitespace characters.
        /// </summary>
        /// <param name="values">An array of string objects.</param>
        /// <param name="message">The identifying message for the <see cref="CheckException"/> (<c>null</c> okay).</param>
        /// <exception cref="CheckException" />
        public static void AllNotBlank(string[] values, string message = null)
        {
            if (!TryAllNotBlank(values)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that all a string objects in array is not <c>null</c>, not empty and contains not only whitespace characters.
        /// </summary>
        /// <param name="values">An array of string objects.</param>
        /// <param name="block">The function which returns identifying message for the <see cref="CheckException"/>.</param>
        /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
        /// <exception cref="CheckException" />
        public static void AllNotBlank(string[] values, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!TryAllNotBlank(values)) {
                throw NewCheckException(block());
            }
        }

// MARK: - Private Methods

        private static bool TryAllNotBlank(string[] values) =>
            values.IsEmpty() || values.All(s => s.IsNotBlank());
    }
}
*/

extension Check
{
// MARK: - Methods

//    // TODO
//    @available(*, deprecated)
//    public static func isAllNotBlank(_ values: [String]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(values) {
//            try isTrue(StringUtils.isAllNotBlank(values), message, file, line)
//        }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNotBlank(_ values: [String?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(values) {
//            try isTrue(StringUtils.isAllNotBlank(values), message, file, line)
//        }
//    }
}

// ----------------------------------------------------------------------------
