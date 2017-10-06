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
        /// Checks that all a string objects in array is not `nil`, not empty and contains not only whitespace characters.
        /// </summary>
        /// - values: An array of string objects.
        /// - message: The identifying message for the `CheckError` (`nil` okay).
        /// - Throws: CheckError
        public static void AllNotBlank(string[] values, string message = null)
        {
            if (!TryAllNotBlank(values)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that all a string objects in array is not `nil`, not empty and contains not only whitespace characters.
        /// </summary>
        /// - values: An array of string objects.
        /// - block: The function which returns identifying message for the `CheckError`.
        /// <exception cref="ArgumentNullException">Thrown when the `block` is `nil`.</exception>
        /// - Throws: CheckError
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
//    public static func isAllNotBlank(_ values: [String]?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(values) {
//            try isTrue(StringUtils.isAllNotBlank(values), message, file, line)
//        }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNotBlank(_ values: [String?]?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(values) {
//            try isTrue(StringUtils.isAllNotBlank(values), message, file, line)
//        }
//    }

//    /**
//     Checks that all a string objects in array is not `nil`, not empty and contains not only whitespace characters.
//
//     - Parameters:
//         -  values: An array of string objects.
//     */
//    public static func allNotBlank(_ values: [String]?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(values) {
//            try isTrue(StringUtils.isAllNotBlank(values), message, file, line)
//        }
//    }
//
//    /**
//     Checks that all a string objects in array is not `nil`, not empty and contains not only whitespace characters.
//
//     - Parameters:
//         -  values: An array of string objects.
//     */
//    public static func allNotBlank(_ values: [String?]?, _ message: @autoclosure () -> String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(values) {
//            try isTrue(StringUtils.isAllNotBlank(values), message, file, line)
//        }
//    }
}

// ----------------------------------------------------------------------------
