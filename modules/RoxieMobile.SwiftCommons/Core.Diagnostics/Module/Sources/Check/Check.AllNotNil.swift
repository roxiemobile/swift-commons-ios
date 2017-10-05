// ----------------------------------------------------------------------------
//
//  Check.AllNotNil.swift
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
using System.Collections.Generic;
using System.Linq;
using RoxieMobile.CSharpCommons.Extensions;

namespace RoxieMobile.CSharpCommons.Diagnostics
{
    /// <summary>
    /// A set of methods useful for validating objects states. Only failed checks are throws exceptions.
    /// </summary>
    public static partial class Check
    {
// MARK: - Methods: Array

        /// <summary>
        /// Checks that all an objects in array is not <c>null</c>.
        /// </summary>
        /// <param name="objects">An array of objects.</param>
        /// <param name="message">The identifying message for the <see cref="CheckException"/> (<c>null</c> okay).</param>
        /// <exception cref="CheckException" />
        public static void AllNotNull<T>(T[] objects, string message = null)
        {
            if (!TryAllNotNull(objects)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that all an objects in array is not <c>null</c>.
        /// </summary>
        /// <param name="objects">An array of objects.</param>
        /// <param name="block">The function which returns identifying message for the <see cref="CheckException"/>.</param>
        /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
        /// <exception cref="CheckException" />
        public static void AllNotNull<T>(T[] objects, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!TryAllNotNull(objects)) {
                throw NewCheckException(block());
            }
        }

// MARK: - Methods: Generic Collection

        /// <summary>
        /// Checks that all an objects in collection is not <c>null</c>.
        /// </summary>
        /// <param name="collection">A collection of objects.</param>
        /// <param name="message">The identifying message for the <see cref="CheckException"/> (<c>null</c> okay).</param>
        /// <exception cref="CheckException" />
        public static void AllNotNull<T>(ICollection<T> collection, string message = null)
        {
            if (!TryAllNotNull(collection)) {
                throw NewCheckException(message);
            }
        }

        /// <summary>
        /// Checks that all an objects in collection is not <c>null</c>.
        /// </summary>
        /// <param name="collection">A collection of objects.</param>
        /// <param name="block">The function which returns identifying message for the <see cref="CheckException"/>.</param>
        /// <exception cref="ArgumentNullException">Thrown when the <see cref="block"/> is <c>null</c>.</exception>
        /// <exception cref="CheckException" />
        public static void AllNotNull<T>(ICollection<T> collection, Func<string> block)
        {
            if (block == null) {
                throw new ArgumentNullException(nameof(block));
            }

            if (!TryAllNotNull(collection)) {
                throw NewCheckException(block());
            }
        }

// MARK: - Private Methods

        private static bool TryAllNotNull<T>(T[] objects) =>
            objects.IsEmpty() || objects.All(o => o != null);

        private static bool TryAllNotNull<T>(ICollection<T> collection) =>
            collection.IsEmpty() || collection.All(o => o != null);
    }
}
*/

extension Check
{
// MARK: - Methods

//    // TODO
//    @available(*, deprecated)
//    public static func isAllNotNil<T>(_ objects: [T?]?, _ message: String? = nil, _ file: StaticString = #file, _ line: UInt = #line) throws {
//        if CollectionUtils.isNotEmpty(objects) {
//            try isTrue(objects!.all { $0 != nil }, message, file, line)
//        }
//    }
}

// ----------------------------------------------------------------------------
