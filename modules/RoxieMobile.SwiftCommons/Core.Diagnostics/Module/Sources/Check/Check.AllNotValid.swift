// ----------------------------------------------------------------------------
//
//  Check.AllNotValid.swift
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
using RoxieMobile.CSharpCommons.Abstractions.Models;
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
        /// Checks that all an objects in array is not <c>null</c> and not valid.
        /// </summary>
        /// <param name="objects">An array of objects.</param>
        /// <param name="message">The identifying message for the <see cref="CheckException"/> (<c>null</c> okay).</param>
        /// <exception cref="CheckException" />
        public static void AllNotValid(IValidatable[] objects, string message = null)
        {
            if (!TryAllNotValid(objects)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that all an objects in array is not <c>null</c> and not valid.
        /// </summary>
        /// <param name="objects">An array of objects.</param>
        /// <param name="block">The function which returns identifying message for the <see cref="CheckException"/>.</param>
        /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
        /// <exception cref="CheckException" />
        public static void AllNotValid(IValidatable[] objects, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!TryAllNotValid(objects)) {
                throw NewCheckException(block());
            }
        }

// MARK: - Private Methods

        private static bool TryAllNotValid(IValidatable[] objects) =>
            objects.IsEmpty() || objects.All(o => o?.IsNotValid() ?? false);
    }
}
*/

extension Check
{
// MARK: - Methods

//    // TODO
//    @available(*, deprecated)
//    public static func isAllNotValid(_ objects: [Validatable]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
//        }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNotValid(_ objects: [Validatable?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
//        }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNotValid<T:Validatable>(_ objects: [T]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
//        }
//    }
//
//    @available(*, deprecated)
//    public static func isAllNotValid<T:Validatable>(_ objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(ValidatableUtils.isAllNotValid(objects), message, file, line)
//        }
//    }
}

// ----------------------------------------------------------------------------
